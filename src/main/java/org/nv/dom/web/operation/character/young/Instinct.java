package org.nv.dom.web.operation.character.young;

import static java.util.stream.Collectors.groupingBy;

import java.util.ArrayList;
import java.util.Arrays;
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
public class Instinct extends Operation{
	
	public Instinct() {
		operationId = 190;
	}

	@Override
	public void check(Map<String, Object> param) {

	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		long gameId = (long) param.get("gameId");
		List<PlayerInfo> playerInfo = gameUtil.getPlayerInfo(gameId);
		PlayerInfo young = findTarget(playerInfo, player -> player.getCharacterId() == 36);
		if(young == null || young.getIsLife() == 0 || 
				young.getIsSp() == 1 || young.getSign() == IdentityCode.PIONEER.getCode()){
			return null;
		}
		Map<String, List<PlayerInfo>> temp = playerInfo.stream()
				.filter(player -> player.getCharacterId() != 36)
				.filter(player -> player.getIsLife() == 1)
				.collect(groupingBy(player -> identify(player)));
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		record.setPlayerId(young.getPlayerId());
		record.setOperationStr("扬触发直觉");
		PlayerFeedback feedback = new PlayerFeedback();
		feedback.setPlayerId(young.getPlayerId());
		feedback.setCharacterName(young.getCharacterName());
		feedback.setFeedback("直觉名单："+buildNotice(young,temp));
		record.setFeedback(Arrays.asList(feedback));
		return record;
	}

	private String buildNotice(PlayerInfo young, Map<String, List<PlayerInfo>> group) {
		String notice; 
		List<PlayerInfo> groupOne, groupTwo;
		if(young.getCamp() == NVTermConstant.GOOD_CAMP){
			groupOne = group.getOrDefault("BS", new ArrayList<>());
			groupTwo = group.getOrDefault("GS", new ArrayList<>());
			groupTwo.addAll(group.getOrDefault("NM", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NS", new ArrayList<>()));
		} else {
			groupOne = group.getOrDefault("GS", new ArrayList<>());
			groupTwo = group.getOrDefault("BS", new ArrayList<>());
			groupTwo.addAll(group.getOrDefault("NM", new ArrayList<>()));
			groupTwo.addAll(group.getOrDefault("NS", new ArrayList<>()));
		}
		notice = rollCharacter(groupOne, 1, groupTwo, 4);
		return notice == null ? "无反馈" : notice;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.NIGNT_START_EVENT, this);	
	}
	
	private String identify(PlayerInfo player){
		if(player.getCamp() == NVTermConstant.GOOD_CAMP){
			if(player.getIsSpecial() == 1){
				return "GS";
			} else {
				return "NM"; 
			}
		} else if(player.getCamp() == NVTermConstant.KILLER_CAMP){
			if(player.getIsSpecial() == 1){
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

}
