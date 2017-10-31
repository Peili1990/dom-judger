package org.nv.dom.web.operation.character.lee;

import static java.util.stream.Collectors.counting;
import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.nv.dom.config.EventList;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.OperationSession;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class Poker extends Operation {

	public Poker() {
		operationId = 215;
	}
	
	private Map<Long, PokerSession> pokerManager = new HashMap<>();

	@Override
	public void check(Map<String, Object> param) {
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		Assert.isTrue(!pokerManager.containsKey(record.getPlayerId()),"你正在打牌中");
		List<PlayerOperationRecord> historical = gameUtil.getCurStageRecords(get(param,OperationParam.GAME_ID));
		Assert.isTrue(historical.stream()
				.filter(history -> history.getOperationId() == operationId)
				.noneMatch(history -> getSequence(getOriginParam(history.getParam())[0]) == getSequence(getOriginParam(record.getParam())[0])), "不可指定重复角色");
		
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = get(param, OperationParam.EVENT);
		switch (event) {
		case EventList.OPERATION_SUBMIT_EVENT:
			PlayerOperationRecord record = buildPlayerOperationRecord(param);
			PokerSession session = new PokerSession();
			List<PlayerInfo> playerInfos = get(param, OperationParam.PLAYER_INFO);
			playerInfos.removeIf(player -> {
				if(player.getPlayerId() == record.getPlayerId()){
					session.setBanker(player);
					return true;
				} else if(player.getPlayerId() == getSequence(getOriginParam(record.getParam())[0])){
					session.setTarget(player);
					return true;
				}
				return false;
			});
			session.setDeck(playerInfos);
			session.setRecord(record);
			pokerStart(session);
			break;
		case EventList.CHAT_SUBMIT_EVENT:
			OperationSession operationSession = get(param, OperationParam.SESSION);
			session = pokerManager.get(operationSession.getSessionId());
			if(session == null){
				break;
			}
			String command = operationSession.getCommand();
			if(session.getStep() == 1 && (command.equals("男") || command.equals("女")) && 
					operationSession.getPlayerId() == session.getTarget().getPlayerId()){
				session.setWinSex(command.equals("男") ? 0 : 1);
				firstList(session);
			}
			List<Integer> box = StringUtil.oneToFive(command);
			if(session.getStep() == 2 && box != null && 
					operationSession.getPlayerId() == session.getBanker().getPlayerId()){
				session.setSecondList(box.stream().map(session.getFirstList()::get).collect(toList()));
				secondList(session);
			}
			break;
		}
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT,this);
		eventService.registerEvent(EventList.CHAT_SUBMIT_EVENT, this);
	}
	
	private void pokerStart(PokerSession pokerSession){
		Map<Integer,Long> sexCount = pokerSession.getDeck().stream()
				.collect(groupingBy(PlayerInfo::getSex, counting()));
		int winNum = randomNum(5)+1;
		pokerSession.setWinNum(winNum);
		pokerSession.setStep(1);
		PlayerFeedback bankerFeedback = buildPlayerFeedback(pokerSession.getBanker(), pokerSession.banker.getPlayerId());
		bankerFeedback.setFeedback("当前名单为"+sexCount.get(0)+"男"+sexCount.get(1)+"女<br>随机生成的数字是"+winNum);
		PlayerFeedback targetFeedback = buildPlayerFeedback(pokerSession.getTarget(), pokerSession.banker.getPlayerId());
		targetFeedback.setFeedback(pokerSession.getBanker().getCharacterName()+"找你打牌<br>"+
				bankerFeedback.getFeedback()+"<br>请在5分钟内选择性别。");
		gameUtil.sendMessage(Arrays.asList(bankerFeedback,targetFeedback), NVTermConstant.ADMINISTRATOR);
		pokerSession.timerBegin(new TimerTask() {			
			@Override
			public void run() {
				firstList(pokerSession);			
			}
		},5);
		pokerManager.put(pokerSession.banker.getPlayerId(), pokerSession);	
	}
	
	private void firstList(PokerSession pokerSession){
		pokerSession.timerEnd();
		if(pokerSession.getWinSex() == null){
			pokerSession.setWinSex(randomNum(2));
		}
		Collections.shuffle(pokerSession.getDeck());
		List<PlayerInfo> firstList = pokerSession.getDeck().subList(0, 5);
		firstList.removeIf(player -> player.getCharacterId() == 41 && player.getIsSp() == 0);
		pokerSession.setFirstList(firstList);
		Map<Integer,Long> sexCount = firstList.stream()
				.collect(groupingBy(PlayerInfo::getSex, counting()));
		pokerSession.setStep(2);
		PlayerFeedback bankerFeedback = buildPlayerFeedback(pokerSession.getBanker(), pokerSession.getBanker().getPlayerId());
		bankerFeedback.setFeedback("性别是"+(pokerSession.getWinSex() == 0 ? "男" : "女")+"<br>第一份名单："+
				buildList(firstList)+"<br>当前名单"+sexCount.get(0)+"男"+sexCount.get(1)+"女<br>请在10分钟内锁定手牌");
		gameUtil.sendMessage(Arrays.asList(bankerFeedback), NVTermConstant.ADMINISTRATOR);
		pokerSession.timerBegin(new TimerTask() {			
			@Override
			public void run() {
				secondList(pokerSession);			
			}
		},10);
		pokerManager.put(pokerSession.banker.getPlayerId(), pokerSession);
	}
	
	private void secondList(PokerSession pokerSession){
		pokerSession.timerEnd();
		int tailer = 10 - pokerSession.getSecondList().size();
		List<PlayerInfo> secondList = pokerSession.getSecondList();
		secondList.addAll(pokerSession.getDeck().subList(5, tailer));
		secondList.removeIf(player -> player.getCharacterId() == 41 && player.getIsSp() == 0);
		Map<Integer,Long> sexCount = secondList.stream()
				.collect(groupingBy(PlayerInfo::getSex, counting()));
		boolean win = (pokerSession.getWinSex() == 0 && sexCount.get(0) == pokerSession.getWinNum()) ||
				(pokerSession.getWinSex() == 1 && sexCount.get(1) == pokerSession.getWinNum());
		PlayerOperationRecord record = pokerSession.getRecord();
		int effect = getSequence(getOriginParam(record.getParam())[1]);
		String detail = EffectEnum.getByCode(effect).getMessage();
		PlayerFeedback bankerFeedback = buildPlayerFeedback(pokerSession.getBanker(), 0);
		bankerFeedback.setFeedback("第二份名单："+buildList(secondList)+
				"<br>当前名单"+sexCount.get(0)+"男"+sexCount.get(1)+"女<br>");
		gameUtil.sendMessage(Arrays.asList(bankerFeedback), NVTermConstant.ADMINISTRATOR);
		bankerFeedback.setFeedback(win ? "打牌成功！" : "打牌失败！");
		PlayerFeedback targetFeedback = buildPlayerFeedback(pokerSession.getTarget(), 0);
		targetFeedback.setFeedback((win ? "打牌成功！你的灵魂受到震颤，被控制"+detail+"。" : "打牌失败！"));
		record.setFeedback(Arrays.asList(bankerFeedback, targetFeedback));
		gameUtil.consumeOperationTimes(Arrays.asList(
				new PlayerOperation(record.getPlayerId(),operationId,EffectEnum.getByCode(effect).getTimes())));
		pokerManager.remove(pokerSession.getBanker().getPlayerId());
		Map<String, Object> param = new HashMap<>();
		param.put(OperationParam.SETTLE_RESULT, record);
		accept(param);
	}
	
	public enum EffectEnum {
		
		VOTE(1,"投票",1,999),
		SPEECH(2,"发言",2,4),
		PRIVILEGE(3,"使用特权",2,2),
		ACTION(4,"行动",4,1);
		
		private final Integer code;
		private final String message;
		private final Integer times;
		private final Integer max;
		
		private EffectEnum(Integer _code, String _message, Integer _times, Integer _max) {
			this.code = _code;
			this.message = _message;
			this.times = _times;
			this.max = _max;
		}
		public Integer getCode() {
			return code;
		}
		public String getMessage() {
			return message;
		}
		public Integer getTimes() {
			return times;
		}
		public Integer getMax() {
			return max;
		}
		
		public static EffectEnum getByCode(Integer code) {
			for (EffectEnum _enum : values()) {
				if (code.equals(_enum.getCode())) {
					return _enum;
				}
			}
			return null;
		}
		
	}
	
	private String buildList(List<PlayerInfo> list){
		return list.stream().map(PlayerInfo::getCharacterName).collect(joining(" "));
	}
	
	public class PokerSession {
		
		private Timer timer;
		
		private PlayerOperationRecord record;
		
		private List<PlayerInfo> deck;
		
		private int step;
		
		private int winNum;
		
		private Integer winSex;
		
		private List<PlayerInfo> firstList;
		
		private List<PlayerInfo> secondList;
		
		private PlayerInfo banker;
		
		private PlayerInfo target;

		public void timerBegin(TimerTask task, int delay){
			timer = new Timer();
			timer.schedule(task, delay * 60 * 1000);
		}
		
		public void timerEnd(){
			timer.cancel();
		}

		public PlayerOperationRecord getRecord() {
			return record;
		}

		public void setRecord(PlayerOperationRecord record) {
			this.record = record;
		}

		public List<PlayerInfo> getDeck() {
			return deck;
		}

		public void setDeck(List<PlayerInfo> deck) {
			this.deck = deck;
		}

		public int getStep() {
			return step;
		}

		public void setStep(int step) {
			this.step = step;
		}

		public int getWinNum() {
			return winNum;
		}

		public void setWinNum(int winNum) {
			this.winNum = winNum;
		}

		public Integer getWinSex() {
			return winSex;
		}

		public void setWinSex(Integer winSex) {
			this.winSex = winSex;
		}

		public List<PlayerInfo> getFirstList() {
			return firstList;
		}

		public void setFirstList(List<PlayerInfo> firstList) {
			this.firstList = firstList;
		}

		public List<PlayerInfo> getSecondList() {
			return secondList;
		}

		public void setSecondList(List<PlayerInfo> secondList) {
			this.secondList = secondList;
		}

		public PlayerInfo getBanker() {
			return banker;
		}

		public void setBanker(PlayerInfo banker) {
			this.banker = banker;
		}

		public PlayerInfo getTarget() {
			return target;
		}

		public void setTarget(PlayerInfo target) {
			this.target = target;
		}
		
	}

}
