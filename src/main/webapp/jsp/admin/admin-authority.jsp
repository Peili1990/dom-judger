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
	  <div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">权限管理</strong> / <small>Authority Management</small>
	  </div>
	</div>

	<hr />
	
	<div class="am-g">
	
	</div>
	
  </div>
  <!-- content end -->
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">

$(function(){
	$(".admin-sidebar-list > li:eq(2) .am-icon-angle-right").removeClass("invisible");
})

</script>

</html>
