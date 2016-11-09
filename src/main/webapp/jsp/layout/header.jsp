<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>维多利亚的噩梦</strong> <small>后台结算管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
      	<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
      		<span class="am-icon-envelope-o"></span> 收件箱 <span id="unread-chat-num" class="am-badge am-badge-warning invisible">5</span>
     	</a>
     	<ul class="am-dropdown-content" id="chat-list">
        	<li><a>暂无未读消息</a></li>
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
  	var picServer = "${picServer}"
  	var webSocket = new ReconnectingWebSocket( 'ws://'+'${chatServer}'+'/websocket/'+userId);
  	
  	webSocket.onerror = function(event) {
		myAlert(event.data);
	};

	webSocket.onopen = function(event) {
		refresh = getCookie("refresh");
		if(!refresh){
			getOfflineMessage();
		} else {
			setRedspot();
		}
		
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
		case "settlement":
			dealSettlement(content);
			break;
		default:
			break;
		}
	};
	
	$(window).bind('unload', function(e) {
		setCookie("refresh",true,"5s");
	});
	
	function getOfflineMessage(){
		var url = getRootPath() + "/getOfflineMessage";
		var common = new Common();
		common.callAction(null, url, function(data) {
			if(!data){
				return;
			}
			switch (data.status){
			case 1:
				totalChat = 0;
				chatInfoListStr = getCache("nv_chat_info"+userId);
				chatInfoList = chatInfoListStr ? JSON.parse(chatInfoListStr) : [];
				$.each(data.offlineChat,function(index,chat){
					totalChat+=parseInt(chat.num);
					i = indexOfKey(chatInfoList,chat.chatId);
					if(i<0){
						chatInfoList.push(chat);
					} else {
						chatInfoList[i].toUserAvatar = chat.toUserAvatar;
						chatInfoList[i].toUserMotto = chat.toUserMotto;
						chatInfoList[i].toUserId = chat.toUserId;
						chatInfoList[i].num = chatInfoList[i].num > chat.num ? chatInfoList[i].num : chat.num; 
					}
				})
				setCache("nv_chat_info"+userId,JSON.stringify(chatInfoList));				
				setCache("nv_offline_chat"+userId,totalChat);
				setRedspot();
				return;
			case 0:
				timeoutHandle();
				return;
			default:
				myAlert(data.message);
				return;
			}	
		});
	}
	
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
	
	function dealChat(chatDetail){
		if($("#"+chatDetail.chatId).is(":visible")){
			appendChat(chatDetail,false,true);
		} else {
			unreadChat = getCache("nv_offline_chat"+userId);
			setCache("nv_offline_chat"+userId,unreadChat ? ++unreadChat : 1);
			chatId = chatDetail.chatId;
			chatInfoListStr = getCache("nv_chat_info"+userId);
			chatInfoList = chatInfoListStr ? JSON.parse(chatInfoListStr) : [];
			i = indexOfKey(chatInfoList,chatId);
			if(i<0){
				var url = getRootPath() + "/getChatInfo";
	        	var common = new Common();
	       		var options = {
	        		chatId : chatId
	        	}
	        	common.callAction(options, url, function(data) {
	            if(!data){
	           	    return;
	            }
	            switch (data.status){
	           	   case 1:
	           		    chatInfo = data.chatInfo;
	           		    chatInfo.num = 1;
	           		    chatInfoList.push(chatInfo);
	           		    setCache("nv_chat_info"+userId,JSON.stringify(chatInfoList));
	           		    setRedspot();
	           			return;
	           		case 0:
	           			timeoutHandle();
	           			return;
	           		default:
	           			myAlert(data.message);
	           			return;
	           		}
	          	})
			} else {
				chatInfoList[i].num++;
				setCache("nv_chat_info"+userId,JSON.stringify(chatInfoList));
				setRedspot();
			}
		}
	}
	
	function setRedspot(){     
		chatInfoListStr = getCache("nv_chat_info"+userId);
		chatInfoList = chatInfoListStr ? JSON.parse(chatInfoListStr) : [];
        $("#chat-list").empty();
        $.each(chatInfoList,function(index,chatInfo){
           	if(chatInfo.num>0){
           		var builder = new StringBuilder();
               	builder.appendFormat('<li><a><img src="{0}"> {1}<span class="am-badge am-badge-warning float">{2}</span></a></li>',picServer+chatInfo.toUserAvatar,chatInfo.toUserNickname,chatInfo.num);
               	$("#chat-list").append(builder.toString());
               	$("#chat-list li:last-child").click(function(){
               		createChat(chatInfo);
               		$(this).addClass("invisible");              		
               		setCache("nv_offline_chat"+userId,getCache("nv_offline_chat"+userId)-chatInfo.num);
               		chatInfo.num = 0;
               		setCache("nv_chat_info"+userId,JSON.stringify(chatInfoList));
               		setTotalRedspot();
            	})
           	}   	
        })    
        setTotalRedspot();           	
	}
	
	function setTotalRedspot(){
		unreadChat = getCache("nv_offline_chat"+userId) ? getCache("nv_offline_chat"+userId) : 0;
		if(unreadChat>0){
			$("#unread-chat-num").text(unreadChat).removeClass("invisible");
		} else {
			$("#chat-list").append("<li><a>暂无未读消息</a></li>")
			$("#unread-chat-num").addClass("invisible");
		}
	}
	
	function dealSettlement(content){
		if(window.location.href.indexOf("settlement")>0){
			switch(content.settlement){
			case "dice":
				$("#dice input[name='dice-result']").val(content.content);
				break;
			case "list":
				$("#list input[name='list-result']").val(content.content);
				break;
			case "yika":
				$("#yika input[name='yika-result']").val(content.content);
				break;
			case "yang":
				$("#yang input[name='yang-result']").val(content.content);
				break;
			default:
				break;			
			}
		}
	}

</script>