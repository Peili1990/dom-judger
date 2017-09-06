<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
	<div class="am-panel-bd">
	<h2>名单抽取</h2>
	<form class="am-form am-form-horizontal" id="list">
	<div class="am-form-group">
		<label class="am-u-sm-4 am-form-label">原始名单</label>
		<div class="am-u-sm-8">
			<input type="text" name="origin-str" placeholder="可填入总人数或者具体名字">
		</div>
	</div>
	<div class="am-form-group">
		<label class="am-u-sm-4 am-form-label">名单人数</label>
		<div class="am-u-sm-8">
			<input type="text" name="list-num" placeholder="">
		</div>
	</div>
	<div class="am-form-group">
		<label class="am-u-sm-4 am-form-label">抽取结果</label>
		<div class="am-u-sm-8">
			<input type="text" name="list-result" placeholder="">
		</div>
	</div>
	<div class="am-form-group">
		<div class="am-u-sm-4">
			<input type="checkbox" name="list-online">联机结算
		</div>
		<div class="am-u-sm-8">
			<button type="button" class="am-btn am-btn-primary"
				onclick="rollList()">开始</button>
			<button type="button" class="am-btn am-btn-danger" onclick="resetList()">重置</button>
		</div>
	</div>
</form>		
</div>
</div>

<script type="text/javascript">

function rollList(){
	str = $("#list input[name='origin-str']").val().trim();
	listNum = $("#list input[name='list-num']").val();
	if(str=="" || listNum == "" ||!listNum.isNumeric()){
		myAlert("信息请输入完整，名单人数为整数！");
		return;
	}
	if(str.isNumeric()){
		originList = [];
		for(var i=1;i<=str;i++){
			originList.push(i);
		}
		totalNum=str;	
	} else {
		originList = str.split(" ");
		totalNum=originList.length;
	}
	if(parseInt(totalNum)<parseInt(listNum)){
		myAlert("抽取名单人数小于总人数！");
		return;
	}
	originList.shuffle();
	var result = "";
	for(var i=0;i<listNum;i++){
		result +=originList[i];
		result +=" ";
	}
		
	if($("#list input[name='list-online']").is(":checked")){
		onlineSettlement(result,"list");
	} else {
		$("#list input[name='list-result']").val(result);
	}
}

function resetList(){
	$("#list input[name='origin-str']").val("");
	$("#list input[name='list-num']").val("");
	$("#list input[name='list-result']").val("");
}

</script>
