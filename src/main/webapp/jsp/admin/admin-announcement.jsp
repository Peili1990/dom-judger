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
<![endif]-->

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/chat-panel.jsp"></jsp:include>
<div class="am-cf admin-main">
 <jsp:include page="../layout/sider-bar.jsp"></jsp:include>

  <!-- content start -->
  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">发布公告</strong> / <small>Publish Announcement</small></div>
    </div>
    
    <hr/>
    
    <div class="am-g">
    
    	<div class="am-u-sm-12 am-u-md-5 am-u-md-push-7"> 
      		<div class="am-panel am-panel-default">
          		<div class="am-panel-bd">
          			<h2>角色发言</h2>
          			<ul class="am-comments-list am-comments-list-flip" id="speech-list">
          				<c:choose>
          					<c:when test="${ speechList != null}">
          						<c:forEach items="${ speechList}" var="speech">
          							<c:choose>
          								<c:when test="${ speech.type==3}">
          									<li class="am-panel am-panel-default">
          									<div class="am-panel-hd">游戏公告<time>${speech.createTime}</time></div>
          									<div class="am-panel-bd speech-tontent">${speech.content }</div>
          								</c:when>
          								<c:otherwise>
          									<li class="am-comment"> 
												<img src="${picServer}${speech.characterAvatar}" class="am-comment-avatar">
											<div class="am-comment-main">
											<header class="am-comment-hd">
												<div class="am-comment-meta">
												<a href="" class="am-comment-author">${speech.characterName}</a>
												<time>${speech.createTime }</time>
												</div>
											</header>
											<div class="am-comment-bd speech-tontent
												<c:if test="${ speech.type == 2 }">
													gesture-style
												</c:if>
												">${speech.content }</div>
											</div>
          								</c:otherwise>
          							</c:choose>
          								<input type="hidden" value="${speech.id }">			
										<div class="am-btn-toolbar float-toolbar">
											<div class="am-btn-group am-btn-group-xs">
												<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="统计字数" onclick="wordCount(this)"><span class="am-icon-pencil-square-o"></span></button>
												<button type="button" class="am-btn am-btn-default am-btn-xs" title="发送消息" onclick="establishChat(${player.playerId},'player')"><span class="am-icon-paper-plane-o"></span></button>
												<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteSpeech(${speech.id})"><span class="am-icon-trash-o"></span></button>
											</div>
										</div>
									</li>
          						</c:forEach> 
          					</c:when>
          					<c:otherwise>
          						没有相关发言
          					</c:otherwise>
          				</c:choose>      					
          			</ul>
          			<form class="am-form am-form-horizontal announce-box 
          				<c:if test="${speechList == null }">
          					invisible
          				</c:if>
          				">
          				<textarea placeholder="游戏内公告发布内容"></textarea>
          				<input type="button" class="am-btn am-btn-primary" value="发送" onclick="submitSpeech()">
          			</form>			
          		</div>
         	</div>
    	</div>
    	
    	<div class="am-u-sm-12 am-u-md-7 am-u-md-pull-5">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<c:choose>
						<c:when test="${ newspapers != null }">
							<div class="announcement-info">
								<select data-am-selected id="announcement-list">
								<c:forEach items="${ newspapers }" var="newspaper">
									<option value="${ newspaper.newspaperId }">${ newspaper.header }</option>
								</c:forEach>	
								</select>
							</div>
							<div class="am-form-group operation">
								<input type="button" class="am-btn am-btn-primary" value="编辑公告" onclick="editNewspaper()">
								<input type="button" class="am-btn am-btn-danger" value="新增公告" onclick="myPrompt('请输入新公告标题','createNewspaper()')">
							</div>
							<div id="newspaper-content">
								<input type="hidden" id="newspaper-type" value="${newspaperDetail.type }">
								<h2>${newspaperDetail.headline}</h2>
								<p>${newspaperDetail.headlineBody }</p>
								<p>${newspaperDetail.subedition }</p>
								<c:if test="${newspaperDetail.importantNotice!=null && not empty newspaperDetail.importantNotice}">
									<hr>
									<h3>重要公告</h3>
									<p>${newspaperDetail.importantNotice}</p>
								</c:if>
								<c:if test="${newspaperDetail.seatTable!=null && not empty newspaperDetail.seatTable }">
									<hr>
									<h3>座位表</h3>
									<div id="seat-table-content">${newspaperDetail.seatTable}</div>
								</c:if>
							</div>
							<form class="am-form am-form-horizontal" id="edit-newspaper" style="display:none">
  								<div class="am-form-group">
           							<label class="am-u-sm-2 am-form-label">报纸类型</label>
            						<div class="am-u-sm-10">
              							<label>
       										<input type="radio" name="newspaper-type" value="1"> 夜刊
      									</label>
      									<label>
        									<input type="radio" name="newspaper-type" value="2"> 日刊
      									</label>
            						</div>
        						</div>
  								<div class="am-form-group">
           							<label class="am-u-sm-2 am-form-label">头版头条</label>
            						<div class="am-u-sm-10">
              							<input type="text" id="headline" placeholder="头版头条">
            						</div>
        						</div>
        						<div class="am-form-group">
           							<label class="am-u-sm-2 am-form-label">头条内容</label>
            						<div class="am-u-sm-10">
              							<textarea id="headline-body" placeholder="头条内容"></textarea>
            						</div>
        						</div>
        						<div class="am-form-group">
           							<label class="am-u-sm-2 am-form-label">副版内容</label>
            						<div class="am-u-sm-10">
              							<textarea id="subedition" placeholder="副版内容"></textarea>
            						</div>
        						</div>
        						<div class="am-form-group">
           							<label class="am-u-sm-2 am-form-label">重要公告</label>
            						<div class="am-u-sm-10">
              							<textarea id="important-notice" placeholder="重要公告"></textarea>
            						</div>
        						</div>
        						<div class="am-form-group">
           							<label class="am-u-sm-2 am-form-label">座位表</label>
            						<div class="am-u-sm-10">
              							<textarea id="seat-table" placeholder="座位表"></textarea>
            						</div>
        						</div>
        						<div class="am-form-group">
            						<div class="am-u-sm-9 am-u-sm-push-3">
              						<div id="error-msg"></div>
              							<button type="button" class="am-btn am-btn-primary" onclick="saveNewspaper(1)">发布公告</button>
              							<button type="button" class="am-btn am-btn-danger" onclick="saveNewspaper(0)">保存草稿</button>
              							<button type="button" class="am-btn am-btn-warning" onclick="generateSeatTable()">生成座位表</button>              						
           							 </div>
          						</div>
  							</form>
						</c:when>
						<c:otherwise>
							没有进行中的版杀相关公告
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
    </div>
    

  </div>
  <!-- content end -->

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var um = UM.getEditor("seat-table");
var publishAction = 0;
var editAction = 0;
var gameId = ${gameId}

$(function(){
	$("#collapse-nav li:eq(2) .am-icon-star").removeClass("invisible");
})

function showNewspaperContent(){
	$("#edit-newspaper").css({"display":"none"});
	$("#newspaper-content").css({"display":"block"});
	$(".operation .am-btn").removeAttr("disabled");
}

function showEditNewspaperForm(){
	$(".edui-container").removeAttr("style");
	$(".edui-body-container").removeAttr("style").css({"height":"200px"});
	$("#newspaper-content").css({"display":"none"});
	$("#edit-newspaper").css({"display":"block"});
	$(".operation .am-btn").attr("disabled","disabled");
}

function editNewspaper(){
	var content = $("#newspaper-content").find("p");
	$("input[name='newspaper-type'][value="+$("#newspaper-type").val()+"]").attr("checked",true);
	$("#headline").val($("#newspaper-content").find("h2").text()); 
	$("#headline-body").html(replaceTag(content.eq(0).html()));
	$("#subedition").html(replaceTag(content.eq(1).html()));
	$("#important-notice").html(replaceTag(content.eq(2).html()));
	um.setContent(typeof($("#seat-table-content").html()) == "undefined" ? "" : $("#seat-table-content").html());
	showEditNewspaperForm();
}

function generateSeatTable(){
	$("#error-msg").css("display","none");
	$("#error-msg").text("");
	var url = getRootPath() + "/assemble/generateSeatTable";
	var common = new Common();
	common.callAction(null, url, function(data) {
		if (!data) {
			$("#error-msg").css("display","block");
			$("#error-msg").text("系统异常");
			return;
		}
		switch (data.status) {
		case 1:
			$("#error-msg").css("display","block");
			$("#error-msg").text("生成座位表成功！");
			um.setContent(data.seatTable);
			return;
		default:
			$("#error-msg").css("display","block");
			$("#error-msg").text(data.message);
			return;
		}
	});
}

function createNewspaper(){
	var common = new Common();
	var url = getRootPath() + "/assemble/saveNewspaper";
	var options = {	
		header : $("input[name='header']").val(),
		status : 0,
		type : 0
	};
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:	
			$("#announcement-list").prepend("<option value='"+data.newspaperId+"'>"+$("input[name='header']").val()+"</option>");
			$("#announcement-list").get(0).selectedIndex = 0;
			editAction = 1;
			showEditNewspaperForm();
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
	
}

function saveNewspaper(publish){
	$("#error-msg").css("display","none");
	$("#error-msg").text("");
	var type = $("input[name='newspaper-type']:checked").val();
	if(!type){
		$("#error-msg").css("display","block");
		$("#error-msg").text("请选择报纸类型！");
		return;
	}
	var url = getRootPath() + "/assemble/saveNewspaper";
	var options = {
			newspaperId : $('#announcement-list option:selected').val(),
			headline : $("#headline").val(),
			headlineBody : recoverTag($("#headline-body").val()),
			subedition : recoverTag($("#subedition").val()),
			importantNotice : recoverTag($("#important-notice").val()),
			seatTable : um.getContent(),
			status : publish,
			type : type
		}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			$("#error-msg").css("display","block");
			$("#error-msg").text("系统异常");
			return;
		}
		switch (data.status) {
		case 1:
			if(publish == 1){
				publishAction = 1;
				myInfo("公告发布成功！",function(){
					window.location = getRootPath() + "/admin-announcement";
				})
			} else {
				$("#error-msg").css("display","block");
				$("#error-msg").text("保存成功！");
			}
			return;
		default:
			$("#error-msg").css("display","block");
			$("#error-msg").text(data.message);
			return;
		}
	})
}

function isEditingNewspaper(){
	return $("#edit-newspaper").is(":visible");
}

$(window).bind('beforeunload', function(e) {
    if(isEditingNewspaper() && publishAction != 1){
    	return("你正在编辑公告，未保存的草稿将丢失");
    }
});

$("#announcement-list").change(function(){
	if(editAction == 1){
		editAction = 0;
		return;
	}	
	if(isEditingNewspaper()){
    	myConfirm("你正在编辑公告，未保存的草稿将丢失，确认继续吗？",'switchNewspaper()');
    } else {
    	switchNewspaper();
    }
})

function switchNewspaper(){
	var common = new Common();
	var url = getRootPath() + "/assemble/getNewspaperDetail";
	var options = {
		newspaperId : $('#announcement-list option:selected').val(),
	};
	common.callAction(options,url,function(data){
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			var newspaperDetail = data.newspaperDetail;
			var builder = new StringBuilder();
			$("#newspaper-content").empty();
			builder.appendFormat("<h2>{0}</h2>",newspaperDetail.headline ? newspaperDetail.headline:"");
			builder.appendFormat("<p>{0}</p><p>{1}</p>",newspaperDetail.headlineBody ? newspaperDetail.headlineBody:"",newspaperDetail.subedition ? newspaperDetail.subedition:"");
			if(newspaperDetail.importantNotice){
				builder.appendFormat("<hr><h3>重要公告</h3><p>{0}</p>",newspaperDetail.importantNotice);
			}
			if(newspaperDetail.seatTable){
				builder.append("<hr><h3>座位表</h3><div id='seat-table-content'></div>");
			}
			$("#newspaper-content").append(builder.toString());
			if(newspaperDetail.seatTable){
				$("#seat-table-content").html(newspaperDetail.seatTable);
			}
			if(data.speechList!=null){
				$("#speech-list").empty();
				$.each(data.speechList,function(index,speech){
					appendSpeech(speech);
				})
				$(".announce-box").removeClass("invisible");
			} else{
				$("#speech-list").empty().text("没有相关发言");
				$(".announce-box").addClass("invisible");
			}
			showNewspaperContent();
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

$.each($("#speech-list li"),function(){
	$(this).hover(function(){
		$(this).find(".float-toolbar").stop().fadeIn();
	},function(){
		$(this).find(".float-toolbar").stop().fadeOut();
	})
})

function appendSpeech(speech){
	var builder = new StringBuilder();
	if(speech.type == 3){
		builder.append('<li class="am-panel am-panel-default">');
		builder.appendFormat('<div class="am-panel-hd">游戏公告<time>{0}</time></div>',speech.createTime);
		builder.appendFormat('<div class="am-panel-bd speech-tontent">{0}</div>',speech.content);	
	} else {
		builder.append('<li class="am-comment">');
		builder.appendFormat('<a href=""><img src="{0}" class="am-comment-avatar"></a>',picServer+speech.avatar);
		builder.append('<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">');
		builder.appendFormat('<a href="" class="am-comment-author">{0}</a><time>{1}</time></div></header>',speech.characterName,speech.createTime);
		if(speech.type == 1){
			builder.appendFormat('<div class="am-comment-bd speech-tontent">{0}</div></div>',speech.content)
		}else{
			builder.appendFormat('<div class="am-comment-bd gesture-style speech-tontent">{0}</div></div>',speech.content)
		}
	}
	builder.appendFormat('<input type="hidden" value="{0}">',speech.id);
	builder.append('<div class="am-btn-toolbar float-toolbar">');
	builder.append('<div class="am-btn-group am-btn-group-xs">');
	builder.appendFormat('<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" title="统计字数" onclick="wordCount(this)"><span class="am-icon-pencil-square-o"></span></button>');
	builder.appendFormat('<button type="button" class="am-btn am-btn-default am-btn-xs" title="发送消息" onclick="establishChat({0},{1})"><span class="am-icon-paper-plane-o"></span></button>',speech.playerId,"'player'");
	builder.appendFormat('<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger" title="删除" onclick="deleteSpeech({0})"><span class="am-icon-trash-o"></span></button>',speech.id);
	builder.append('</div></div></li>');
	$("#speech-list").append(builder.toString());
	$("#speech-list li:last-child").hover(function(){
		$(this).find(".float-toolbar").stop().fadeIn();
	},function(){
		$(this).find(".float-toolbar").stop().fadeOut();
	})
	$("#speech-list").scrollTop($("#speech-list")[0].scrollHeight);
}

function submitSpeech(){
	var content = $(".announce-box").find("textarea").val().trim();
	if(content == ""){
		return;
	}
	var options = {
			gameId : gameId,
			newspaperId : $('#announcement-list option:selected').val(),
			content : recoverTag(content),
			type : 3
		}
	$(".announce-box").find("textarea").val("");
	var url = "http://" + "${chatServer}" + "/sumbitSpeech";
	var common = new Common();
	common.callAction(options, url, function(data) {
		
	})
}

function deleteSpeech(speechId){
	var url = "http://" + "${chatServer}" + "/deleteSpeech";
	var options = {
			gameId : gameId,
			newspaperId : $('#announcement-list option:selected').val(),
			speechId : speechId
		}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			$.each($("#speech-list li"),function(index,speech){
				if($(speech).find("input[type='hidden']").val() == speechId){
					$(speech).remove();
					return false;
				}
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

function wordCount(btn){	
	var url = getRootPath() + "/assemble/wordCount";
	var options = {
			content:$(btn).parents("li").find(".speech-tontent").text()
		}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("该发言共计："+data.wordCount+"字");
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
	
}

</script>

</body>
</html>
