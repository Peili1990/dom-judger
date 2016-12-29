<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
		<h2>甜美气息</h2>
		<form class="am-form am-form-horizontal" id="ounei">
			<div class="am-form-group">
				<label class="am-u-sm-4 am-form-label">计算结果</label>
				<div class="am-u-sm-8">
					<input type="text" name="ounei-result">
				</div>
			</div>
			<div class="am-form-group">
				<div class="am-u-sm-4">
					<input type="checkbox" name="ounei-online">联机结算
				</div>
				<div class="am-u-sm-8">
					<button type="button" class="am-btn am-btn-primary"
						onclick="calOunei()">计算</button>
				</div>
			</div>
		</form>
	</div>	
</div>

<script type="text/javascript">

function calOunei(){
	var clockwise = {count:0};
	var anticlockwise = {count:0};
	var ouneiPosition = 0;
	var lifePlayers = [];
	$.each(players,function(index,player){
		if(player.isLife == 1){
			lifePlayers.push(player);
			if(player.characterName == "欧内斯特"){
				ouneiPosition = index;
			}
		}
	})
	var clockwisePoint = ouneiPosition == lifePlayers.length - 1 ? 0 : parseInt(ouneiPosition) + 1;
	var anticlockwisePoint = ouneiPosition == 0 ? lifePlayers.length - 1 : ouneiPosition - 1;
	while(!(clockwisePoint == anticlockwisePoint || 
			clockwisePoint - anticlockwisePoint == 1 || 
			parseInt(clockwisePoint) + parseInt(lifePlayers.length) - anticlockwisePoint == 1)){
		while(decideSign(lifePlayers[clockwisePoint],clockwise)){
			clockwisePoint = clockwisePoint == lifePlayers.length - 1 ? 0 : parseInt(clockwisePoint) + 1;
		}
		while(decideSign(lifePlayers[anticlockwisePoint],anticlockwise)){
			anticlockwisePoint = anticlockwisePoint == 0 ? lifePlayers.length - 1 : anticlockwisePoint - 1;
		}
		clockwisePoint = clockwisePoint == lifePlayers.length - 1 ? 0 : parseInt(clockwisePoint) + 1;
		anticlockwisePoint = anticlockwisePoint == 0 ? lifePlayers.length - 1 : anticlockwisePoint - 1;
	}
	var ounei = clockwise.count > anticlockwise.count ? "顺时针>逆时针" : clockwise.count < anticlockwise.count ? "顺时针<逆时针" : "顺时针=逆时针";
	$("#ounei input[name='ounei-result']").val(ounei);
}	

function decideSign(player,counter){
	if(player.characterName=="叶什（兄）"&&player.isSp == 0){
		return false;
	}
	if(player.sign!=11&&player.sign!=12&&player.sign!=23){
		counter.count++;
	}
	if(player.characterName=="布莱克"){
		return true;
	}
	return false;
}

</script>

