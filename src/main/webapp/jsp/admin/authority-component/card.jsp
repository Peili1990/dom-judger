<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<th>特权卡</th>
									<th>先驱卡</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userCards}" var="userCard">
									<tr>
										<td>${userCard.nickname}</td>
										<td>${userCard.identityCardNum}</td>
										<td>${userCard.campCardNum}</td>
										<td>${userCard.privilegeCardNum}</td>
										<td>${userCard.pioneerCardNum}</td>
									</tr>
								</c:forEach>							
							</tbody>
						</table>
					</form>
				</div>
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
      					<label class="am-radio-inline">
        					<input type="radio" name="card-type" value="3"> 特权卡
      					</label>
      					<label class="am-radio-inline">
        					<input type="radio" name="card-type" value="4"> 先驱卡
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
			
<script>

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