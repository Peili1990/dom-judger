package org.nv.dom.web.dao.player;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.player.UpdatePlayerStatusDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerMapper {
	
	/**
	 * <p>获取进行中版杀的玩家信息</p>
	 */
	public List<PlayerInfo> getPlayerInfosDao(long gameId);
	
	/**
	 * <p>获取进行中版杀存活玩家名单</p>
	 */
	public List<PlayerInfo> getAlivePlayersDao(long gameId);
	
	/**
	 * <p>获取发言替代称呼列表</p>
	 */
	public List<PlayerReplaceSkin> getReplaceSkinDao(long playerId);
	
	/**
	 * <p>保存或更新替代称呼</p>
	 */
	public int createOrUpdateReplaceSkinDao(PlayerReplaceSkin playerReplaceSkin);
	
	/**
	 * <p>删除替代称呼</p>
	 */
	public int deleteReplaceSkinDao(long skinId);
	
	/**
	 * <p>统一更新玩家状态</p>
	 */
	
	public int updatePlayerStatus(UpdatePlayerStatusDTO updatePlayerStatusDTO);
	
	/**
	 * <p>更新一个玩家状态</p>
	 */
	
	public int updateOnePlayerStatus(UpdatePlayerStatusDTO updatePlayerStatusDTO);
	
	/**
	 * <p>插入玩家操作</p>
	 */
	public int insertPlayerOperationRecord(PlayerOperationRecord playerOperationRecord);
	
	/**
	 * <p>删除玩家操作</p>
	 */
	public int deletePlayerOperationRecord(@Param("formId")long formId,@Param("playerId")long playerId);
	
	/**
	 * <p>根据玩家id获取用户id</p>
	 */
	public long getUserIdByPlayerId(long playerId);
	
	/**
	 * <p>批量插入玩家反馈</p>
	 */
	public int insertPlayerFeedbackBatch(List<PlayerFeedback> feedbacks);

	/**
	 * <p>获取玩家初始操作</p>
	 */
	public List<PlayerOperation> initPlayerOperation(int sign);
	
	/**
	 * <p>初始化玩家操作</p>
	 */
	public int insertInitPlayerOperation(List<PlayerOperation> operations);

	/**
	 * <p>获取该阶段玩家操作列表</p>
	 */
	public List<PlayerOperation> getPlayerOperationList(@Param("playerId")long playerId, @Param("stage")int stage);

	/**
	 * <p>获取该阶段玩家操作记录</p>
	 */
	public List<PlayerOperationRecord> getPlayerOperationRecord(@Param("playerId")long playerId, @Param("formId")long formId);

	/**
	 * <p>获取所有的发言称呼</p>
	 */
	public List<PlayerReplaceSkin> getAllReplaceSkinDao(long gameId);
	
	/**
	 * <p>获取该阶段所有的操作</p>
	 */
	public List<PlayerOperationRecord> getCurStageAllOperation(long formId);
	
	/**
	 * <p>获取该阶段所有的反馈</p>
	 */
	public List<PlayerFeedback> getCurStageAllFeedback(long formId);
}
