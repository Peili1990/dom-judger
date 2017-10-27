<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="am-modal am-modal-no-btn" tabindex="-1" id="record-panel">
		<div class="am-modal-dialog">
			<form class="am-form modal-am-form">
			 <fieldset>
			 	<legend>操作记录管理 -- 珀利</legend>
			 		<table class="am-table am-table-striped am-table-hover table-main" >
						<thead>
							<tr>
								<th width="200px">操作</th>
								<th>详情</th>
								<th width="100px">操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="am-form-group" style="text-align:center">
						<input type="button" class="am-btn am-btn-primary" value="新增" name="create">
						<input type="button" class="am-btn am-btn-secondary" value="保存" name="save">
						<input type="button" class="am-btn am-btn-default" value="关闭" onclick="closeRecordPanel()">
					</div>
			 </fieldset>
			 </form>
			</div>
	</div>
	
<script>
var recordPanel = $("#record-panel")
var operationTarget;

$(function(){
	getOperationTarget();
})

function getOperationTarget(){
	var builder = new StringBuilder();
	builder.append('<td><select>');
	$.each(players,function(index,player){
		builder.appendFormat('<option value="{0}">{1}</option>',player.playerId,player.characterName);
	})
	builder.append('</select></td>');
	operationTarget = builder.toString();
}

function showRecordPanel(playerIndex){
	var url = getRootPath() + "/getPlayerOperation";
	var options = {
			playerId : players[playerIndex].playerId
	}
	var common = new Common();
	common.callAction(JSON.stringify(options),url,function(data){
		var list = recordPanel.find("tbody");
		list.empty();
		$.each(data.operationRecord,function(index,operation){
			var builder = new StringBuilder();
			builder.append('<tr>');
			builder.append(operationList);
			builder.appendFormat('<td><input type="text" name="operation-str" value={0}></td>',operation.operationStr)
			builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +								
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteOperation(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").eq(index).val(operation.operationId).selected({
				maxHeight: '200px',
				searchBox: 1
			});
		})
		recordPanel.find("input[name='save']").unbind("click").on("click",function(){saveOperation(playerIndex)})
		recordPanel.find("input[name='create']").unbind("click").on("click",function(){
			var builder = new StringBuilder();
			builder.append('<tr>');
			builder.append(operationList);
			builder.append('<td><input type="text" name="operation-str" value=""></td>')
			builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +	
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteOperation(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").last().selected({
				maxHeight: '200px',
				searchBox: 1
			});
		});
		recordPanel.find("legend").text("操作记录管理 -- "+players[playerIndex].characterName);
		recordPanel.modal('open');	
	},"application/json;charset=utf-8")
}

function saveOperation(playerIndex){
	var list = [];
	$.each(recordPanel.find("tr"),function(index,row){
		if(index==0) return true;
		list.push({
			playerId : players[playerIndex].playerId,
			operationId : $(row).find("select").val(),
			operator : ((players[playerIndex].isSp == 1) ? "sp":"")+players[playerIndex].characterName,
			operationStr : $(row).find("input[name='operation-str']").val() == "" ? 
					$(row).find("select option:selected").text() : $(row).find("input[name='operation-str']").val()
		})
	})
	var options = {
		playerId : players[playerIndex].playerId,
		jumpSettle : true,
		records : list
	}
	var url = getRootPath() + "/submitOperation";
	var common = new Common();
	common.callAction(JSON.stringify(options),url,function(data){
		closeRecordPanel();
		myInfo("保存成功！",function(){
			window.location = getRootPath() + "/admin-character";
		});
	},"application/json;charset=utf-8")
}

function deleteOperation(button){
	$(button).parents("tr").remove();
}

function closeRecordPanel(){
	recordPanel.modal("close");
}

</script>