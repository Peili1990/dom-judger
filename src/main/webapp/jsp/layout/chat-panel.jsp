<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="chat-pool">

</div>


<!-- <div class="window noselect"> -->
<!--         <div class="pew"> -->
<!--             <span class="cross am-icon-close"></span> -->
<!--             <img src="http://q.qlogo.cn/qqapp/100229475/C06A0F683914D5FEEE6968887DDCF0AB/100" class="am-comment-avatar"> -->
<!--         	<span>2羽</span> -->
<!--         	<p>这个人很懒，什么都没写</p> -->
<!--         </div> -->
<!--         <div class="container"> -->
<!--             <ul> -->
<!--             	<li> -->
<!--             		<span class="self">小风 <time>2016/8/11 11:29:47</time></span> -->
<!--             		<p>反馈：死亡请留遗言</p> -->
<!--             	</li> -->
<!--             	<li> -->
<!--             		<span class="other">2羽<time>2016/8/11 11:29:47</time></span> -->
<!--             		<p>遗言：我是好人啊！</p> -->
<!--             	</li> -->
<!--             </ul> -->
<!--         </div> -->
<!--         <div class="base"> -->
<!--         	<textarea></textarea> -->
<!--         </div> -->
<!-- </div> -->

<script type="text/javascript">
var windows = [];

function createChat(chatInfo){
	var chat = new Chat();
	chat.newWindow(chatInfo);
	$("#"+chatInfo.chatId+" .pew").mousedown(function() {
	    chat.clicked = "Yeah.";
	});
	$("#"+chatInfo.chatId+" .cross").click(function(){
		$("#"+chatInfo.chatId).remove();
		windows.remove(chat);
	})
	windows.push(chat);
}

$("html").mousemove(function (event) {
	if(windows.length == 0) return;
	mausx = event.pageX;
    mausy = event.pageY;
	$.each($(windows),function(index,win){
		panel = $("#chat-pool .window:eq("+index+")")
		win.winx = panel.offset().left;
		win.winy = panel.offset().top;
		if(win.clicked == "Nope."){
			win.difx = mausx-win.winx;
			win.dify = mausy-win.winy;
		}
		win.newx = event.pageX - win.difx - panel.css("marginLeft").replace('px', '');
		win.newy = event.pageY - win.dify - panel.css("marginTop").replace('px', '');
		win.newx = win.newx < 0 ? 0 : win.newx;
		win.newx = win.newx > $(window).width() - panel.width()-3 ? $(window).width() - panel.width()-3 : win.newx;
		win.newy = win.newy < 0 ? 0 : win.newy;
		win.newy = win.newy > $(document).height()-panel.height() ? $(document).height()-panel.height() : win.newy;
		panel.css({ top: win.newy, left: win.newx });
    });
});

$("html").mouseup(function (event) {
	$.each($(windows),function(index,win){
		win.clicked = "Nope.";
	})
});

</script>