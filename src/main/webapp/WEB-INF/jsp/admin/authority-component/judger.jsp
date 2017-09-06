<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
		<div class="am-form-group operation">
			<input type="button" class="am-btn am-btn-primary" value="添加法官" onclick="myPrompt('请输入添加的法官名称','addJudger()')">
		</div>
		<form class="am-form">
			<table class="am-table am-table-striped am-table-hover table-main">
				<thead>
					<tr>
						<th>ID</th>
						<th>当前状态</th>
						<th>权限等级</th>
						<th class="table-set" style="width:120px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${authorities}" var="authority">
						<tr>
							<td>${authority.nickname}</td>
							<td>${authority.statusDesc}</td>
							<td>${authority.authorityLevel}</td>
							<td>
								<div class="am-btn-toolbar">
                  				  	<div class="am-btn-group am-btn-group-xs">
                    					<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="修改" onclick=""><span class="am-icon-edit"></span></button>
                   						<button type="button" class="am-btn am-btn-default am-btn-xs" title="删除" onclick="removeJudger(${authority.userId},${authority.status})"><span class="am-icon-eraser"></span></button>    					
                  				  	</div>
                				</div>
                			</td>
                		</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</div>
			
<script>

function addJudger(){
	var url = getRootPath() + "/addJudger";
	var options = {
			judgerName : $("input[name='header']").val()
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		myInfo("添加成功！",function(){
			window.location = getRootPath()+"/admin-authority";
		});		
	})
}

function removeJudger(judgerId,isbusy){
	var url = getRootPath() + "/removeJudger";
	var options = {
			judgerId : judgerId
	}
	var common = new Common();
	if(isbusy){
		myAlert("该名法官不处于空闲状态，无法删除！");
		return;
	}
	common.callAction(options,url,function(data){
		myInfo("删除成功！",function(){
			window.location = getRootPath()+"/admin-authority";
		});			
	})
}


</script>