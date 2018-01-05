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
          			<h2>玩家操作记录</h2>
          			<div class="am-panel-group" id="form-wrapper">         				
          				<c:forEach items="${ formList }" var="form">
          				<div class="am-panel am-panel-default">
							<div class="am-btn-primary am-panel-hd ">
		 						<h2 class="am-panel-title" data-am-collapse="{parent: '#form-wrapper', target: '#form-${form.formId }'}">
		 						${ form.header }
		 						</h2>
							</div>
							<div id="form-${form.formId }" class="am-panel-collapse am-collapse">
								<ul class="am-comments-list am-comments-list-flip">
									<c:choose>
          								<c:when test="${form.records != null && !form.records.isEmpty()}">
          								<c:forEach items="${form.records}" var="operation">
          									<li class="am-panel am-panel-default">
          										<div class="am-panel-hd">
          										<time>${operation.createTime}</time>
          										<button class="am-btn am-btn-default" onclick="settleOperation(${operation.id},${operation.playerId},${operation.operationId},${operation.isDone},this)">结算</button>
          										</div>
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
																<p data-player-id="${feedback.playerId}" }>=>反馈${feedback.characterName}：${feedback.feedback }</p>
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
						</c:forEach>				
          			</div>         						
          		</div>
         	</div>
    	</div>
    	
		<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd" style="overflow:visible">
					<c:choose>
						<c:when test="${playerList != null && !playerList.isEmpty()}">
							<div class="character-info">
								<h2>当前${formList.get(0).header}</h2>
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
											<th width="300px">状态列表</th>
											<th width="300px">拥有计数</th>
											<th class="table-set" width="130px">操作</th>
										</tr>
									</thead>
									<tbody id="character-info">
										<c:forEach items="${ playerList }" var="player" varStatus="playerStatus">
											<tr ondblclick="showRecordPanel(${playerStatus.index})">	
												<td>${player.characterName}</td>
												<td><span class="ellipsis-span">${player.identityDesc}</span></td>	
												<td title="${player.statusStr}"><span class="ellipsis-span">${player.statusStr}</span></td>										
												<td title="${player.countStr}"><span class="ellipsis-span">${player.countStr}</span></td>
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
	<jsp:include page="character-component/player-panel.jsp"></jsp:include>	
	<jsp:include page="character-component/operation-panel.jsp"></jsp:include>	
	<jsp:include page="character-component/record-panel.jsp"></jsp:include>
	<jsp:include page="character-component/settle-panel.jsp"></jsp:include>	
	<jsp:include page="character-component/replace-panel.jsp"></jsp:include>		
	<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">

$(function(){
	$("#form-wrapper").find(".am-collapse").eq(0).addClass("am-in");
	$("#collapse-nav li:eq(1) .am-icon-star").removeClass("invisible");
	$(".admin-sidebar-list > li:eq(0) .am-icon-angle-right").removeClass("invisible");
	
})

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
	var url = getRootPath() + "/game/submitList";
	var common = new Common();
	common.callAction(JSON.stringify(players),url,function(data){
		if(needAlert){
			myLoadingClose();
			myInfo("保存成功！",function(){
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
