<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="am-modal am-modal-no-btn" tabindex="-1" id="settle-panel">
	<div class="am-modal-dialog">
		<form class="am-form modal-am-form">
		 <fieldset>
		 	<legend>操作结算</legend>
		 		<div id="operation-detail">厄金特提交操作： 杀害叶什（妹），凶器放置于扬</div>
		 		<table class="am-table am-table-striped am-table-hover table-main" >
					<thead>
						<tr>
							<th width="200px">反馈角色</th>
							<th>反馈内容</th>
							<th width="100px">操作</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<div class="am-form-group">
					<input id="feedback-now" type="checkbox"> 立即反馈
				</div>
				<div class="am-form-group" style="text-align:center">
					<input type="button" class="am-btn am-btn-primary" value="新增" name="create">
					<input type="button" class="am-btn am-btn-secondary" value="保存" name="save">
					<input type="button" class="am-btn am-btn-default" value="关闭" onclick="closeSettlePanel()">
				</div>
		 </fieldset>
		 </form>
		</div>
</div>

<script type="text/javascript">
var settlePanel = $("#settle-panel")

function settleOperation(id,playerId,operationId,isDone,button){
	var list = settlePanel.find("tbody");
	list.empty();
	$("#operation-detail").text($(button).parents("li").find("p").first().text());
	$.each($(button).parents("li").find("p"),function(index,feedback){
		if($(feedback).text().indexOf("=>反馈")>-1){
			var colon = $(feedback).text().indexOf("：");
			var builder = new StringBuilder();
			builder.append('<tr>');
			builder.append(operationTarget);
			builder.appendFormat('<td><input type="text" name="feedback-str" value="{0}"></td>',$(feedback).text().substring(colon+1));
			builder.appendFormat('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +	
					'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteFeedback(this)"><span class="am-icon-trash-o"></span></button>'+								
					'</div></div></td></tr>');
			list.append(builder.toString());
			list.find("select").last().val($(feedback).data("player-id")).selected({
				maxHeight: '200px'
			});			
		}
	})
	settlePanel.find("input[name='save']").unbind("click").on("click",function(){saveFeedback(id,playerId,operationId,isDone)})
	settlePanel.find("input[name='create']").unbind("click").on("click",function(){
		var builder = new StringBuilder();
		builder.append('<tr>');
		builder.append(operationTarget);
		builder.append('<td><input type="text" name="feedback-str" value=""></td>');
		builder.appendFormat('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +	
				'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteFeedback(this)"><span class="am-icon-trash-o"></span></button>'+								
				'</div></div></td></tr>');
		list.append(builder.toString());
		list.find("select").last().selected({
			maxHeight: '200px',
			searchBox: 1
		});			
	});
	settlePanel.modal("open");
}

function saveFeedback(operationRecordId,playerId,operationId,isDone){
	var list = [];
	$.each(settlePanel.find("tr"),function(index,row){
		if(index==0) return true;
		list.push({
			playerId : $(row).find("select").val(),
			operationRecordId : operationRecordId,
			characterName : $(row).find("select").find("option:selected").text(),
			feedback : $(row).find("input[name='feedback-str']").val()
		})
	})
	var options = {
		operationRecordId : operationRecordId,
		playerId : playerId,
		operationId : operationId,
		isDone : isDone,
		feedbackNow : $("#feedback-now").is(':checked'),
		feedbacks : list
	}
	var url = getRootPath() + "/saveFeedback";
	var common = new Common();
	common.callAction(JSON.stringify(options),url,function(data){
		closeSettlePanel();
		myInfo("保存成功！",function(){
			window.location = getRootPath() + "/admin-character";
		});
	},"application/json;charset=utf-8")
}

function deleteFeedback(button){
	$(button).parents("tr").remove();
}

function closeSettlePanel(){
	settlePanel.modal("close");
}

</script>