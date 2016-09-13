package org.nv.dom.web.dao.player;

import java.util.List;

import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerReplaceSkin;
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
	 * <p>游戏结束后统一更新状态</p>
	 */
	
	public int updatePlayerStatus(long gameId);
}
