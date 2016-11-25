<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js">
<head>
  <title>法官后台结算管理系统 - 维多利亚的噩梦</title>
  <jsp:include page="../layout/common.jsp"></jsp:include>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
</head>

<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/chat-panel.jsp"></jsp:include>
<div class="am-cf admin-main">
  <jsp:include page="../layout/sider-bar.jsp"></jsp:include>

  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">报名管理</strong> / <small>Apply management</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-3 am-u-md-push-9"> 
      	<div class="am-panel am-panel-default">
          <div class="am-panel-bd">
            <div class="user-info">
              <p>版杀信息</p>
              	<p class="user-info-order">
              	<c:choose>
                  <c:when test="${ applyingGame != null }">
                  	版杀名称：<strong>${ applyingGame.gameDesc }</strong><br>
              		当前状态：<strong>${ applyingGame.gameStatusDesc }</strong><br>
              		报名人数：<strong>${ applyingGame.playCurNum }/${ applyingGame.playerNum }</strong><br>
                  	开版时间：<strong>${ applyingGame.startDate }</strong><br>
                  	<c:if test="${ applyingGame.gameStatus == 1 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="changeGameStatus(${applyingGame.id},2)">结束报名</button>
                       <button type="button" class="am-btn am-btn-danger am-btn-xs" onclick="">修改报名帖</button></p>
                  	</c:if>
                  	<c:if test="${ applyingGame.gameStatus == 2 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="extractIdentity()">抽取身份</button>
                       <button type="button" class="am-btn am-btn-danger am-btn-xs" onclick="submitList(${applyingGame.id})">提交全名单</button></p>
                  	</c:if>
                  	<c:if test="${ applyingGame.gameStatus == 3 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="changeGameStatus(${applyingGame.id},4)">开始游戏</button></p>
                  	</c:if>
                  	<c:if test="${ applyingGame.gameStatus == 4 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="queryGameResult(${applyingGame.id})">结束游戏</button></p>
                  	</c:if>
                  	<c:if test="${ applyingGame.gameStatus == 5 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="changeGameStatus(${applyingGame.id},9)">复盘结束</button></p>
                  	</c:if>
                  </c:when>
                  <c:otherwise>
                  	目前没有正在报名的版杀
                  </c:otherwise>
              	</c:choose>     
              	</p>
            </div>   
          </div>
          <c:if test="${applyingGame != null && applyingGame.gameStatus == 1 }">
          <div class="am-panel-bd">
          	<div class="user-info">
          	   <p>申请法官信息</p>
          	   <form class="am-form">
				  <table class="am-table am-table-striped am-table-hover table-main">
				  	<thead>
					  	<tr>
							<th>id</th>	
							<th class="table-set" style="width:100px">操作</th>
					  	</tr>
					</thead>
					<tbody>
						<c:forEach items="${applyingGame.alterJudgers }" var="alterJudger">
							<tr>
              					<td>${ alterJudger.nickname }</td>
             					<td>
								<div class="am-btn-toolbar">
                  				  <div class="am-btn-group am-btn-group-xs">
                    				<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="同意" onclick="judgerDecision(${alterJudger.playerId},'yes')"><span class="am-icon-thumbs-o-up"></span></button>
                   					<button type="button" class="am-btn am-btn-default am-btn-xs" title="拒绝" onclick="judgerDecision(${alterJudger.playerId},'no')"><span class="am-icon-thumbs-o-down"></span></button>    					
                  				  </div>
                				</div>
								</td>
             				</tr>
						</c:forEach>
					</tbody>
					
				  </table>
			   </form>	   
          	</div>
          </div>
          </c:if>
        </div>
      </div>

      <div class="am-u-sm-12 am-u-md-9 am-u-md-pull-3">
      
      	<div class="am-panel am-panel-default" id="apply-detail">
          <div class="am-panel-bd">
            <div class="user-info">
              <p>报名情况</p>
              <p class="user-info-order">
              	<c:choose>
                  <c:when test="${ applyingGame != null }">
                  	<form class="am-form">
					  <table class="am-table am-table-striped am-table-hover table-main">
						<thead>
						  <tr>
							<th>编号</th>
							<th>id</th>	
							<th>报名时间</th>
							<th>外在身份</th>
							<th>申请先驱</th>
							<th>实际身份</th>
							<th class="table-set">操作</th>
						  </tr>
						</thead>
						<tbody id="apply-info">
							<c:forEach items="${ applyingGame.players }" var="player" varStatus="playerStatus">
							  <tr>
              					<td>${ playerStatus.index+1 }</td>
             					<td>${ player.nickname }</td>
              					<td>${ player.applyTime }</td>
              					<td>${ player.characterName }</td>
              					<td>${ player.applyPioneer }</td>             					
              					<td>${ player.identityDesc == null ? "":player.identityDesc }</td>
              					<td>
                				<div class="am-btn-toolbar">
                  				  <div class="am-btn-group am-btn-group-xs">
                    				<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="查看版杀记录"><span class="am-icon-pencil-square-o"></span></button>
                   					<button type="button" class="am-btn am-btn-default am-btn-xs" title="发送消息" onclick="establishChat(${player.playerId},'player')"><span class="am-icon-paper-plane-o"></span></button>
                   					<c:if test="${ applyingGame.gameStatus == 1 }">
                    					<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="踢出游戏" onclick="myPrompt('被踢出的玩家将无法再次报名本次版杀<br/>请输入踢出理由','kickPlayer(${player.playerId})')"><span class="am-icon-trash-o"></span></button>
                  				  	</c:if>
                  				  </div>
                				</div>
              					</td>
              				  </tr>
							</c:forEach>
						</tbody>
					  </table>
					</form>
                  </c:when>
                  <c:otherwise>
                  	目前没有正在报名的版杀          	
                    <p><button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="showApplyForm()">新建版杀</button>
                       <button type="button" class="am-btn am-btn-danger am-btn-xs" onclick="showApplyList()">申请成为其他版杀法官</button></p>
                  </c:otherwise>
              	</c:choose>
              </p>
            </div>     
          </div>
        </div>
      	
        <form class="am-form am-form-horizontal" id="apply-publish" style="display:none">
          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">版杀名称</label>
            <div class="am-u-sm-9">
              <input type="text" id="game-desc" placeholder="版杀名称">
            </div>
          </div>

          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">法官配置</label>
            <div class="am-u-sm-9">
              <input type="text" value="${ sessionUser.nickname }" disabled="disabled">
            </div>
          </div>

          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">人数配置</label>
            <div class="am-u-sm-9">
              <select data-am-selected id="player-num">
              	 <option value="19">19</option>
  				 <option value="22">22</option>
              </select>
            </div>
          </div>

          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">QQ群</label>
            <div class="am-u-sm-9">
              <input type="text" id="qq-group" value="132697360">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-weibo" class="am-u-sm-3 am-form-label">预计开版时间</label>
            <div class="am-u-sm-9">
              <input type="text" id="start-date" class="am-form-field" placeholder="选择预计开版时间" data-am-datepicker readonly required />
            </div>
          </div>
          
          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">外在身份选择方式</label>
            <div class="am-u-sm-9">
              <select data-am-selected id="character-select">
              	 <option value="A">个人选择</option>
  				 <option value="B">3选1</option>
              </select>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">备注</label>
            <div class="am-u-sm-9">
              <input type="text" id="remark" placeholder="">
            </div>
          </div>
		  
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <div id="error-msg"></div>
              <button type="button" class="am-btn am-btn-primary" onclick="submitApply(${sessionUser.id})">发布报名帖</button>
              <button type="button" class="am-btn am-btn-danger" onclick="hideApplyForm()">返回</button>
            </div>
          </div>
        </form>
        
        <form class="am-form am-form-horizontal" id="apply-judger" style="display:none">
        	<div class="am-form-group">
              <div id="error-msg"></div>   
              <button type="button" class="am-btn am-btn-danger" onclick="hideApplyList()">返回</button>
          	</div>
        	<table class="am-table am-table-striped am-table-hover table-main">
        		<thead>
					<tr>
						<th>版杀名称</th>
						<th>法官配置</th>	
						<th>游戏人数</th>
						<th>开版时间</th>
						<th>角色选择方式</th>
						<th class="table-set">操作</th>
					</tr>
				</thead>
				<tbody id="game-list">
					
				</tbody>
        	</table>
        </form> 
        
        
      </div>
    </div>
  </div>
  <!-- content end -->

</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var infoMessage = "${infoMessage}";
$(function(){
	setCache("nv_info_message",infoMessage);
	$("#collapse-nav li:eq(0) .am-icon-star").removeClass("invisible");
	$(".admin-sidebar-list > li:eq(0) .am-icon-angle-right").removeClass("invisible");
})

var gamedata=${applyingGameStr}

function changeGameStatus(gameId,status,finalResult){
	var url = getRootPath() + "/game/changeStatus";
	var options = {
		gameId : gameId,
		status : status,
		finalResult : finalResult
	};
	if(gamedata.gameStatus==1&&gamedata.alterJudgers.length>0){
		myAlert("还有备选法官未处理！");
		return;
	}
	if(gamedata.gameStatus==5&&!gamedata.replayEssayId){
		myAlert("本次版杀还未复盘！");
		return;
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("版杀状态更新成功！",function(){
				window.location = getRootPath() + "/admin-apply";
			});
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function extractIdentity(){
	var players=gamedata.players;
	var pioneerCandidate=[];
	var flag=true;
	$.each(players,function(index,player){
		if(player.characterId == null){
			myAlert("有玩家还未选择外在身份！")
			flag=false;
			return false;
		}
		if(player.applyPioneer == "是"){
			pioneerCandidate.push(index);
		}
		player.sign=null;
	})
	if(!flag) return;
	var playerNum = players.length;
	$.get('${baseUrl}file/config.json',function(data){
		$.each(data.configs,function(index,config){
			if(config.playerNum == playerNum){
				var array = config.identityNum;
				if(pioneerCandidate.length==0){
					array.push({
	                    "sign": 11,
	                    "desc": "平民"
	                });
				} else {
					pioneer = pioneerCandidate[parseInt(pioneerCandidate.length*Math.random())]
					players[pioneer].sign = 12;
					players[pioneer].identityDesc = "先驱";
					players[pioneer].camp = 1;
					$("#apply-info tr:eq("+pioneer+") td:eq(5)").text("先驱");
				}
				array.shuffle();
				flag=true;
				$.each(players,function(index,player){
					if(player.sign!=null){
						flag=false;
						return true;
					}
					if(flag){
						player.sign = array[index].sign;
						player.identityDesc = array[index].desc;
						player.camp = array[index].sign < 12 ? 1 : 2;
						$("#apply-info tr:eq("+index+") td:eq(5)").text(array[index].desc);
					} else {
						player.sign=array[index-1].sign;
						player.identityDesc = array[index-1].desc;
						player.camp = array[index-1].sign < 12 ? 1 : 2;
						$("#apply-info tr:eq("+index+") td:eq(5)").text(array[index-1].desc);
					}	
				})
			}
		})
	})
}

function submitList(gameId){
	var players=gamedata.players;
	if(players[0].sign == null){
		myAlert("请先抽取身份");
		return;
	}
	$.get('${baseUrl}file/config.json',function(data){
		var policeSign = data.policeSign;
		policeSign.shuffle();
		var killerSign = data.killerSign;
		killerSign.shuffle();
		var policeCount = 0;
		var killerCount = 0;
		$.each(players,function(index,player){
			player.position=index;
			player.isLife=1;
			player.isMute=0;
			switch(player.sign){
			case -1:
				player.sign=policeSign[policeCount].sign;
				player.identityDesc += "（"+policeSign[policeCount].desc+"）";
				policeCount++;
				break;
			case 99:
				player.sign=killerSign[killerCount].sign;
				player.identityDesc += "（"+killerSign[killerCount].desc+"）";
				killerCount++;
				break;
			}
		})
		var url = getRootPath() + "/game/submitList";
		var common = new Common();
		common.callAction(JSON.stringify(players),url,function(data){
			if (!data) {
				return;
			}
			switch (data.status) {
			case 1:
				changeGameStatus(gameId,3);
				return;
			default:
				myAlert(data.message);
				return;
			}
		},"application/json;charset=utf-8")
	})	
}

function showApplyForm(){
	$("#apply-detail").css({"display":"none"});
	$("#apply-publish").css({"display":"block"});
}

function hideApplyForm(){
	$("#apply-publish").css({"display":"none"});
	$("#apply-detail").css({"display":"block"});
}

function showApplyList(){
	var url = getRootPath() + "/game/getGameList";
	var common = new Common();
	common.callAction(null,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			$("#game-list").empty();
			$.each(data.applyingGames,function(index,game){
				var builder = new StringBuilder();
				builder.append('<tr>');
				builder.appendFormat('<td>{0}</td><td>',game.gameDesc);
				$.each(game.judgers,function(index,judger){
					builder.appendFormat('{0} ',judger);
				})
				builder.append('</td>');
				builder.appendFormat('<td>{0}</td>',game.playerNum);
				builder.appendFormat('<td>{0}</td>',game.startDate);
				builder.appendFormat(game.characterSelect=="A" ? '<td>个人选取</td>':'<td>3选1</td>');
				builder.appendFormat('<td><div class="am-btn-toolbar">'+
              			'<div class="am-btn-group am-btn-group-xs">'+
                		'<button type="button" onclick="becomeJudger({0})" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="加入">'+
              			'<span class="am-icon-sign-in"></span></button>'+
               			'</div></div></td>',game.id);
				$("#game-list").append(builder.toString());	
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
	$("#apply-detail").css({"display":"none"});
	$("#apply-judger").css({"display":"block"});
}

function becomeJudger(gameId){
	var url = getRootPath() + "/becomeJudger";
	var options = {
		gameId : gameId	
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("报名法官成功！",function(){
				window.location = getRootPath() + "/admin-apply";
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function judgerDecision(playerId,decision){
	var url = getRootPath() + "/judgerDecision";
	var options = {
		playerId : playerId,
		decision : decision
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("操作成功！",function(){
				window.location = getRootPath() + "/admin-apply";
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function hideApplyList(){
	$("#apply-judger").css({"display":"none"});
	$("#apply-detail").css({"display":"block"});
}

function submitApply(userId){
	var gameDesc = $("#game-desc").val().trim();
	var startDate = $("#start-date").val().trim();
	if(gameDesc==""){
		$("#error-msg").css("display","block");
		$("#error-msg").text("版杀名称不能为空");
		return false;
	}
	if(startDate==""){
		$("#error-msg").css("display","block");
		$("#error-msg").text("预计开版时间不能为空");
		return false;
	}
	$("#error-msg").css("display","none");
	$("#error-msg").text("");
	var url = getRootPath() + "/game/publish";
	var options = {
		gameDesc : gameDesc,
		judgerId : userId,
		playerNum : $("#player-num option:selected").val(),
		startDate : startDate,
		qqGroup : $("#qq-group").val(),
		characterSelect : $("#character-select").val(),
		remark : $("#remark").val()
	};
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			$("#error-msg").css("display","block");
			$("#error-msg").text("系统异常");
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("报名帖发布成功！",function(){
				window.location = getRootPath() + "/admin-apply";
			});
			return;
		default:
			$("#error-msg").css("display","block");
			$("#error-msg").text(data.message);
			return;
		}
	});
}

function kickPlayer(playerId){
	var url = getRootPath() + "/game/kickPlayer";
	var options = {
			playerId : playerId,
			reason : $("input[name='header']").val()
		};
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("踢出玩家成功！",function(){
				window.location = getRootPath() + "/admin-apply";
			});
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function queryGameResult(gameId){
	$("#info-query ul").empty();
	var builder = new StringBuilder();
	builder.append('<li>本局游戏最终结果：');
	builder.append('<select>'+
			'<option value="1">好人方胜利</option>'+
			'<option value="2">杀手方胜利</option>'+
			'<option value="3">平局</option>'+
			'<option value="4">契约方胜利</option>'+
			'<option value="9">流局</option>'+
			'</select>');
	$("#info-query ul").append(builder.toString());
	$.each($("#info-query select"),function(index,select){
		$(select).selected({
		    btnWidth: '200px'
		  });
	})
	$("#info-query").modal({
		onConfirm : function(){
			changeGameStatus(gameId,5,$("#info-query select").val());
		}
	});
}

</script>
</body>
</html>
