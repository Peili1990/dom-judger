<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
      <li class="admin-parent">
        <a class="am-cf"><span class="am-icon-file"></span> 版杀管理 <span class="am-icon-angle-right am-fr am-margin-right invisible"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
          <li><a href="${ baseUrl }admin-apply" class="am-cf"><span class="am-icon-check"></span> 报名管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow invisible"></span></a></li>
          <li><a href="${ baseUrl }admin-character"><span class="am-icon-puzzle-piece"></span> 角色状态<span class="am-icon-star am-fr am-margin-right admin-icon-yellow invisible"></span></a></li>
          <li><a href="${ baseUrl }admin-announcement"><span class="am-icon-th"></span> 发布公告<span class="am-icon-star am-fr am-margin-right admin-icon-yellow invisible"></span></a></li>
          <li><a href="${ baseUrl }admin-settlement"><span class="am-icon-tty"></span> 辅助结算<span class="am-icon-star am-fr am-margin-right admin-icon-yellow invisible"></span></a></li>
          <li><a href="${ baseUrl }admin-replay"><span class="am-icon-bug"></span> 复盘总结<span class="am-icon-star am-fr am-margin-right admin-icon-yellow invisible"></span></a></li>
        </ul>
      </li>
      <li><a href="${ baseUrl }admin-statistics"><span class="am-icon-line-chart"></span> 角色胜率<span class="am-icon-angle-right am-fr am-margin-right invisible"></span></a></li>
      <li><a href="${ baseUrl }admin-rule"><span class="am-icon-table"></span> 规则查看<span class="am-icon-angle-right am-fr am-margin-right invisible"></span></a></li>
      <li><a href="${ baseUrl }admin-authority"><span class="am-icon-pencil-square-o"></span> 权限管理<span class="am-icon-angle-right am-fr am-margin-right invisible"></span></a></li>
      <li><a href="#" onclick="logout()"><span class="am-icon-sign-out"></span> 注销</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告<span onclick="myPrompt('编辑公告','submitInfoMessage()')" class="cross float am-icon-edit"></span></p>
<!--         <p id="info-message">时光静好，与君语；细水流年，与君同。—— Amaze</p> -->
 			<p id="info-message"></p>
      </div>
    </div>

  </div>
  <!-- sidebar end -->
  
  <script type="text/javascript">
  
  	$(function(){
  		
  		$("#info-message").text(getCache("nv_info_message") ? getCache("nv_info_message") : infoMessage);
  	})
  	
  	function submitInfoMessage(){
  		var infoMessage = $("input[name='header']").val().trim();
  		if(infoMessage==""){
  			myAlert("公告不能为空！");
  			return;
  		}
  		var url = getRootPath() + "/submitInfoMessage";
  		var options = {
  			infoMessage : infoMessage
  		}
  		var common = new Common();
  		common.callAction(options,url,function(data){
  			myInfo("修改成功！");
  			setCache("nv_info_message",infoMessage);
  			$("#info-message").text(infoMessage);				
  		})
  	}

	function logout(){
		var url = getRootPath()+"/logoutAction";
		var common = new Common();
		common.callAction(null, url, function(data) {
			myInfo("登出成功！",function(){
				window.location = getRootPath() + "/index";
			});			
		})
	} 


  </script>