<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">角色状态</strong> / <small>Character
						Status</small>
				</div>
			</div>

			<hr />

	<div class="am-g">
	
		<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"> 
      		<div class="am-panel am-panel-default">
          		<div class="am-panel-bd">
          			<h2>玩家操作提交记录</h2>	
          			<ul class="am-comments-list am-comments-list-flip" id="operation-list">
          			<c:choose>
          				<c:when test="${operationList != null && !operationList.isEmpty()}">
          					<c:forEach items="${ operationList}" var="operation">
          						<li class="am-panel am-panel-default">
          							<div class="am-panel-hd"><time>${operation.createTime}</time></div>
          							<div class="am-panel-bd"><p>
          							<c:if test="${operation.operator != null}">
          								${operation.operator}提交操作：
          							</c:if>${operation.operationStr }</p>
          							<hr>
          							<c:choose>
          								<c:when test="${operation.isDone == 1}">
          									<c:choose>
          										<c:when test="${operation.feedback != null && !operation.feedback.isEmpty()}">
														<c:forEach items="${ operation.feedback }" var="feedback">
															<p>=>反馈${feedback.characterName}：${feedback.feedback }</p>
														</c:forEach>
          										</c:when>
          										<c:otherwise>
          											<p>=>已结算</p>
          										</c:otherwise>
          									</c:choose>
          								</c:when>
          								<c:otherwise>
          									<p>=>暂未结算</p>
          								</c:otherwise>
          							</c:choose>  
          							</div>   
          							<input type="hidden" value="${operation.id }">			
									<div class="am-btn-toolbar float-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="结算" onclick=""><span class="am-icon-pencil-square-o"></span></button>							
										</div>
									</div>    							
          						</li>
          					</c:forEach>
          				</c:when>
          				<c:otherwise>
          					暂无玩家操作记录
          				</c:otherwise>
          			</c:choose>		
          			</ul>			
          		</div>
         	</div>
    	</div>
    	
		<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd" style="overflow:visible">
					<c:choose>
						<c:when test="${playerList != null && !playerList.isEmpty()}">
							<div class="character-info">
								<select data-am-selected id="form-list">
									<c:forEach items="${ formList }" var="form">
										<option value="${ form.formId }">${ form.header }</option>
									</c:forEach>
								</select>
							</div>
							<div class="am-form-group operation">
								<input type="button" class="am-btn am-btn-primary" value="下一阶段" onclick="nextStage()">
							</div>
							<form class="am-form">
								<table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th width="120px">角色</th>
											<th>实际身份</th>									
											<th width="300px">最近一条操作</th>
											<th width="300px">最近一条反馈</th>
											<th class="table-set" width="130px">操作</th>
										</tr>
									</thead>
									<tbody id="character-info">
										<c:forEach items="${ playerList }" var="player" varStatus="playerStatus">
											<tr>	
												<td>${player.characterName}</td>
												<td><span class="ellipsis-span">${player.identityDesc}</span></td>	
												<td><span class="ellipsis-span">${player.lastOperation}</span></td>										
												<td><span class="ellipsis-span">${player.lastFeedback}</span></td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="更改状态" onclick="showPlayerStatus(${playerStatus.index})"><span class="am-icon-pencil-square-o"></span></button>
															<button type="button" class="am-btn am-btn-default am-btn-xs" title="发送消息" onclick="establishChat(${player.playerId},'player')"><span class="am-icon-paper-plane-o"></span></button>
															<div class="am-dropdown 
															<c:if test="${fn:length(playerList) - playerStatus.index <=3 }">
															 am-dropdown-up
															</c:if>
															" data-am-dropdown>
																<button type="button" class="am-btn am-btn-default am-btn-xs am-text-success am-dropdown-toggle" title="更多操作"><span class="am-icon-ellipsis-h"></span></button>
																<ul class="am-dropdown-content">
    																<li onclick="showReplacePanel(${playerStatus.index})"><a><span class="am-icon-comments-o"></span> 发言称呼</a></li> 
    																<li onclick="showOperationPanel(${playerStatus.index})"><a><span class="am-icon-keyboard-o"></span> 操作管理</a></li> 					
    		 														<li onclick="positionUp(${playerStatus.index})"><a><span class="am-icon-chevron-up" ></span> 位置上移</a></li>
    																<li onclick="positionDown(${playerStatus.index})"><a><span class="am-icon-chevron-down"></span> 位置下移</a></li>
 														 		</ul>
															</div>
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
							没有正在进行中的版杀
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	</div>
		<!-- content end -->

	</div>
	
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="operation-panel">
		<div class="am-modal-dialog">
			<form class="am-form modal-am-form">
			 <fieldset>
			 	<legend>操作管理 -- 珀利</legend>
			 		<table class="am-table am-table-striped am-table-hover table-main" >
						<thead>
							<tr>
								<th width="200px">操作名称</th>
								<th width="150px">次数</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="am-form-group" style="text-align:center">
						<input type="button" class="am-btn am-btn-primary" value="新增" name="create">
						<input type="button" class="am-btn am-btn-primary" value="保存" name="save">
						<input type="button" class="am-btn am-btn-default" value="关闭" onclick="closeOperationPanel()">
					</div>
			 </fieldset>
			 </form>
			</div>
	</div>
	
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="replace-panel">
		<div class="am-modal-dialog">
			<form class="am-form modal-am-form">
			 <fieldset>
			 	<legend>发言称呼管理 -- 珀利</legend>
			 		<table class="am-table am-table-striped am-table-hover table-main" >
						<thead>
							<tr>
								<th width="150px">发言称呼</th>
								<th width="150px">头像</th>
								<th>发言状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="am-form-group" style="text-align:center">
						<input type="button" class="am-btn am-btn-primary" value="新增" name="create">
						<input type="button" class="am-btn am-btn-default" value="关闭" onclick="closeReplaceStatus()">
					</div>
			 </fieldset>
			 </form>
			</div>
	</div>

	<div class="am-modal am-modal-no-btn" tabindex="-1" id="player-panel">
		<div class="am-modal-dialog">
			<form class="am-form modal-am-form" id="status-form">
			 <fieldset>
			 	<legend>角色状态变更 -- </legend>
			 		<div class="float-panel">
						<div class="am-form-group">
							<label>存活状态</label>
							<br> 
							<label class="am-radio-inline">
       							<input type="radio" name="is-life" value="1"> 存活
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="is-life" value="0"> 死亡
      						</label>
						</div>
						<div class="am-form-group">
							<label>禁言状态</label>
							<br> 
							<label class="am-radio-inline">
       							<input type="radio" name="is-mute" value="1"> 被禁言
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="is-mute" value="0"> 未被禁言
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="is-mute" value="2"> 语无伦次
      						</label>
						</div>
						<div class="am-form-group">
							<label>阵营</label>
							<br> 
							<label class="am-radio-inline">
       							<input type="radio" name="camp" value="1"> 好人方
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="camp" value="2"> 杀手方
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="camp" value="3"> 契约方
      						</label>
						</div>
						<div class="am-form-group">
							<label>是否sp</label>
							<br> 
							<label class="am-radio-inline">
       							<input type="radio" name="is-sp" value="0"> 非sp
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="is-sp" value="1"> sp
      						</label>
						</div>
						<div class="am-form-group">
							<label>是否在座位表里</label>
							<br> 
							<label class="am-radio-inline">
       							<input type="radio" name="has-position" value="1"> 是
      						</label>
      						<label class="am-radio-inline">
        						<input type="radio" name="has-position" value="0"> 否
      						</label>
						</div>
					</div>
					<div class="am-form-group" style="text-align:center;">
						<input type="button" class="am-btn am-btn-primary" value="确定" name="confirm">
						<input type="button" class="am-btn am-btn-default" value="取消" onclick="closePlayerStatus()">
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var playerPanel = $("#player-panel")
var replacePanel = $("#replace-panel")
var operationPanel = $("#operation-panel")
var avatarList;
var operationList;
var players=${playerListStr}

$(function(){
	$("#collapse-nav li:eq(1) .am-icon-star").removeClass("invisible");
	$(".admin-sidebar-list > li:eq(0) .am-icon-angle-right").removeClass("invisible");
	addstatusStyle(players);
	getAllOperationList();
	$.get('${baseUrl}file/character-avatar.json',function(data){
		var builder = new StringBuilder();
		builder.append('<td><select>');
		$.each(data.characterAvatars,function(index,character){
			builder.appendFormat('<option value="{0}">{1}</option>',character.avatar,character.characterName);
		})
		builder.append('</select></td>');
		avatarList=builder.toString();
	})
})

function getAllOperationList(){
	var url = getRootPath() + "/game/allOperationList";
	var common = new Common();
	common.callAction(null,url,function(data){
		var builder = new StringBuilder();
		builder.append('<td><select>');
		$.each(data.operationList,function(index,operationName){
			builder.appendFormat('<option value="{0}">{1}</option>',index+1,operationName);
		})
		builder.append('</select></td>');
		operationList = builder.toString();
	})
}

function showPlayerStatus(index){
	playerPanel.modal('open');
	playerPanel.find("legend").text("角色状态变更 -- "+players[index].characterName);
	changeRadioValue($("input[name='is-life']"),players[index].isLife);
	changeRadioValue($("input[name='is-mute']"),players[index].isMute);
	changeRadioValue($("input[name='camp']"),players[index].camp);
	changeRadioValue($("input[name='is-sp']"),players[index].isSp);
	changeRadioValue($("input[name='has-position']"),players[index].hasPosition);
	$("input[name='confirm']").unbind("click").on("click",function(){
		changePlayerStatus(index);
	})
	
}

function showOperationPanel(playerIndex){
	var url = getRootPath() + "/getOperationList";
	var common = new Common();
	var options = {
			playerId : players[playerIndex].playerId
	}
	common.callAction(options,url,function(data){
		var list = operationPanel.find("tbody");
		list.empty();
		$.each(data.operationList,function(index,operation){
			var builder = new StringBuilder();
			builder.appendFormat('<tr>');
			builder.appendFormat(operationList);
			builder.appendFormat('<td><input type="number" name="operation-times" value={0}></td>',operation.times)
			builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +												
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteOperation(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").eq(index).val(operation.operationName).selected({
				maxHeight: '200px',
				searchBox: 1
			});
		})
		operationPanel.find("input[name='save']").unbind("click").on("click",function(){savePlayerOperation(playerIndex)})
		operationPanel.find("input[name='create']").unbind("click").on("click",function(){
			var builder = new StringBuilder();
			builder.append('<tr>');
			builder.append(operationList);
			builder.append('<td><input type="number" name="operation-times" value=0></td>')
			builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +												
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteOperation(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").last().selected({
				maxHeight: '200px',
				searchBox: 1
			});
		});
		operationPanel.find("legend").text("操作管理 -- "+players[playerIndex].characterName);
		operationPanel.modal('open');	
	})
}

function closeOperationPanel(){
	operationPanel.modal("close");
}

function deleteOperation(button){
	$(button).parents("tr").remove();
}

function savePlayerOperation(playerIndex){
	var list = [];
	$.each(operationPanel.find("tr"),function(index,row){
		if(index==0) return true;
		list.push({
			playerId : players[playerIndex].playerId,
			operationId : $(row).find("select").val(),
			times : $(row).find("input[name='operation-times']").val()
		})
	})
	var options = {
		playerId : players[playerIndex].playerId,
		operations : list
	}
	var url = getRootPath() + "/savePlayerOperation";
	var common = new Common();
	common.callAction(JSON.stringify(options),url,function(data){
		closeOperationPanel();
		myInfo("保存成功！");
	},"application/json;charset=utf-8")
}

function showReplacePanel(playerIndex){
	var url = getRootPath() + "/getReplaceSkin";
	var common = new Common();
	var options = {
			playerId : players[playerIndex].playerId
	}
	common.callAction(options,url,function(data){
		var list = replacePanel.find("tbody");
		list.empty();
		$.each(data.replaceList,function(index,skin){
			var builder = new StringBuilder();
			builder.appendFormat('<tr><td><input type="hidden" name="id" value={0}><input type="text" name="character-name" value={1}></td>',skin.id,skin.characterName);
			builder.append(avatarList);
			builder.appendFormat('<td><div class="am-form-group"><label class="am-radio-inline"><input type="radio" name="is-mute-{0}" value="0"> 正常</label>',index);
			builder.appendFormat('<label class="am-radio-inline"><input type="radio" name="is-mute-{0}" value="1"> 禁言</label>',index);
			builder.appendFormat('<label class="am-radio-inline"><input type="radio" name="is-mute-{0}" value="2"> 语无伦次</label></div></td>',index);
			builder.appendFormat('<td><div class="am-btn-toolbar">' +
			'<div class="am-btn-group am-btn-group-xs">' +
			'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="保存" onclick="saveReplaceSkin({0},{1})"><span class="am-icon-check-square-o"></span></button>'+							
			'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteReplaceSkin({2},{3})"><span class="am-icon-trash-o"></span></button>'+								
			'</div></div></td></tr>',playerIndex,index,playerIndex,index);
			list.append(builder.toString());
			list.find("input[name='is-mute-"+index+"'][value="+skin.isMute+"]").attr("checked",true);
			list.find("select").eq(index).val(skin.characterAvatar).selected({maxHeight: '100px'});
		})
		replacePanel.find("input[name='create']").unbind("click").on("click",function(){saveReplaceSkin(playerIndex)});
		replacePanel.find("legend").text("发言称呼管理 -- "+players[playerIndex].characterName);
		replacePanel.modal('open');			
	})
}

function saveReplaceSkin(playerIndex,skinIndex){
	var url = getRootPath() + "/saveReplaceSkin";
	var common = new Common();
	var options = skinIndex != null ? {
			id : replacePanel.find("tbody").find("tr").eq(skinIndex).find("input[name='id']").val(),
			playerId : players[playerIndex].playerId,
			characterName : replacePanel.find("tbody").find("tr").eq(skinIndex).find("input[name='character-name']").val(),
			characterAvatar : replacePanel.find("tbody").find("tr").eq(skinIndex).find("select").val(),
			isMute : replacePanel.find("input[name='is-mute-"+skinIndex+"']:checked").val(),
	}: {
			id : 0,
			characterName : "新称呼",			
			playerId : players[playerIndex].playerId,
			isMute : 0
	};
	common.callAction(options,url,function(data){
		showReplacePanel(playerIndex);		
	})
}

function deleteReplaceSkin(playerIndex,skinIndex){
	var url = getRootPath() + "/deleteReplaceSkin";
	var common = new Common();
	var options = {
			skinId : replacePanel.find("tbody").find("tr").eq(skinIndex).find("input[name='id']").val(),
	};
	common.callAction(options,url,function(data){
		showReplacePanel(playerIndex);			
	})
}

function closeReplaceStatus(){
	replacePanel.modal("close");
}

function changePlayerStatus(index){
	player = $("#character-info tr:eq("+index+") td:eq(0)")
	players[index].isSp=parseInt($("input[name='is-sp']:checked").val());
	if(players[index].isSp == 1){
		player.text("sp"+players[index].characterName);
	} else {
		player.text(players[index].characterName);
	}
	players[index].isLife=parseInt($("input[name='is-life']:checked").val());
	if(players[index].isLife == 0){
		player.addClass("dead");
	} else {
		player.removeClass("dead");
	}
	players[index].isMute=parseInt($("input[name='is-mute']:checked").val());
	if(players[index].isMute >= 1){
		player.addClass("silent");
		if(players[index].isMute == 2){
			player.addClass("babbling");
		} else {
			player.removeClass("babbling");
		}
	} else {
		player.removeClass("babbling");
		player.removeClass("silent");
	}
	players[index].camp=parseInt($("input[name='camp']:checked").val());
	switch(players[index].camp){
	case 1:
		player.css({"color":"blue"});
		break;
	case 2:
		player.css({"color":"red"});
		break;
	case 3:
		player.css({"color":"purple"});
		break;
	}
	players[index].hasPosition=parseInt($("input[name='has-position']:checked").val());
	switch(players[index].hasPosition){
	case 0:
		player.text(player.text().indexOf("(")<0?"("+player.text()+")":player.text());
		break;
	case 1:
		player.text(player.text().replace("(","").replace(")",""));
		break;
	}
	playerPanel.modal("close");
}

function closePlayerStatus(){
	playerPanel.modal("close");
}

function positionUp(index){
	if(index==0){
		players[players.length-1].position=0;
		players[index].position=players.length-1;
	} else {
		players[index].position--;
		players[index-1].position++;
	}
	saveForm(false);
}

function positionDown(index){
	if(index==players.length-1){
		players[0].position=players.length-1;
		players[index].position=0;
	} else {
		players[index].position++;
		players[index+1].position--;
	}
	saveForm(false);
}

function saveForm(needAlert){
	myLoading();
	$.each($("#character-info tr"),function(index,tr){
		inputs = $(tr).find("input");
		players[index].identityDesc = inputs.eq(0).val();
		players[index].action = inputs.eq(1).val();
		players[index].privilege = inputs.eq(2).val();
		players[index].feedback = inputs.eq(3).val();
		players[index].vote = inputs.eq(4).val();
		players[index].remark = inputs.eq(5).val();
	})
	var url = getRootPath() + "/game/submitList";
	var common = new Common();
	common.callAction(JSON.stringify(players),url,function(data){
		if(needAlert){
			myLoadingClose();
			myInfo("保存表格成功！",function(){
				window.location = getRootPath() + "/admin-character";
			})
		} else {
			window.location = getRootPath() + "/admin-character";
		}			
	},"application/json;charset=utf-8")
}

function updateForm(){
	var common = new Common();
	var url = getRootPath() + "/game/createOrUpdateForm";
	var options = {
		formId : $('#form-list option:selected').val(),
		content : JSON.stringify(players)
	};
	common.callAction(options,url,function(data){
		options = {
			header : $("input[name='header']").val()
		};
		common.callAction(options,url,function(data1){
			myInfo("创建表格成功！",function(){
				window.location = getRootPath() + "/admin-character";
			})
		})			
	})		
}

$("#form-list").change(function(){
	if($(this).get(0).selectedIndex==0){
		window.location.reload();
	} else {
		var common = new Common();
		var url = getRootPath() + "/game/getFormContent";
		var options = {
			formId : $('#form-list option:selected').val(),
		};
		common.callAction(options,url,function(data){
			players = JSON.parse(data.content);
			$.each($("#character-info tr"),function(index,tr){
				$(tr).find("td").eq(0).text(players[index].characterName);
				inputs=$(tr).find("input");
				inputs.eq(0).val(players[index].identityDesc);
				inputs.eq(1).val(players[index].action); 
				inputs.eq(2).val(players[index].privilege);
				inputs.eq(3).val(players[index].feedback);
				inputs.eq(4).val(players[index].vote);
				inputs.eq(5).val(players[index].remark);
			})
			addstatusStyle(players);
			$(".operation .am-btn").attr("disabled","disabled");			
		})
	}
})

function addstatusStyle(players){
	$.each($("#character-info tr"),function(index,tr){
		player = $(tr).find("td").eq(0);
		if(players[index].isLife == "0"){
			player.addClass("dead");
		}
		if(players[index].isMute == "1"){
			player.addClass("silent");
		}
		if(players[index].isSp == "1"){
			player.text("sp"+players[index].characterName);
		}
		if(players[index].hasPosition == "0"){
			player.text("("+player.text()+")");
		}
		switch(players[index].camp){
		case 1:
			player.css({"color":"blue"});
			break;
		case 2:
			player.css({"color":"red"});
			break;
		case 3:
			player.css({"color":"purple"});
			break;
		}	
	})
}

function nextStage(){
	var common = new Common();
	var url = getRootPath() + "/game/nextStage";
	common.callAction(null,url,function(data){
		myInfo("更新成功！",function(){
			window.location = getRootPath() + "/admin-character";
		})			
	})
}


</script>

</body>
</html>
