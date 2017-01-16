<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="am-panel am-panel-default">
      		
    <div class="am-panel-bd code-style" >
        <div class="am-form-group operation">
			<input type="button" class="am-btn am-btn-primary" value="批量生成" onclick="myPrompt('请输入生成邀请码个数','generateInvCode()')">
		</div>
        <p>未使用的邀请码</p>
        <c:forEach items="${invcodes}" var="invcode">
         	<span>${invcode }</span>
        </c:forEach>
         			
    </div>
</div>

<script>

function generateInvCode(){
	var url = getRootPath() + "/generateInvCode";
	var options = {
			codeNum : $("input[name='header']").val()
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:		
			myInfo("批量生成成功！",function(){
				window.location = getRootPath()+"/admin-authority";
			});
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
		
}

</script>