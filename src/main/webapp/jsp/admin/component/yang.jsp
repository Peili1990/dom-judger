<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		yang = rollyikaList(groupGP.concat(groupGS).concat(groupNM),4,groupBK.concat(groupBS),1);
	} else if(yangCamp==2){
		yang = rollyikaList(groupGP.concat(groupGS),1,groupBK.concat(groupBS).concat(groupNM),4);
	}
	if($("#yang input[name='yang-online']").is(":checked")){
		onlineSettlement(yang,"yang");
	} else {
		$("#yang input[name='yang-result']").val(yang);
	}
}

</script>
