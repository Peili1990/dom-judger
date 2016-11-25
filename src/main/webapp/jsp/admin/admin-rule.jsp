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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">规则查看</strong> / <small>Rule Checking</small></div>
    </div>

    <hr/>

    <div class="am-g">
    	<div class="am-u-sm-12 am-u-sm-centered" id="rule-content-box">
			<div class="am-panel am-panel-default">
				<c:if test="${user.authority > 1}">
				<div class="am-panel-bd">
				<div class="am-form-group operation">
					<input type="button" class="am-btn am-btn-primary" value="编辑规则" onclick="showRuleEditor()">					
				</div>
				</div>
				</c:if>
				<div class="am-panel-bd" id="rule-content">
				</div>
			</div>
		</div>
		
		<div class="am-u-sm-12 am-u-sm-centered invisible" id="rule-editor-box">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<div class="am-form-group operation">
						<input type="button" class="am-btn am-btn-primary" value="保存规则" onclick="saveRule()">	
						<input type="button" class="am-btn am-btn-danger" value="返回" onclick="showRuleContent()">						
					</div>
				</div>
				<div class="am-panel-bd">
					<textarea id="rule-editor"></textarea> 
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
	$(".admin-sidebar-list > li:eq(2) .am-icon-angle-right").removeClass("invisible");
	$.get(picServer+'rule-1.8.0.txt',function(content){ 
		$("#rule-content").html(content);
	})
})

function showRuleEditor(){
	$("#rule-content-box").addClass("invisible");
	$("#rule-editor-box").removeClass("invisible");
	$(".edui-container").removeAttr("style");
	$(".edui-body-container").removeAttr("style").css({"height":"600px"});
	um.setContent($("#rule-content").html());
}

function showRuleContent(){
	$("#rule-content-box").removeClass("invisible");
	$("#rule-editor-box").addClass("invisible");
}

function saveRule(){
	var url = getRootPath() + "/saveRule";
	var options = {
			content : um.getContent()
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("修改成功！",function(){
				window.location = getRootPath() + "/admin-rule";
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}
</script>

</body>
</html>