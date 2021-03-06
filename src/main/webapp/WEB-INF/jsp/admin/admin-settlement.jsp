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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">辅助结算</strong> / <small>Auxiliary settlement</small></div>
    </div>

    <hr/>

    <div class="am-g">
    	<div class="am-u-sm-4">
			<jsp:include page="component/dice.jsp"></jsp:include>	
			
			<c:if test="${gameId>0}">
				<jsp:include page="component/yika.jsp"></jsp:include>
			</c:if>
			
			<c:if test="${gameId>0}">
				<jsp:include page="component/ounei.jsp"></jsp:include>
			</c:if>		
		</div>
		
		<div class="am-u-sm-4">
			<jsp:include page="component/list.jsp"></jsp:include>	
			
			<c:if test="${gameId>0}">
				<jsp:include page="component/yang.jsp"></jsp:include>
			</c:if>
			<c:if test="${gameId>0}">
				<jsp:include page="component/candler.jsp"></jsp:include>
			</c:if>
			
		</div>
		<div class="am-u-sm-4">
			<c:if test="${gameId>0}">
				<jsp:include page="component/poker.jsp"></jsp:include>
			</c:if>
		</div>
    </div>
      
  </div>
  <!-- content end -->

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var players=${playerListStr}

$(function(){
	$("#collapse-nav li:eq(3) .am-icon-star").removeClass("invisible");
	$(".admin-sidebar-list > li:eq(0) .am-icon-angle-right").removeClass("invisible");
})

</script>
</body>
</html>
