<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="am-form am-form-horizontal" id="dice">
	<div class="am-form-group">
       <label class="am-u-sm-4 am-form-label">骰子面数</label>
       <div class="am-u-sm-8">
           <input type="text" name="dice-face" placeholder="">
       </div>
    </div>
    <div class="am-form-group">
       <label class="am-u-sm-4 am-form-label">投掷次数</label>
       <div class="am-u-sm-8">
           <input type="text" name="dice-times" value="1" >
       </div>
    </div>
    <div class="am-form-group">
       <label class="am-u-sm-4 am-form-label">投掷结果</label>
       <div class="am-u-sm-8">
           <input type="text" name="dice-result" value="" >
       </div>
    </div>
    <div class="am-form-group">
       <div class="am-u-sm-4">
           <input type="checkbox" name="dice-online">联机结算
       </div>
       <div class="am-u-sm-8">
           <button type="button" class="am-btn am-btn-primary" onclick="rollDice()">开始</button>
           <button type="button" class="am-btn am-btn-danger" onclick="resetDice()">重置</button>
       </div>
    </div>
</form>

<script type="text/javascript">
var gameId = ${gameId};

function rollDice(){
	diceFace = $("#dice input[name='dice-face']").val();
	diceTimes = $("#dice input[name='dice-times']").val();
	if(!diceFace.isNumeric() || diceFace=="" || !diceTimes.isNumeric() || diceTimes== ""){
		myAlert("请输入整数！");
		return;
	}
	var result = "";
	for(var i=0;i<diceTimes;i++){
		result +=parseInt(Math.random()*diceFace)+1;
		result +=" ";
	}
	if($("#dice input[name='dice-online']").is(":checked")){
		onlineSettlement(result,"dice");
	} else {
		$("#dice input[name='dice-result']").val(result);
	}
}

function resetDice(){
	$("#dice input[name='dice-face']").val("");
	$("#dice input[name='dice-times']").val("1");
	$("#dice input[name='dice-result']").val("");
}

function onlineSettlement(content,settlement){
	var url = "http://" + "${chatServer}" + "/onlineSettlement";
	var options = {
			gameId : gameId,
			settlement : settlement,
			content : content
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

</script>