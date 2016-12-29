<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
		<h2>敛手屏足<span title="SP钱德勒的特权结算&#10;抽取重复角色请重新抽取" class="settlement-span am-icon-question-circle"></span></h2>
		<form class="am-form am-form-horizontal" id="candler">
	    	<div class="am-form-group">
       			<label class="am-u-sm-4 am-form-label">钱德勒性别</label>
       			<label class="am-radio-inline">
       				<input type="radio" name="candler-sex" value="0"> 男
      			</label>
      			<label class="am-radio-inline">
        			<input type="radio" name="candler-sex" value="1"> 女
      			</label>
    		</div>
			<div class="am-form-group">
       			<label class="am-u-sm-4 am-form-label">抽取结果</label>
      			<div class="am-u-sm-8">
           			<input type="text" name="candler-result" placeholder="">
       			</div>
    		</div>
    		<div class="am-form-group">
       			<div class="am-u-sm-4">
          			<input type="checkbox" name="candler-online">联机结算
       			</div>
       			<div class="am-u-sm-8">
          	 		<button type="button" class="am-btn am-btn-primary" onclick="drawCharacter()">开始</button>
       			</div>
    		</div>
		</form>
	</div>	
</div>

<script type="text/javascript">

	function drawCharacter(){
		candlerSex = $("input[name='candler-sex']:checked").val();
		if(!candlerSex){
			myAlert("请选择钱德勒性别！");
			return;
		}
		playersInGame = JSON.stringify(players);
		var candidate = [];
		$.get('${baseUrl}file/character-list.json',function(data){
			$.each(data.characters,function(index,character){
				if(playersInGame.indexOf(character.characterName)<0
						&& character.sex!=candlerSex
						&& character.characterId!=42){
					candidate.push(character.characterName);
				}
			})
			candidate.shuffle();
			result = candidate[0];
			if($("#candler input[name='candler-online']").is(":checked")){
				onlineSettlement(result,"candler");
			} else {
				$("#candler input[name='candler-result']").val(result);
			}
		})
	}

</script>