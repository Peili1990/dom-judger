<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
		<h2>直觉<span title="基本扬的特权结算&#10;结果出现普通叶兄请参考结算手册" class="settlement-span am-icon-question-circle"></span></h2>
		<form class="am-form am-form-horizontal" id="yang">
			<div class="am-form-group">
       			<label class="am-u-sm-4 am-form-label">直觉名单</label>
       			<div class="am-u-sm-8">
           			<input type="text" name="yang-result" placeholder="">
       			</div>
    		</div>
    
    		<div class="am-form-group">
       			<div class="am-u-sm-4">
           			<input type="checkbox" name="yang-online">联机结算
       			</div>
       			<div class="am-u-sm-8">
           			<button type="button" class="am-btn am-btn-primary" onclick="yangList()">开始</button>
       			</div>
    		</div>
		</form>
	</div>	
</div>


<script type="text/javascript">

function yangList(){
	$.each(players,function(index,player){
		if(player.characterName=="扬"){
			yangCamp=player.camp;
			return false;
		}
	})
	yang = "";
	if(yangCamp==1){
		yang = rollyikaList(groupGP.concat(groupGS).concat(groupNM),4,groupBK.concat(groupBS),1,"扬");
	} else if(yangCamp==2){
		yang = rollyikaList(groupGP.concat(groupGS),1,groupBK.concat(groupBS).concat(groupNM),4,"扬");
	}
	if($("#yang input[name='yang-online']").is(":checked")){
		onlineSettlement(yang,"yang");
	} else {
		$("#yang input[name='yang-result']").val(yang);
	}
}

</script>
