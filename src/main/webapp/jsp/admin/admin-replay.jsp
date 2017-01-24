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
<![endif] -->

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/chat-panel.jsp"></jsp:include>
<div class="am-cf admin-main">
  <jsp:include page="../layout/sider-bar.jsp"></jsp:include>

  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">复盘总结</strong> / <small>Summary</small></div>
    </div>

    <hr/>

    <div class="am-g">
    	<div class="am-u-sm-12 am-u-sm-centered">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<c:choose>
					<c:when test="${ applyingGame.gameStatus == 5 }">
						<div class="am-form-group operation">
							<input type="button" class="am-btn am-btn-primary" value="简易复盘" onclick="simpleEssayBuild(${applyingGame.id})">
							<input type="button" class="am-btn am-btn-danger" value="发布复盘"
							 onclick="saveEssay(${applyingGame.id},'${applyingGame.gameDesc}'
							 <c:if test="${replayEssay!=null}">
							 	,${replayEssay.essayId}
							 </c:if>
							 )">
						</div>
						<div class="am-form-group">
              				<textarea id="replay-area" style="height:400px"></textarea> 
        				</div>
        			</c:when>
        			<c:otherwise>
        				没有需要复盘的版杀
        			</c:otherwise>
        			</c:choose>
				</div>
			</div>
		</div>
    </div>
      
  </div>
  <!-- content end -->

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">

$(function(){
	$("#collapse-nav li:eq(4) .am-icon-star").removeClass("invisible");
	$(".admin-sidebar-list > li:eq(0) .am-icon-angle-right").removeClass("invisible");
	$("#replay-area").val(replaceTag('${replayEssay.content}'));
})

function saveEssay(gameId,gameDesc,essayId){
	var url = getRootPath()+"/publishEssay";
	var options = {
			gameId : gameId,
			header : "【"+gameDesc+"】"+"复盘",
			content : recoverTag($("#replay-area").val()),
			essayId : essayId,
			type : 1
		}
	var common = new Common();
	common.callAction(options,url,function(data){
		myInfo("复盘发布成功！",function(){
			window.location = getRootPath()+"/admin-replay";
		});			
	})
}

function simpleEssayBuild(gameId){
	var url = getRootPath() + "/simpleEssayBuild";
	var options ={
			gameId : gameId
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		$("#replay-area").val(replaceTag(data.simpleEssay));
		myInfo("简易复盘生成成功！");			
	})
}

</script>
</body>
</html>
