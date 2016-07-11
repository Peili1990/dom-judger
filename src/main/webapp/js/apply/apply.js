function showApplyForm(){
	$("#applyDetail").css({"display":"none"});
	$("#applyPublish").css({"display":"block"});
}

function submitApply(){
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


}