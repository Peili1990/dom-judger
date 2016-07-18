function showApplyForm(){
	$("#applyDetail").css({"display":"none"});
	$("#applyPublish").css({"display":"block"});
}

function submitApply(userId){
	var gameDesc = $("#gameDesc").val().trim();
	var startDate = $("#startDate").val().trim();
	if(gameDesc==""){
		$("#error-msg").css("display","block");
		$("#error-msg").text("版杀名称不能为空");
		return false;
	}
	if(startDate==""){
		$("#error-msg").css("display","block");
		$("#error-msg").text("预计开版时间不能为空");
		return false;
	}
	$("#error-msg").css("display","none");
	$("#error-msg").text("");
	var url = getRootPath() + "/game/publish";
	var options = {
		gameDesc : gameDesc,
		judgerId : userId,
		playerNum : $("#playerNum option:selected").val(),
		startDate : $("#startDate").val(),
		qqGroup : $("#QQgroup").val(),
		characterSelect : $("#characterSelect").val(),
		remark : $("#remark").val()
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
			myInfo("报名帖发布成功！",function(){
				window.location = getRootPath() + "/admin-apply/";
			});
			return;
		default:
			$("#error-msg").css("display","block");
			$("#error-msg").text(data.message);
			return;
		}
	});
}
