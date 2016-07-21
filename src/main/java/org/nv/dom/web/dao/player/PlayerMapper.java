package org.nv.dom.web.dao.player;

import java.util.List;

import org.nv.dom.domain.player.PlayerInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerMapper {
	
	/**
	 * <p>获取进行中版杀的玩家信息</p>
	 */
	public List<PlayerInfo> getPlayerInfosDao(long gameId);

}
