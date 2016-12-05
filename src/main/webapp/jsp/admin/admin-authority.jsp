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
	
		
        
		<div class="am-u-sm-4">
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
									<th class="table-set" style="width:120px">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${authorities}" var="authority">
									<tr>
										<td>${authority.nickname}</td>
										<td>${authority.statusDesc}</td>
										<td>${authority.authorityLevel}</td>
										<td>
										<div class="am-btn-toolbar">
                  				  			<div class="am-btn-group am-btn-group-xs">
                    							<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="修改" onclick=""><span class="am-icon-edit"></span></button>
                   								<button type="button" class="am-btn am-btn-default am-btn-xs" title="删除" onclick="removeJudger(${authority.userId},${authority.status})"><span class="am-icon-eraser"></span></button>    					
                  				  			</div>
                						</div>
                						</td>
                					</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		
		<div class="am-u-sm-4">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<div class="am-form-group operation">
						<input type="button" class="am-btn am-btn-primary" value="发放卡片" onclick="showAddCardPanel()">
					</div>
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th>ID</th>
									<th>身份卡</th>
									<th>阵营卡</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userCards}" var="userCard">
									<tr>
										<td>${userCard.nickname}</td>
										<td>${userCard.identityCardNum}</td>
										<td>${userCard.campCardNum}</td>
									</tr>
								</c:forEach>							
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		
		<div class="am-u-sm-4"> 
      		<div class="am-panel am-panel-default">
      		
         		<div class="am-panel-bd code-style" >
         			<div class="am-form-group operation">
						<input type="button" class="am-btn am-btn-primary" value="批量生成" onclick="myPrompt('请输入生成邀请码个数','generateInvCode()')">
					</div>
         			<p>未使用的邀请码</p>
         			<c:forEach items="${invcodes}" var="invcode">
         				<span>${invcode }</span>
         			</c:forEach>
         			
         		</div>
        	</div>
        </div>	
		
	</div>
	
  </div>
  <!-- content end -->
</div>

	<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-card-panel">
		<div class="am-modal-dialog">
			<form class="am-form modal-am-form">
			 <fieldset>
			 	<legend style="margin-bottom:20px">发放卡片</legend>
			 	<div class="am-form-group">
            		<label class="am-u-sm-3 am-form-label">昵称</label>
            		<div class="am-u-sm-9">
             			<input type="text" id="card-nickname" value="">
            		</div>
         		</div>
         		<div class="am-form-group">
            		<label class="am-u-sm-3 am-form-label">卡片类型</label>
            		<div class="am-u-sm-9">
             			<label class="am-radio-inline">
       						<input type="radio" name="card-type" value="1"> 身份卡
      					</label>
      					<label class="am-radio-inline">
        					<input type="radio" name="card-type" value="2"> 阵营卡
      					</label>
            		</div>
         		</div>
         		<div class="am-form-group">
            		<label for="user-weibo" class="am-u-sm-3 am-form-label">过期时间</label>
            		<div class="am-u-sm-9">
             			<input type="text" id="expire-date" class="am-form-field" placeholder="不选择时间为永久有效" data-am-datepicker readonly required />
            		</div>
          		</div>
          		<div class="am-form-group" style="text-align:center;">
					<input type="button" class="am-btn am-btn-primary" value="确定" onclick="addCard()">
					<input type="button" class="am-btn am-btn-default" value="取消" onclick="closeAddCardPanel()">
				</div>
			 </fieldset>
			</form>
		</div>
	</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">

$(function(){
	$(".admin-sidebar-list > li:eq(3) .am-icon-angle-right").removeClass("invisible");
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

function showAddCardPanel(){
	$("#add-card-panel").modal("open");
	$("#card-nickname").val("");
}

function closeAddCardPanel(){
	$("#add-card-panel").modal("close");
}

function addCard(){
	closeAddCardPanel();
	var nickname = $("#card-nickname").val().trim();
	var cardType = $("input[name='card-type']:checked").val();
	var expireDate = $("#expire-date").val().trim();
	if(nickname==""){
		myAlert("请输入昵称！");
		return;
	}
	if(!cardType){
		myAlert("请选择卡片类型！");
		return;
	}
	var url = getRootPath() + "/addUserCard";
	var options = {
			nickname : nickname,
			cardType : cardType,
			expireDate : expireDate
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:		
			myInfo("发放卡片成功！",function(){
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
