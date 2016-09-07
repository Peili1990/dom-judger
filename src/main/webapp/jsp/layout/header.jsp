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
  	var db = getCurrentDb(userId);
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
				totalChat = getCache("nv_offline_chat"+userId);
				setCache("nv_offline_chat"+userId,totalChat > 0 ? parseInt(totalChat)+parseInt(data.offlineChat.length) : parseInt(data.offlineChat.length));
				$.each(data.offlineChat,function(index,chat){
					chatMessage = getCache("nv_chat"+chat.chatId);
					setCache("nv_chat"+chat.chatId, chatMessage > 0 ? ++chatMessage : 1);
					db.transaction(function (trans) {
			            trans.executeSql("insert into chat_record_"+userId+"(chatId,userId,content,createTime) values(?,?,?,?) ", [chat.chatId, chat.fromUserId, chat.content, chat.createTime], function (ts, data1) {
			            }, function (ts, message) {
			                myAlert(message);
			            });
			        });
				})
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
			appendChat(chatDetail,false,true);
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
		db.transaction(function (trans) {
            trans.executeSql("select chatId, content, max(createTime), count(distinct chatId) from chat_record_"+userId+" group by chatId", [], function (ts, webData) {
            	if(webData){
           			var chatIdList = [];
           			for(var i=0;i<webData.rows.length;i++){
           				if(getCache("nv_chat"+webData.rows.item(i).chatId)){
           					chatIdList.push(webData.rows.item(i).chatId)
           				}
           			}
           			if(chatIdList.length>0){
           				var url = getRootPath() + "/getChatInfo";
           				var common = new Common();
           				common.callAction(JSON.stringify(chatIdList), url, function(data) {
           					if(!data){
           						return;
           					}
           					switch (data.status){
           					case 1:
           						$("#chat-list").empty();
           						$.each(data.chatList,function(index,chatInfo){
           							chatMessage = getCache("nv_chat"+chatInfo.chatId);
           							var builder = new StringBuilder();
           							builder.appendFormat('<li><a><img src="{0}"> {1}<span class="am-badge am-badge-warning float">{2}</span></a></li>',picServer+chatInfo.toUserAvatar,chatInfo.toUserNickname,chatMessage);
           							$("#chat-list").append(builder.toString());
           							$("#chat-list li:last-child").click(function(){
           								createChat(chatInfo);
           								$(this).addClass("invisible");
           								delCache("nv_chat"+chatInfo.chatId);
           								setCache("nv_offline_chat"+userId,getCache("nv_offline_chat"+userId)-chatMessage);
           								setTotalRedspot();
           							})
           						})    
           						setTotalRedspot();
           						return;
           					case 0:
           						timeoutHandle();
           						return;
           					default:
           						myAlert(data.message);
           						return;
           					}
           				},"application/json;charset=utf-8")
            		}
            	}
            }, function (ts, message) {myAlert(message)})
		})
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