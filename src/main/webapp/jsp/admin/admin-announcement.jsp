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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">发布公告</strong> / <small>Publish Announcement</small></div>
    </div>
    
    <hr/>
    
    <div class="am-g">
    	<div class="am-u-sm-12 am-u-sm-centered">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
				<div class="announcement-info">
					<select data-am-selected id="announcement-list">
						<option value="1">7月5日日刊（开版公告）</option>
					</select>
				</div>
				<div class="am-form-group operation">
					<input type="button" class="am-btn am-btn-primary" value="编辑公告" onclick="saveForm()">
					<input type="button" class="am-btn am-btn-danger" value="新增公告" onclick="myPrompt('注意：请先保存表格再新增表格，否则可能导致数据丢失！<br/>请输入新表格标题','updateForm(true)')">
				</div>
				</div>
			</div>
		</div>
    </div>
    

  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license. <a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</footer>

<script type="text/javascript">

$(function(){
	$("#collapse-nav li:eq(2) .am-icon-star").removeClass("invisible");
})

</script>

</body>
</html>
