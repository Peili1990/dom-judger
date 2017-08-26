package org.nv.dom.dto.player;

import java.util.List;

import org.nv.dom.domain.player.PlayerFeedback;

public class SaveFeedbackDTO {
	
	private long operationRecordId;
	
	private boolean feedbackNow;
	
	private List<PlayerFeedback> feedbacks;

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
	
	

}
