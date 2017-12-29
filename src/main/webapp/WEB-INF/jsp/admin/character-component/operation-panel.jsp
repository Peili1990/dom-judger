<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="operation-panel">
	<div class="am-modal-dialog">
		<form class="am-form modal-am-form">
		 <fieldset>
		 	<legend>操作管理 -- 珀利</legend>
		 		<table class="am-table am-table-striped am-table-hover table-main" >
					<thead>
						<tr>
							<th width="200px">操作名称</th>
							<th width="150px">次数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<div class="am-form-group" style="text-align:center">
					<input type="button" class="am-btn am-btn-primary" value="新增" name="create">
					<input type="button" class="am-btn am-btn-secondary" value="保存" name="save">
					<input type="button" class="am-btn am-btn-default" value="关闭" onclick="closeOperationPanel()">
				</div>
		 </fieldset>
		 </form>
		</div>
</div>

<script>
var operationPanel = $("#operation-panel")
var operationList;

$(function(){
	getAllOperationList();
})

function getAllOperationList(){
	var url = getRootPath() + "/game/allOperationList";
	var common = new Common();
	common.callAction(null,url,function(data){
		var builder = new StringBuilder();
		builder.append('<td><select>');
		$.each(data.operationList,function(index,operation){
			builder.appendFormat('<option value="{0}">{1}</option>',operation.operationId,operation.operationName);
		})
		builder.append('</select></td>');
		operationList = builder.toString();
	})
}

function showOperationPanel(playerIndex){
	var url = getRootPath() + "/getOperationList";
	var common = new Common();
	var options = {
			playerId : players[playerIndex].playerId
	}
	common.callAction(options,url,function(data){
		var list = operationPanel.find("tbody");
		list.empty();
		$.each(data.operationList,function(index,operation){
			var builder = new StringBuilder();
			builder.appendFormat('<tr>');
			builder.appendFormat(operationList);
			builder.appendFormat('<td><input type="number" name="operation-times" value={0}></td>',operation.times)
			builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +												
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deletePlayerOperation(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").eq(index).val(operation.operationId).selected({
				maxHeight: '200px',
				searchBox: 1
			});
		})
		operationPanel.find("input[name='save']").unbind("click").on("click",function(){savePlayerOperation(playerIndex)})
		operationPanel.find("input[name='create']").unbind("click").on("click",function(){
			var builder = new StringBuilder();
			builder.append('<tr>');
			builder.append(operationList);
			builder.append('<td><input type="number" name="operation-times" value=0></td>')
			builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +												
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deletePlayerOperation(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").last().selected({
				maxHeight: '200px',
				searchBox: 1
			});
		});
		operationPanel.find("legend").text("操作管理 -- "+players[playerIndex].characterName);
		operationPanel.modal('open');	
	})
}

function closeOperationPanel(){
	operationPanel.modal("close");
}

function deletePlayerOperation(button){
	$(button).parents("tr").remove();
}

function savePlayerOperation(playerIndex){
	var list = [];
	$.each(operationPanel.find("tr"),function(index,row){
		if(index==0) return true;
		list.push({
			playerId : players[playerIndex].playerId,
			operationId : $(row).find("select").val(),
			times : $(row).find("input[name='operation-times']").val()
		})
	})
	var options = {
		playerId : players[playerIndex].playerId,
		operations : list
	}
	var url = getRootPath() + "/savePlayerOperation";
	var common = new Common();
	common.callAction(JSON.stringify(options),url,function(data){
		closeOperationPanel();
		myInfo("保存成功！");
	},"application/json;charset=utf-8")
}


</script>