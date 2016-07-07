/**
 * 
 */

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
			window.location = getRootPath() + "/admin-index";
			return;
		default:
			$("#error-msg").css("display","block");
			$("#error-msg").text(data.message);
			return;
		}
	});
}