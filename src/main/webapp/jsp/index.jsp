<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<title>法官后台结算管理登录界面 - 维多利亚的噩梦</title>
<jsp:include page="layout/common.jsp"></jsp:include>
</head>
<body>
	<div class="header">
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h3>维多利亚的噩梦 - 法官登录</h3>
			<hr>
			<div class="am-btn-group">
				<a href="#" class="am-btn am-btn-secondary am-btn-sm"><i
					class="am-icon-qq am-icon-sm"></i> QQ</a> <a href="#"
					class="am-btn am-btn-success am-btn-sm"><i
					class="am-icon-weixin am-icon-sm"></i> Wechat</a> <a href="#"
					class="am-btn am-btn-primary am-btn-sm"><i
					class="am-icon-weibo am-icon-sm"></i> Weibo</a>
			</div>
			<br> <br>
			<form class="am-form">
				<label for="email">用户名:</label> <input type="text" id="userName"
					value=""> <br> <label for="password">密码:</label> <input
					type="password" id="userPwd" value=""> <br> <label
					for="remember-me"> <input id="remember-me" type="checkbox">
					记住密码
				</label> <br />
				<div id="error-msg"></div>
				<div class="am-cf">
					<input type="button" name="" value="登 录"
						class="am-btn am-btn-primary am-btn-sm am-fl"
						onclick="submitForm()"> <input type="button" name=""
						value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
				</div>
			</form>
			<hr>
			<p>
				© 2016 版权所有. <a href="http://www.mycodes.net/" target="_blank">维多利亚的噩梦</a>
			</p>
		</div>
	</div>
	<script type="text/javascript">
	function submitForm(){
		var account = $("#userName").val().trim();
		var password = $("#userPwd").val().trim();
		$("#userPwd").val("");
		if(account==""||password==""){
			$("#error-msg").css("display","block");
			$("#error-msg").text("用户名或密码不得为空");
			return false;
		}
		$("#error-msg").css("display","none");
		$("#error-msg").text("");
		//登陆验证
		var url = "loginAction";
		var options = {
			account : account,
			password : password
		};
		var common = new Common();
		common.callAction(options, url, function(data) {
			if (!data) {
				$("#error-msg").css("display","block");
				$("#error-msg").text("系统异常");
				return;
			}
			switch (data.status) {
			case 1:
				window.location = getRootPath() + "/admin-apply";
				return;
			default:
				$("#error-msg").css("display","block");
				$("#error-msg").text(data.message);
				return;
			}
		});
	}
	
	$("#userPwd").keyup(function() {
		if (event.keyCode == 13) {
			submitForm();
		}
	});
	</script>
</body>
</html>