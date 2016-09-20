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

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/chat-panel.jsp"></jsp:include>
<div class="am-cf admin-main">
  <jsp:include page="../layout/sider-bar.jsp"></jsp:include>
  
  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">规则整理</strong> / <small>Rule Checking</small></div>
    </div>

    <hr/>

    <div class="am-g">
    	<div class="am-u-sm-12 am-u-sm-centered">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
				<div class="am-form-group operation">
					<input type="button" class="am-btn am-btn-primary" value="编辑规则" onclick="showRuleEditor()">						
				</div>
				</div>
				<div class="am-panel-bd" id="rule-content">
				</div>
				<div class="am-panel-bd">
					<textarea id="rule-editor" class="invisible"></textarea> 
				</div>
				
				
			</div>
		</div>
    
    </div>
  </div>
   <!-- content end -->

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var um = UM.getEditor("rule-editor");

$(function(){
	$(".admin-sidebar-list > li:eq(1) .am-icon-angle-right").removeClass("invisible");
	$.get('file/rule-1.8.0.txt',function(content){ 
		$("#rule-content").html(content);
	})
})

function showRuleEditor(){
	$("#rule-content").addClass("invisible");
	um.setContent($("#rule-content").html());
	$("#rule-editor").removeClass("invisible");
}
</script>

</body>
</html>