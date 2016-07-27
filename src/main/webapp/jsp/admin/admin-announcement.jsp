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
              						<div id="error-msg">按时发斯蒂芬</div>
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

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license. <a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</footer>

<script type="text/javascript">
var um = UM.getEditor("seat-table");


$(function(){
	$("#collapse-nav li:eq(2) .am-icon-star").removeClass("invisible");
})

function showEditNewspaperForm(){
	$(".edui-container").removeAttr("style");
	$(".edui-body-container").removeAttr("style").css({"height":"200px"});
	$("#newspaper-content").css({"display":"none"});
	$("#edit-newspaper").css({"display":"block"});
	$(".operation .am-btn").attr("disabled","disabled");
}

function editNewspaper(){
	var content = $("#newspaper-content").find("p");
	$("#headline").val($("#newspaper-content").find("h2").text()); 
	$("#headline-body").html(replaceTag(content.eq(0).html()));
	$("#subedition").html(replaceTag(content.eq(1).html()));
	$("#important-notice").html(replaceTag(content.eq(2).html()));
	um.setContent($("#seat-table-content").html());
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
		status : 0
	};
	common.callAction(options, url, function(data) {
		if (!data) {
			return;
		}
		switch (data.status) {
		case 1:
			$("#announcement-list").prepend("<option value='"+data.newspaperId+"'>"+$("input[name='header']").val()+"</option>");
			$("#announcement-list").get(0).selectedIndex = 0; 
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
	var url = getRootPath() + "/assemble/saveNewspaper";
	var options = {
			newspaperId : $('#announcement-list option:selected').val(),
			headline : recoverTag($("#headline").html()),
			headlineBody : recoverTag($("#headline-body").html()),
			subedition : recoverTag($("#subedition").html()),
			importantNotice : recoverTag($("#important-notice").html()),
			seatTable : um.getContent(),
			status : publish
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



</script>

</body>
</html>
