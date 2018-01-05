<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="replace-panel">
	<div class="am-modal-dialog">
		<form class="am-form modal-am-form">
		 <fieldset>
		 	<legend>发言称呼管理 -- 珀利</legend>
		 		<table class="am-table am-table-striped am-table-hover table-main" >
					<thead>
						<tr>
							<th width="150px">发言称呼</th>
							<th width="150px">头像</th>
							<th>发言状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<div class="am-form-group" style="text-align:center">
					<input type="button" class="am-btn am-btn-primary" value="新增" name="create">
					<input type="button" class="am-btn am-btn-default" value="关闭" onclick="closeReplaceStatus()">
				</div>
		 </fieldset>
		 </form>
		</div>
</div>

<script>
var replacePanel = $("#replace-panel")
var avatarList;

$(function(){
	$.get('${baseUrl}file/character-avatar.json',function(data){
		var builder = new StringBuilder();
		builder.append('<td><select>');
		builder.append('<option value="0">请选择</option>');
		$.each(data.characterAvatars,function(index,character){
			builder.appendFormat('<option value="{0}">{1}</option>',character.avatar,character.characterName);
		})
		builder.append('</select></td>');
		avatarList=builder.toString();
	})
})

function showReplacePanel(playerIndex){
	var url = getRootPath() + "/getReplaceSkin";
	var common = new Common();
	var options = {
			playerId : players[playerIndex].playerId
	}
	common.callAction(options,url,function(data){
		var list = replacePanel.find("tbody");
		list.empty();
		$.each(data.replaceList,function(index,skin){
			var builder = new StringBuilder();
			builder.appendFormat('<tr><td><input type="hidden" name="id" value={0}><input type="text" name="character-name" value={1}></td>',skin.id,skin.characterName);
			builder.append(avatarList);
			builder.appendFormat('<td><div class="am-form-group"><label class="am-radio-inline"><input type="radio" name="is-mute-{0}" value="0"> 正常</label>',index);
			builder.appendFormat('<label class="am-radio-inline"><input type="radio" name="is-mute-{0}" value="1"> 禁言</label>',index);
			builder.appendFormat('<label class="am-radio-inline"><input type="radio" name="is-mute-{0}" value="2"> 语无伦次</label></div></td>',index);
			builder.appendFormat('<td><div class="am-btn-toolbar">' +
			'<div class="am-btn-group am-btn-group-xs">' +
			'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="保存" onclick="saveReplaceSkin({0},{1})"><span class="am-icon-check-square-o"></span></button>'+							
			'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteReplaceSkin({2},{3})"><span class="am-icon-trash-o"></span></button>'+								
			'</div></div></td></tr>',playerIndex,index,playerIndex,index);
			list.append(builder.toString());
			list.find("input[name='is-mute-"+index+"'][value="+skin.isMute+"]").attr("checked",true);
			list.find("select").eq(index).val(skin.characterAvatar).selected({maxHeight: '100px'});
		})
		replacePanel.find("input[name='create']").unbind("click").on("click",function(){saveReplaceSkin(playerIndex)});
		replacePanel.find("legend").text("发言称呼管理 -- "+players[playerIndex].characterName);
		replacePanel.modal('open');			
	})
}

function saveReplaceSkin(playerIndex,skinIndex){
	var url = getRootPath() + "/saveReplaceSkin";
	var common = new Common();
	var options = skinIndex != null ? {
			id : replacePanel.find("tbody").find("tr").eq(skinIndex).find("input[name='id']").val(),
			playerId : players[playerIndex].playerId,
			characterName : replacePanel.find("tbody").find("tr").eq(skinIndex).find("input[name='character-name']").val(),
			characterAvatar : replacePanel.find("tbody").find("tr").eq(skinIndex).find("select").val(),
			isMute : replacePanel.find("input[name='is-mute-"+skinIndex+"']:checked").val(),
	}: {
			id : 0,
			characterName : "新称呼",			
			playerId : players[playerIndex].playerId,
			isMute : 0
	};
	common.callAction(options,url,function(data){
		showReplacePanel(playerIndex);		
	})
}

function deleteReplaceSkin(playerIndex,skinIndex){
	var url = getRootPath() + "/deleteReplaceSkin";
	var common = new Common();
	var options = {
			skinId : replacePanel.find("tbody").find("tr").eq(skinIndex).find("input[name='id']").val(),
	};
	common.callAction(options,url,function(data){
		showReplacePanel(playerIndex);			
	})
}

function closeReplaceStatus(){
	replacePanel.modal("close");
}
	
</script>