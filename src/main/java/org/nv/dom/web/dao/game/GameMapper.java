package org.nv.dom.web.dao.game;

import java.util.List;

import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.user.UserApplyInfo;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface GameMapper {
	
	/**
	 * <p>获取报名中的版杀信息</p>
	 */
	public ApplyingGame getApplyingGamesDao(long userId);
	/**
	 * <p>获取版杀参与玩家信息</p>
	 */
	public List<UserApplyInfo> queryGamePlayerDao(long gameId);
	/**
	 * <p>查询玩家是否报名或参与其他版杀</p>
	 */
	public int queryHasAttendGameDao(long userId);
	/**
	 * <p>报名版杀主持法官</p>
	 */
	public int applyForGameDao(ApplyDTO applyDTO);
	/**
	 * <p>发布报名帖</p>
	 */
	public int publishGameDao(PublishGameDTO publishGameDTO);
	/**
	 * <p>修改版杀状态</p>
	 */
	public int changeStatusDao(ChangeStatusDTO changeStatusDTO);
	/**
	 * <p>更新全名单</p>
	 */
	public int submitApplyListDao(List<PlayerInfo> playerList);
	/**
	 * <p>获取全部表格</p>
	 */
	public List<GameForm> getFormListDao(long gameId);
	/**
	 * <p>创建或更新表格</p>
	 */
	public int createOrUpdateFormDao(GameForm form);
	
	
}
