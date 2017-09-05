package org.nv.dom.web.operation.character.ekka;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.joining;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class EkkasVillas extends Operation{
	
	public EkkasVillas() {
		operationId = 58;
	}

	@Override
	public boolean check(Map<String, Object> param) {
		return true;
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		long gameId = (long) param.get("gameId");
		List<PlayerInfo> playerInfo = gameUtil.getPlayerInfo(gameId);
		PlayerInfo ekka = findTarget(playerInfo, player -> player.getCharacterId() == 5);
		if(ekka == null || ekka.getIsLife() == 0 || 
				ekka.getIsSp() == 1 || ekka.getSign() == IdentityCode.PIONEER.getCode()){
			return null;
		}
		Map<String, List<PlayerInfo>> temp = playerInfo.stream()
				.filter(player -> player.getCharacterId() != 5)
				.filter(player -> player.getIsLife() == 1)
				.collect(groupingBy(player -> identify(player)));
		int point = rolldice(gameId, ekka);
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		record.setPlayerId(ekka.getPlayerId());
		record.setOperationStr("小筑的伊卡");
		PlayerFeedback feedback = new PlayerFeedback();
		feedback.setPlayerId(ekka.getPlayerId());
		feedback.setCharacterName(ekka.getCharacterName());
		feedback.setFeedback("骰子结果："+point+"，"+buildNotice(point,temp));
		record.setFeedback(Arrays.asList(feedback));
		return record;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.DAY_START_EVENT, this);		
	}
	
	private String identify(PlayerInfo player){
		if(player.getCamp() == NVTermConstant.GOOD_CAMP){
			if(player.getSign() < 7){
				return "GP";
			} else if(player.getIsSpecial() == 1){
				return "GS";
			} else {
				return "NM"; 
			}
		} else if(player.getCamp() == NVTermConstant.KILLER_CAMP){
			if(player.getSign() > 12 && player.getSign() < 19){
				return "BK";
			} else if(player.getIsSpecial() == 1){
				return "BS";
			} else {
				return "NM";
			}
		} else {
			if(player.getIsSpecial() == 1){
				return "NS";
			} else {
				return "NM";
			}
		}
	}
	
	private int rolldice(long gameId, PlayerInfo ekka){
		int point = randomNum(20)+1;
		if((point == 19 || point == 17 || point == 18) && ekka.getSign() < 7){
			return rolldice(gameId, ekka);
		}
		if((point == 20 || point == 15 || point == 16) && ekka.getSign() > 12 && ekka.getSign() < 19){
			return rolldice(gameId, ekka);
		}
		if(point == 19 || point == 20){
			List<PlayerFeedback> feedbacks = gameUtil.getAllStageFeedback(gameId);
			PlayerFeedback playerFeedback = feedbacks.stream()
					.filter(feedback -> feedback.getPlayerId() == ekka.getPlayerId())
					.filter(feedback -> feedback.getFeedback().contains("剩余"))
					.findAny().orElse(null);
			if(playerFeedback != null){
				return rolldice(gameId, ekka);
			}
		}
		return point;
	}
	
	private String buildNotice(int point, Map<String, List<PlayerInfo>> group){
		String notice; 
		List<PlayerInfo> groupOne, groupTwo;
		if(point <= 6){
			groupOne = group.getOrDefault("GP", new ArrayList<>());
			groupOne.addAll(group.getOrDefault("GS", new ArrayList<>()));
			groupOne.addAll(group.getOrDefault("BK", new ArrayList<>()));
			groupOne.addAll(group.getOrDefault("BS", new ArrayList<>()));
			groupOne.addAll(group.getOrDefault("NS", new ArrayList<>()));
			groupTwo = group.getOrDefault("NM", new ArrayList<>());
			notice = rollCharacter(groupOne, 2, groupTwo, 2);
			notice = notice == null ? "无反馈" : "晚上仿佛听到"+notice+"说话的声音。";
		} else if(point > 6 && point <= 10){
			groupOne = group.getOrDefault("BK", new ArrayList<>());
			groupOne.addAll(group.getOrDefault("BS", new ArrayList<>()));
			groupTwo = group.getOrDefault("GP", new ArrayList<>());
			groupTwo.addAll(group.getOrDefault("GS", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NM", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NS", new ArrayList<>()));
			notice = rollCharacter(groupOne, 2, groupTwo, 2);
			notice = notice == null ? "无反馈" : notice + "的样子不像是好人。";
		} else if(point > 10 && point <= 14){
			groupOne = group.getOrDefault("GP", new ArrayList<>());
			groupOne.addAll(group.getOrDefault("GS", new ArrayList<>()));
			groupTwo = group.getOrDefault("BK", new ArrayList<>());
			groupTwo.addAll(group.getOrDefault("BS", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NM", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NS", new ArrayList<>()));
			notice = rollCharacter(groupOne, 2, groupTwo, 2);
			notice = notice == null ? "无反馈" : notice + "的样子像是好人。";
		} else if(point > 14 && point <= 16){
			groupOne = group.getOrDefault("BK", new ArrayList<>());
			groupTwo = group.getOrDefault("GP", new ArrayList<>());
			groupTwo.addAll(group.getOrDefault("GS", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("BS", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NM", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NS", new ArrayList<>()));
			notice = rollCharacter(groupOne, 1, groupTwo, 3);
			notice = notice == null ? "无反馈" : notice + "的样子像是杀手。";
		} else if(point > 16 && point <= 18){
			groupOne = group.getOrDefault("GP", new ArrayList<>());
			groupTwo = group.getOrDefault("BK", new ArrayList<>());
			groupTwo.addAll(group.getOrDefault("GS", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("BS", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NM", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NS", new ArrayList<>()));
			notice = rollCharacter(groupOne, 1, groupTwo, 3);
			notice = notice == null ? "无反馈" : notice + "的样子像是警察。";
		} else if(point == 19){
			notice = "剩余好人方警察人数"+group.getOrDefault("GP", new ArrayList<>()).size()+"人";
		} else {
			notice = "剩余杀手方杀手人数"+group.getOrDefault("BK", new ArrayList<>()).size()+"人";
		}
		return notice;
	}
	
	private String rollCharacter(List<PlayerInfo> groupOne,int numOne,List<PlayerInfo> groupTwo,int numTwo){
		List<PlayerInfo> list = new ArrayList<>();
		Collections.shuffle(groupOne);
		List<PlayerInfo> stepOne = groupOne.subList(0, numOne);
		if(stepOne.stream().anyMatch(player -> player.getCharacterId() == 41 && player.getIsSp() == 0)){
			return null;
		}
		list.addAll(stepOne);
		Collections.shuffle(groupTwo);
		List<PlayerInfo> stepTwo = groupTwo.subList(0, numTwo);
		stepTwo.removeIf(player -> player.getCharacterId() == 41 && player.getIsSp() == 0);
		list.addAll(stepTwo);
		Collections.shuffle(list);
		return list.stream().map(PlayerInfo::getCharacterName).collect(joining("，"));
	}

}
