<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="player-panel">
	<div class="am-modal-dialog">
		<form class="am-form modal-am-form" id="status-form">
		 <fieldset>
		 	<legend>角色状态变更 -- </legend>
		 		<div class="float-panel">
					<div class="am-form-group">
						<label>存活状态</label>
						<br> 
						<label class="am-radio-inline">
      							<input type="radio" name="is-life" value="1"> 存活
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="is-life" value="0"> 死亡
     						</label>
					</div>
					<div class="am-form-group">
						<label>禁言状态</label>
						<br> 
						<label class="am-radio-inline">
      							<input type="radio" name="is-mute" value="1"> 被禁言
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="is-mute" value="0"> 未被禁言
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="is-mute" value="2"> 语无伦次
     						</label>
					</div>
					<div class="am-form-group">
						<label>阵营</label>
						<br> 
						<label class="am-radio-inline">
      							<input type="radio" name="camp" value="1"> 好人方
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="camp" value="2"> 杀手方
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="camp" value="3"> 契约方
     						</label>
					</div>
					<div class="am-form-group">
						<label>是否sp</label>
						<br> 
						<label class="am-radio-inline">
      							<input type="radio" name="is-sp" value="0"> 非sp
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="is-sp" value="1"> sp
     						</label>
					</div>
					<div class="am-form-group">
						<label>是否在座位表里</label>
						<br> 
						<label class="am-radio-inline">
      							<input type="radio" name="has-position" value="1"> 是
     						</label>
     						<label class="am-radio-inline">
       						<input type="radio" name="has-position" value="0"> 否
     						</label>
					</div>
				</div>
				<div class="am-form-group" style="text-align:center;">
					<input type="button" class="am-btn am-btn-primary" value="确定" name="confirm">
					<input type="button" class="am-btn am-btn-default" value="取消" onclick="closePlayerStatus()">
				</div>
			</fieldset>
		</form>
	</div>
</div>

<script>
var playerPanel = $("#player-panel")
var players=${playerListStr}

$(function(){
	addstatusStyle(players);
})

function showPlayerStatus(index){
	playerPanel.modal('open');
	playerPanel.find("legend").text("角色状态变更 -- "+players[index].characterName);
	changeRadioValue($("input[name='is-life']"),players[index].isLife);
	changeRadioValue($("input[name='is-mute']"),players[index].isMute);
	changeRadioValue($("input[name='camp']"),players[index].camp);
	changeRadioValue($("input[name='is-sp']"),players[index].isSp);
	changeRadioValue($("input[name='has-position']"),players[index].hasPosition);
	$("input[name='confirm']").unbind("click").on("click",function(){
		changePlayerStatus(index);
	})	
}

function addstatusStyle(players){
	$.each($("#character-info tr"),function(index,tr){
		player = $(tr).find("td").eq(0);
		if(players[index].isLife == "0"){
			player.addClass("dead");
		}
		if(players[index].isMute == "1"){
			player.addClass("silent");
		}
		if(players[index].isSp == "1"){
			player.text("sp"+players[index].characterName);
		}
		if(players[index].hasPosition == "0"){
			player.text("("+player.text()+")");
		}
		switch(players[index].camp){
		case 1:
			player.css({"color":"blue"});
			break;
		case 2:
			player.css({"color":"red"});
			break;
		case 3:
			player.css({"color":"purple"});
			break;
		}	
	})
}

function changePlayerStatus(index){
	player = $("#character-info tr:eq("+index+") td:eq(0)")
	players[index].isSp=parseInt($("input[name='is-sp']:checked").val());
	if(players[index].isSp == 1){
		player.text("sp"+players[index].characterName);
	} else {
		player.text(players[index].characterName);
	}
	players[index].isLife=parseInt($("input[name='is-life']:checked").val());
	if(players[index].isLife == 0){
		player.addClass("dead");
	} else {
		player.removeClass("dead");
	}
	players[index].isMute=parseInt($("input[name='is-mute']:checked").val());
	if(players[index].isMute >= 1){
		player.addClass("silent");
		if(players[index].isMute == 2){
			player.addClass("babbling");
		} else {
			player.removeClass("babbling");
		}
	} else {
		player.removeClass("babbling");
		player.removeClass("silent");
	}
	players[index].camp=parseInt($("input[name='camp']:checked").val());
	switch(players[index].camp){
	case 1:
		player.css({"color":"blue"});
		break;
	case 2:
		player.css({"color":"red"});
		break;
	case 3:
		player.css({"color":"purple"});
		break;
	}
	players[index].hasPosition=parseInt($("input[name='has-position']:checked").val());
	switch(players[index].hasPosition){
	case 0:
		player.text(player.text().indexOf("(")<0?"("+player.text()+")":player.text());
		break;
	case 1:
		player.text(player.text().replace("(","").replace(")",""));
		break;
	}
	playerPanel.modal("close");
	saveForm(true);
}

function closePlayerStatus(){
	playerPanel.modal("close");
}

</script>