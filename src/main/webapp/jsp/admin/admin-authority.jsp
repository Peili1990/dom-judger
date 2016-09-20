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
	
		<div class="am-u-sm-12 am-u-md-3 am-u-md-push-9"> 
      		<div class="am-panel am-panel-default">
         		<div class="am-panel-bd code-style" >
         			<p>未使用的邀请码</p>
         			<c:forEach items="${invcodes}" var="invcode">
         				<span>${invcode }</span>
         			</c:forEach>
         			<div class="am-form-group operation">
						<input type="button" class="am-btn am-btn-primary" value="批量生成" onclick="myPrompt('请输入生成邀请码个数','generateInvCode()')">
					</div>
         		</div>
        	</div>
        </div>
        
		<div class="am-u-sm-12 am-u-md-9 am-u-md-pull-3">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<div class="am-form-group operation">
						<input type="button" class="am-btn am-btn-primary" value="添加法官" onclick="myPrompt('请输入添加的法官名称','addJudger()')">
					</div>
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th>ID</th>
									<th>当前状态</th>
									<th>权限等级</th>
									<th>备注</th>
									<th class="table-set" style="width:120px">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${authorities}" var="authority">
									<tr>
										<td>${authority.nickname}</td>
										<td>${authority.statusDesc}</td>
										<td>${authority.authorityLevel}</td>
										<td>${authority.remark}</td>
										<td>
										<div class="am-btn-toolbar">
                  				  			<div class="am-btn-group am-btn-group-xs">
                    							<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="修改" onclick=""><span class="am-icon-edit"></span></button>
                   								<button type="button" class="am-btn am-btn-default am-btn-xs" title="删除" onclick="removeJudger(${authority.userId},${authority.status})"><span class="am-icon-eraser"></span></button>    					
                  				  			</div>
                						</div>
                						</td>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		
		
		
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

function addJudger(){
	var url = getRootPath() + "/addJudger";
	var options = {
			judgerName : $("input[name='header']").val()
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:		
			myInfo("添加成功！",function(){
				window.location = getRootPath()+"/admin-authority";
			});
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function removeJudger(judgerId,isbusy){
	var url = getRootPath() + "/removeJudger";
	var options = {
			judgerId : judgerId
	}
	var common = new Common();
	if(isbusy){
		myAlert("该名法官不处于空闲状态，无法删除！");
		return;
	}
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:		
			myInfo("删除成功！",function(){
				window.location = getRootPath()+"/admin-authority";
			});
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function generateInvCode(){
	var url = getRootPath() + "/generateInvCode";
	var options = {
			codeNum : $("input[name='header']").val()
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:		
			myInfo("批量生成成功！",function(){
				window.location = getRootPath()+"/admin-authority";
			});
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
		
}

</script>

</html>
