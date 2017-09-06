<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
		<h2>小筑的伊卡<span title="基本伊卡的特权结算&#10;结果出现普通叶兄请参考结算手册" class="settlement-span am-icon-question-circle"></span></h2>
		<form class="am-form am-form-horizontal" id="yika">
	    	<div class="am-form-group">
       			<label class="am-u-sm-4 am-form-label">投掷点数</label>
       			<div class="am-u-sm-8">
           			<input type="text" name="yika-point" placeholder="">
       			</div>
    		</div>
			<div class="am-form-group">
       			<label class="am-u-sm-4 am-form-label">伊卡名单</label>
      			<div class="am-u-sm-8">
           			<input type="text" name="yika-result" placeholder="">
       			</div>
    		</div>
    		<div class="am-form-group">
       			<div class="am-u-sm-4">
          			<input type="checkbox" name="yika-online">联机结算
       			</div>
       			<div class="am-u-sm-8">
          	 		<button type="button" class="am-btn am-btn-primary" onclick="yikaList()">开始</button>
       			</div>
    		</div>
		</form>
	</div>	
</div>




<script type="text/javascript">
var groupGP = [];
var groupGS = [];
var groupBK = [];
var groupBS = [];
var groupNM = [];

$(function(){
	$.each(players,function(index,player){
		if(player.isLife == 1){
			if (player.sign <= 6) {
					groupGP.push(player);
				} else if (player.sign > 6 && player.sign <= 10) {
					groupGS.push(player);
				} else if (player.sign > 12 && player.sign <= 18) {
					groupBK.push(player);
				} else if (player.sign > 18 && player.sign <= 22) {
					groupBS.push(player);
				} else {
					groupNM.push(player);
			}
		}
	})
})

function yikaList(){
	var point = parseInt(Math.random()*20)+1;
	if(point <= 6){
		yika = "晚上仿佛听到"+rollyikaList(groupGP.concat(groupGS).concat(groupBK).concat(groupBS),2,groupNM,2,"伊卡")+"说话的声音。";	
	}else if(point > 6 && point <= 10){
		yika = rollyikaList(groupGP.concat(groupGS).concat(groupNM),2,groupBK.concat(groupBS),2,"伊卡")+"的样子不像是好人。";
	}else if(point > 10 && point <= 14){
		yika = rollyikaList(groupGP.concat(groupGS),2,groupBK.concat(groupBS).concat(groupNM),2,"伊卡")+"的样子像是好人。";
	}else if(point > 14 && point <= 16){
		yika = rollyikaList(groupGP.concat(groupGS).concat(groupBS).concat(groupNM),3,groupBK,1,"伊卡")+"的样子像是杀手。";
	}else if(point > 16 && point <= 18){
		yika = rollyikaList(groupGP,1,groupBK.concat(groupGS).concat(groupBS).concat(groupNM),3,"伊卡")+"的样子像是警察。";
	}else if(point == 19){
		yika = "剩余好人方警察人数"+groupGP.length+"人";
	}else {
		yika = "剩余杀手方杀手人数"+groupBK.length+"人";
	}
	if($("#yika input[name='yika-online']").is(":checked")){
		onlineSettlement(yika,"yika");
	} else {
		$("#yika input[name='yika-result']").val(yika);
		$("#yika input[name='yika-point']").val(point);
	}
}

function rollyikaList(groupOne,numOne,groupTwo,numTwo,notShowStr){
	var result = [];
	groupOne.shuffle();
	groupTwo.shuffle();
	for(var i=0;i<numOne;i++){
		result.push(groupOne[i].characterName);
	}
	for(var i=0;i<numTwo;i++){
		result.push(groupTwo[i].characterName);
	}
	result.shuffle();
	if(result.indexOf(notShowStr)>0){
		result = rollyikaList(groupOne,numOne,groupTwo,numTwo,notShowStr);
	}
	return result.toString();
}
</script>