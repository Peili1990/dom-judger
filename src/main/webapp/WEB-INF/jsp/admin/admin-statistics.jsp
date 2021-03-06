<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js">
<head>
  <title>法官后台结算管理系统 - 维多利亚的噩梦</title>
  <jsp:include page="../layout/common.jsp"></jsp:include>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
</head>

<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif] -->

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/chat-panel.jsp"></jsp:include>
	<div class="am-cf admin-main">
		<jsp:include page="../layout/sider-bar.jsp"></jsp:include>

		<!-- content start -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">角色胜率</strong> / <small>Character
						Winrate</small>
				</div>
			</div>

			<hr />

			<div class="am-g">
				<div class="am-u-sm-12 am-u-sm-centered">
					<div class="am-panel am-panel-default">
						<div class="am-panel-bd">
							<form class="am-form">
								<table
									class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr id="character-header-fixed">
											<th title="双击重新排序" ondblclick="reorder('characterId')">编号</th>
											<th width="90px">角色</th>
											<th title="双击重新排序" ondblclick="reorder('totalPlayTimes')">总登场</th>
											<th title="双击重新排序" ondblclick="reorder('goodCampTimes')">好人方</th>
											<th title="双击重新排序" ondblclick="reorder('killerCampTimes')">杀手方</th>
											<th title="双击重新排序" ondblclick="reorder('contractCampTimes')">契约方</th>
											<th title="双击重新排序" ondblclick="reorder('goodCampWinTimes')">好人方胜利</th>
											<th title="双击重新排序" ondblclick="reorder('killerCampWinTimes')">杀手方胜利</th>
											<th title="双击重新排序" ondblclick="reorder('contractCampWinTimes')">契约方胜利</th>
											<th title="双击重新排序" ondblclick="reorder('tiedTimes')">平局次数</th>
											<th title="双击重新排序" ondblclick="reorder('totalWinTimes')">总胜利</th>
											<th title="双击重新排序" ondblclick="reorder('goodCampWinrate')">好人方胜率</th>
											<th title="双击重新排序" ondblclick="reorder('killerCampWinrate')">杀手方胜率</th>
											<th title="双击重新排序" ondblclick="reorder('contractCampWinTimes')">契约方胜率</th>
											<th title="双击重新排序" ondblclick="reorder('totalWinrate')">总胜率</th>
											<th title="双击重新排序" ondblclick="reorder('undefeatedRate')">不败率</th>
										</tr>
										<tr id="character-header" class="invisible">
											<th title="双击重新排序" ondblclick="reorder('characterId')">编号</th>
											<th width="90px">角色</th>
											<th title="双击重新排序" ondblclick="reorder('totalPlayTimes')">总登场</th>
											<th title="双击重新排序" ondblclick="reorder('goodCampTimes')">好人方</th>
											<th title="双击重新排序" ondblclick="reorder('killerCampTimes')">杀手方</th>
											<th title="双击重新排序" ondblclick="reorder('contractCampTimes')">契约方</th>
											<th title="双击重新排序" ondblclick="reorder('goodCampWinTimes')">好人方胜利</th>
											<th title="双击重新排序" ondblclick="reorder('killerCampWinTimes')">杀手方胜利</th>
											<th title="双击重新排序" ondblclick="reorder('contractCampWinTimes')">契约方胜利</th>
											<th title="双击重新排序" ondblclick="reorder('tiedTimes')">平局次数</th>
											<th title="双击重新排序" ondblclick="reorder('totalWinTimes')">总胜利</th>
											<th title="双击重新排序" ondblclick="reorder('goodCampWinrate')">好人方胜率</th>
											<th title="双击重新排序" ondblclick="reorder('killerCampWinrate')">杀手方胜率</th>
											<th title="双击重新排序" ondblclick="reorder('contractCampWinTimes')">契约方胜率</th>
											<th title="双击重新排序" ondblclick="reorder('totalWinrate')">总胜率</th>
											<th title="双击重新排序" ondblclick="reorder('undefeatedRate')">不败率</th>
										</tr>
									</thead>
									<tbody id="character-list">
										<c:forEach items="${ characterData }" var="character">
											<tr ondblclick="showCharacterRecord(${character.characterId})" title="双击查看详情">
												<td>${character.characterId}</td>
												<td>${character.characterName}</td>
												<td>${character.totalPlayTimes}</td>
												<td>${character.goodCampTimes}</td>
												<td>${character.killerCampTimes}</td>
												<td>${character.contractCampTimes}</td>
												<td>${character.goodCampWinTimes}</td>
												<td>${character.killerCampWinTimes}</td>
												<td>${character.contractCampWinTimes}</td>
												<td>${character.tiedTimes}</td>
												<td>${character.totalWinTimes}</td>
												<td>${character.goodCampWinrate}</td>
												<td>${character.killerCampWinrate}</td>
												<td>${character.contractCampWinrate}</td>
												<td>${character.totalWinrate}</td>
												<td>${character.undefeatedRate}</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- content end -->

		<div class="am-modal am-modal-no-btn" tabindex="-1" id="character-record-panel">
			<div class="am-modal-dialog">
				<form class="am-form modal-am-form">
					<fieldset>
						<legend>角色历史记录 -- 珀利</legend>
						<table class="am-table am-table-striped am-table-hover table-main" style="max-height:300px;overflow-y:scroll">
							<thead>
								<tr>
								<th>版杀名称</th>
								<th>是否sp</th>
								<th>实际身份</th>
								<th>最终结果</th>
								<th>备注</th>
								</tr>
							</thead>
							<tbody id="record-detail">
							</tbody>
						</table>
						<div class="am-form-group" style="text-align:center">			
							<input type="button" class="am-btn am-btn-primary" value="关闭" onclick="closeCharacterRecord()">
						</div>
					</fieldset>
				</form>
			</div>
		</div>

	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var characterData = ${characterDataStr};

$(function(){
	$(".admin-sidebar-list > li:eq(1) .am-icon-angle-right").removeClass("invisible");
	$.each($("#character-header th"),function(index,th){
		$(th).css("width",$("#character-header-fixed th:eq("+index+")").width()+16.8);
	})
})

$(window).scroll(function(){
	 var scrollH=document.body.scrollTop||document.documentElement.scrollTop;
	 
	    if(scrollH>174){
	        $("#character-header").removeClass("invisible");
	    }else {
	    	$("#character-header").addClass("invisible");
	    }
})

$(window).resize(function(){
	$("#character-header").css("width",$("#character-list").width());
})

function reorder(key){
	characterData.sort(function(a,b){
		return key == 'characterId' ? 
				parseFloat(a[key]) - parseFloat(b[key]) : parseFloat(b[key]) == parseFloat(a[key]) ? 
						parseFloat(a['characterId']) - parseFloat(b['characterId']) : parseFloat(b[key]) - parseFloat(a[key]);
	});
	$("#character-list").empty();
	$.each(characterData,function(index,character){
		var builder = new StringBuilder();
		builder.appendFormat('<tr ondblclick="showCharacterRecord({0})" title="双击查看详情">',character.characterId);
		builder.appendFormat("<td>{0}</td>",character.characterId);
		builder.appendFormat("<td>{0}</td>",character.characterName);
		builder.appendFormat("<td>{0}</td>",character.totalPlayTimes);
		builder.appendFormat("<td>{0}</td>",character.goodCampTimes);
		builder.appendFormat("<td>{0}</td>",character.killerCampTimes);
		builder.appendFormat("<td>{0}</td>",character.contractCampTimes);
		builder.appendFormat("<td>{0}</td>",character.goodCampWinTimes);
		builder.appendFormat("<td>{0}</td>",character.killerCampWinTimes);
		builder.appendFormat("<td>{0}</td>",character.contractCampWinTimes);
		builder.appendFormat("<td>{0}</td>",character.tiedTimes);
		builder.appendFormat("<td>{0}</td>",character.totalWinTimes);
		builder.appendFormat("<td>{0}</td>",character.goodCampWinrate);
		builder.appendFormat("<td>{0}</td>",character.killerCampWinrate);
		builder.appendFormat("<td>{0}</td>",character.contractCampWinrate);
		builder.appendFormat("<td>{0}</td>",character.totalWinrate);
		builder.appendFormat("<td>{0}</td>",character.undefeatedRate);
		builder.append("</tr>");
		$("#character-list").append(builder.toString());
	})
}

function showCharacterRecord(characterId){
	$.get("${baseUrl}file/character-winrate.json",function(data){
		$("#record-detail").empty();
		var record = data.characters[characterId-1];
		$("#character-record-panel legend").text("角色历史记录 -- "+record.characterName);
		$.each(record.data,function(index,detail){
			if(detail.sign==""){
				return true;
			}
			var builder = new StringBuilder();
			builder.append("<tr>");
			builder.appendFormat("<td>{0}</td>",detail.gameName);
			builder.appendFormat("<td>{0}</td>",detail.isSp);
			builder.appendFormat("<td>{0}</td>",detail.sign);
			builder.appendFormat("<td>{0}</td>",detail.result);
			builder.appendFormat("<td>{0}</td>",detail.remark);
			builder.append("</tr>");
			$("#record-detail").append(builder.toString());
		})
		var url = getRootPath() + "/getCharacterRecord";
		var options = {
				characterId : characterId
		}
		var common = new Common();
		common.callAction(options,url,function(data){
			$.each(data.records,function(index,detail){
				var builder = new StringBuilder();
				builder.append("<tr>");
				builder.appendFormat("<td>{0}</td>",detail.gameName);
				builder.appendFormat("<td>{0}</td>",detail.isSp);
				builder.appendFormat("<td>{0}</td>",detail.sign);
				builder.appendFormat("<td>{0}</td>",detail.result);
				builder.appendFormat("<td>{0}</td>",detail.remark);
				builder.append("</tr>");
				$("#record-detail").append(builder.toString());
			})
			$("#character-record-panel").modal('open');				
		})
	})
}

function closeCharacterRecord(){
	$("#character-record-panel").modal('close');
}

</script>
</body>
</html>
