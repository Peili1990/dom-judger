package org.nv.dom.dto.player;

import java.util.List;

import org.nv.dom.domain.player.PlayerFeedback;

public class SaveFeedbackDTO {
	
	private long judegerId;
	
	private long gameId;
	
	private long operationRecordId;
	
	private long playerId;
	
	private long operationId;
	
	private int isDone;
	
	private boolean feedbackNow;
	
	private List<PlayerFeedback> feedbacks;

	public long getJudegerId() {
		return judegerId;
	}

	public void setJudegerId(long judegerId) {
		this.judegerId = judegerId;
	}

	public long getGameId() {
		return gameId;
	}

	public void setGameId(long gameId) {
		this.gameId = gameId;
	}

	public long getOperationRecordId() {
		return operationRecordId;
	}

	public void setOperationRecordId(long operationRecordId) {
		this.operationRecordId = operationRecordId;
	}

	public boolean isFeedbackNow() {
		return feedbackNow;
	}

	public void setFeedbackNow(boolean feedbackNow) {
		this.feedbackNow = feedbackNow;
	}

	public List<PlayerFeedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(List<PlayerFeedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public long getOperationId() {
		return operationId;
	}

	public void setOperationId(long operationId) {
		this.operationId = operationId;
	}

	public int getIsDone() {
		return isDone;
	}

	public void setIsDone(int isDone) {
		this.isDone = isDone;
	}

}
