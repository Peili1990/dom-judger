<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>维多利亚的噩梦</strong> <small>后台结算管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" id="chat-list" data-am-dropdown>
      	<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
      		<span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span>
     	</a>
     	<ul class="am-dropdown-content">
          <li><a> 资料<span class="am-badge am-badge-warning float">1</span></a></li>
          <li><a> 资料<span class="am-badge am-badge-warning float">2</span></a></li>
          <li><a> 资料<span class="am-badge am-badge-warning float">3</span></a></li>
        </ul>
      </li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<script type="text/javascript">
  	var userId = ${user.id}
  	var db = getCurrentDb(userId);
  	var webSocket = new ReconnectingWebSocket( 'ws://'+'${chatServer}'+'/websocket/'+userId);
  	
  	webSocket.onerror = function(event) {
		myAlert(event.data);
	};

	webSocket.onopen = function(event) {
	}

	webSocket.onmessage = function(event) {
		content = JSON.parse(event.data);
		switch(content.message){
		case "speech":
			if(window.location.href.indexOf("announcement")>0){
				appendSpeech(content);
			}
			break;
		case "chat":
			dealChat(content);
			break;
		default:
			break;
		}
	};
	
	function establishChat(id,type){
		var common = new Common();
		var url = "http://" + "${chatServer}" + "/getConnectionInfo";
		var options = {
				fromUserId : userId
		};
		if(type=="user"){
			options.toUserId = id;	
		} else if(type=="player"){
			options.toPlayerId = id;
		}
		common.callAction(options, url, function(data) {
			if (!data) {
				return;
			}
			switch (data.status) {
			case 1:
				if(type=="player"){
					createChat(data.chatInfo);
				}
				return;
			default:
				myAlert(data.message);
				return;
			}
		})
	}
	
	function saveChatToDB(chatDetail,speaker){
		db.transaction(function (trans) {
            trans.executeSql("insert into chat_record_"+userId+"(chatId,userId,content,createTime) values(?,?,?,?) ", [chatDetail.chatId, speaker, chatDetail.content, chatDetail.createTime], function (ts, data1) {
            }, function (ts, message) {
                myAlert(message);
            });
        });
	}
	
	function dealChat(chatDetail){
		saveChatToDB(chatDetail,chatDetail.fromUserId);
		if($("#"+chatDetail.chatId).is(":visible")){
			appendChat(chatDetail);
		} else {
			chatId = chatDetail.chatId;
			chatMessage = getCache("nv_chat"+chatId);
			setCache("nv_chat"+chatId,chatMessage ? ++chatMessage : 1);
			unreadChat = getCache("nv_offline_chat"+userId);
			setCache("nv_offline_chat"+userId,unreadChat ? ++unreadChat : 1);
			setRedspot();
		}
	}
	
	function setRedspot(){
		
	}

</script>