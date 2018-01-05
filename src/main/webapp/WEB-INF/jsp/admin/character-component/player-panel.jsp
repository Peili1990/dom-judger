<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="player-panel">
	<div class="am-modal-dialog">
		<form class="am-form modal-am-form" id="status-form">
		 <fieldset>
		 	<legend>角色状态变更 -- </legend>
		 		<div class="float-panel">
		 			<table class="am-table am-table-striped am-table-hover table-main" id="status-table" >
						<thead>
							<tr>
								<th width="200px">状态</th>
								<th width="150px">持续阶段</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="am-form-group" style="text-align:center">
						<input type="button" class="am-btn am-btn-primary" value="新增" name="create-status">
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="count-table" >
						<thead>
							<tr>
								<th width="200px">计数</th>
								<th width="150px">计数数量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="am-form-group" style="text-align:center">
						<input type="button" class="am-btn am-btn-primary" value="新增" name="create-count">
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
var statusList;
var countList;


$(function(){
	addstatusStyle(players);
	getAllStatusList();
	getAllCountList();	
})

function getAllStatusList(){
	var url = getRootPath() + "/game/allStatusList";
	var common = new Common();
	common.callAction(null,url,function(data){
		var builder = new StringBuilder();
		builder.append('<td><select>');
		builder.append('<option value="0">请选择</option>');
		$.each(data.statusList,function(index,status){
			builder.appendFormat('<option value="{0}">{1}</option>',status.statusId,status.statusName);
		})
		builder.append('</select></td>');
		statusList = builder.toString();
	})
}

function getAllCountList(){
	var url = getRootPath() + "/game/allCountList";
	var common = new Common();
	common.callAction(null,url,function(data){
		var builder = new StringBuilder();
		builder.append('<td><select>');
		builder.append('<option value="0">请选择</option>');
		$.each(data.countList,function(index,count){
			builder.appendFormat('<option value="{0}">{1}</option>',count.countId,count.countName);
		})
		builder.append('</select></td>');
		countList = builder.toString();
	})
}


function showPlayerStatus(index){
	playerPanel.modal('open');
	playerPanel.find("legend").text("角色状态变更 -- "+players[index].characterName);
	changeRadioValue($("input[name='camp']"),players[index].camp);
	changeRadioValue($("input[name='is-sp']"),players[index].isSp);
	$("input[name='confirm']").unbind("click").on("click",function(){
		changePlayerStatus(players[index].playerId);
	})	
	var list1 = $("#status-table").find("tbody");
	list1.empty();
	$.each(players[index].status,function(index,status){
		var builder = new StringBuilder();	
		builder.append("<tr>");
		builder.append(statusList);
		builder.appendFormat('<td><input type="text" name="remain-stage" value={0}></td>',status.remainStage)
		builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +												
				'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deletePlayerStatus(this)"><span class="am-icon-trash-o"></span></button>'+								
				'</div></div></td></tr>');
		list1.append(builder.toString());
		list1.find("select").eq(index).val(status.statusId).selected({
			maxHeight: '200px',
			searchBox: 1
		});
	})
	playerPanel.find("input[name='create-status']").unbind("click").on("click",function(){
		var builder = new StringBuilder();
		builder.append('<tr>');
		builder.append(statusList);
		builder.append('<td><input type="text" name="remain-stage" value=""></td>')
		builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +	
				'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deletePlayerStatus(this)"><span class="am-icon-trash-o"></span></button>'+								
				'</div></div></td></tr>');
		list1.append(builder.toString());
		list1.find("select").last().selected({
			maxHeight: '200px',
			searchBox: 1
		});
	});
	var list2 = $("#count-table").find("tbody");
	list2.empty();
	$.each(players[index].count,function(index,count){
		var builder = new StringBuilder();	
		builder.append("<tr>");
		builder.append(countList);
		builder.appendFormat('<td><input type="text" name="count-num" value={0}></td>',count.countNum)
		builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +												
				'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deletePlayerCount(this)"><span class="am-icon-trash-o"></span></button>'+								
				'</div></div></td></tr>');
		list2.append(builder.toString());
		list2.find("select").eq(index).val(count.countId).selected({
			maxHeight: '200px',
			searchBox: 1
		});
	})
	playerPanel.find("input[name='create-count']").unbind("click").on("click",function(){
		var builder = new StringBuilder();
		builder.append('<tr>');
		builder.append(countList);
		builder.append('<td><input type="text" name="count-num" value=""></td>')
		builder.append('<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">' +	
				'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deletePlayerCount(this)"><span class="am-icon-trash-o"></span></button>'+								
				'</div></div></td></tr>');
		list2.append(builder.toString());
		list2.find("select").last().selected({
			maxHeight: '200px',
			searchBox: 1
		});
	});
}

function deletePlayerStatus(button){
	$(button).parents("tr").remove();
}

function deletePlayerCount(button){
	$(button).parents("tr").remove();
}

function addstatusStyle(players){
	$.each($("#character-info tr"),function(index,tr){
		player = $(tr).find("td").eq(0);
		if(players[index].status.indexOfKey("statusId",26) > 0 || players[index].status.indexOfKey("statusId",25) > 0){
			player.addClass("dead");
		}
		if(players[index].status.indexOfKey("statusId",4) > 0){
			player.addClass("silent");
		}
		if(players[index].isSp == "1"){
			player.text("sp"+players[index].characterName);
		}
		if(players[index].status.indexOfKey("statusId",29) > 0){
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

function changePlayerStatus(playerId){
	var list1 = [];
	$.each($("#status-table").find("tr"),function(index,row){
		if(index==0) return true;
		list1.push({
			playerId : playerId,
			statusId : $(row).find("select").val(),
			remainStage : $(row).find("input[name='remain-stage']").val()
		})
	})
	var list2 = [];
	$.each($("#count-table").find("tr"),function(index,row){
		if(index==0) return true;
		list2.push({
			playerId : playerId,
			countId : $(row).find("select").val(),
			countNum : $(row).find("input[name='count-num']").val(),
			countType : 1
		})
	})
	var options = {
		playerId : playerId,
		camp : parseInt($("input[name='camp']:checked").val()),
		isSp :parseInt($("input[name='is-sp']:checked").val()),
		status : list1,
		count : list2
	}
	var url = getRootPath() + "/updatePlayerStatus";
	var common = new Common();
	common.callAction(JSON.stringify(options),url,function(data){
		closePlayerStatus();
		myInfo("保存成功！",function(){
			window.location = getRootPath() + "/admin-character";
		});
	},"application/json;charset=utf-8")
}

function closePlayerStatus(){
	playerPanel.modal("close");
}


</script>