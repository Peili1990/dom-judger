<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
		<div class="am-form-group operation">
			<input type="button" class="am-btn am-btn-primary" value="字典增加" onclick="addWord()">
		</div>
		<div class="am-form-group operation am-form">
			<input type="text" id="new-word"/>
		</div>	
	</div>
</div>

<script>

function addWord(){
	var word = $("#new-word").val().trim();
	$("#new-word").val("");
	if(word==""){
		myAlert("请输入词语");
		return;
	}
	var url = getRootPath() + "/addWord";
	var options ={
			word : word
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("添加成功！");
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}


</script>