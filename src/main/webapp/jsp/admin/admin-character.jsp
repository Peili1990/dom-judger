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
		<div class="am-u-sm-12 am-u-sm-centered">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
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
								<input type="button" class="am-btn am-btn-primary" value="保存表格" onclick="saveForm()">
								<input type="button" class="am-btn am-btn-danger" value="新增表格" onclick="myPrompt('注意：请先保存表格再新增表格，否则可能导致数据丢失！<br/>请输入新表格标题','updateForm(true)')">
							</div>
							<form class="am-form">
								<table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th width="90px">角色</th>
											<th>实际身份</th>
											<th>行动</th>
											<th>特权</th>
											<th>反馈</th>
											<th>投票</th>
											<th>备注</th>
											<th class="table-set" width="130px">操作</th>
										</tr>
									</thead>
									<tbody id="character-info">
										<c:forEach items="${ playerList }" var="player" varStatus="playerStatus">
											<tr>
												<td>${player.characterName}</td>
												<td><input type="text" value="${player.identityDesc}  "></td>
												<td><input type="text" value="${player.action}"></td>
												<td><input type="text" value="${player.privilege}"></td>
												<td><input type="text" value="${player.feedback}"></td>
												<td><input type="text" value="${player.vote}"></td>
												<td><input type="text" value="${player.remark}"></td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="更改状态" onclick="showPlayerStatus(${playerStatus.index})"><span class="am-icon-pencil-square-o"></span></button>
															<button type="button" class="am-btn am-btn-default am-btn-xs" title="发送消息"><span class="am-icon-paper-plane-o"></span></button>
															<button type="button" class="am-btn am-btn-default am-btn-xs am-text-success" title="查看提交时间"><span class="am-icon-clock-o"></span></button>
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

	<div class="am-modal am-modal-no-btn" tabindex="-1" id="player-panel">
		<div class="am-modal-dialog">
			<form class="am-form">
			 <fieldset>
			 	<legend>角色状态变更</legend>
			 		<p>角色：sp莫利</p>
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
					<div class="am-form-group" style="text-align:center">
						<input type="button" class="am-btn am-btn-primary" value="确定" name="confirm">
						<input type="button" class="am-btn am-btn-default" value="取消" onclick="closePlayerStatus()">
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<footer>
		<hr>
		<p class="am-padding-left">
			© 2014 AllMobilize, Inc. Licensed under MIT license. <a
				href="http://www.mycodes.net/" target="_blank">源码之家</a>
		</p>
	</footer>

<script type="text/javascript">
var players=${playerListStr}
var panel = $("#player-panel")

$(function(){
	$("#collapse-nav li:eq(1) .am-icon-star").removeClass("invisible");
	addstatusStyle(players);
})

function showPlayerStatus(index){
	panel.find("p").text(players[index].characterName);
	$("input[name='is-life'][value="+players[index].isLife+"]").attr("checked",true);
	$("input[name='is-mute'][value="+players[index].isMute+"]").attr("checked",true);
	$("input[name='camp'][value="+players[index].camp+"]").attr("checked",true);
	$("input[name='confirm']").on("click",function(){
		changePlayerStatus(index);
	})
	panel.modal();
}

function changePlayerStatus(index){
	player = $("#character-info tr:eq("+index+") td:eq(0)")
	players[index].isLife=$("input[name='is-life']:checked").val();
	if(players[index].isLife == "0"){
		player.addClass("dead");
	} else {
		player.removeClass("dead");
	}
	players[index].isMute=$("input[name='is-mute']:checked").val();
	if(players[index].isMute == "1"){
		player.addClass("silent");
	} else {
		player.removeClass("silent");
	}
	players[index].camp=$("input[name='camp']:checked").val();
	switch(players[index].camp){
	case "1":
		player.css({"color":"blue"});
		break;
	case "2":
		player.css({"color":"red"});
		break;
	case "3":
		player.css({"color":"purple"});
		break;
	}	
	panel.modal("close");
}

function closePlayerStatus(){
	panel.modal("close");
}

function saveForm(){
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
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("保存表格成功！",function(){
				window.location = getRootPath() + "/admin-character";
			})
			return;
		default:
			myAlert(data.message);
			return;
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
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			options = {
				header : $("input[name='header']").val()
			};
			common.callAction(options,url,function(data1){
				if (!data1) {
					return;
				}
				switch (data1.status) {
				case 1:
					myInfo("创建表格成功！",function(){
						window.location = getRootPath() + "/admin-character";
					})
				default:
					myAlert(data1.message);
					return;
				}
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
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
			if (!data) {
				return;
			}
			switch (data.status) {
			case 1:
				players = JSON.parse(data.content);
				$.each($("#character-info tr"),function(index,tr){
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
				return;
			default:
				myAlert(data1.message);
				return;
			}
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

</script>

</body>
</html>
