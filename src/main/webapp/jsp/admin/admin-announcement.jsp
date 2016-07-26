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
								<input type="button" class="am-btn am-btn-danger" value="新增公告" onclick="myPrompt('注意：请先保存表格再新增表格，否则可能导致数据丢失！<br/>请输入新表格标题','updateForm(true)')">
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
									<h3>座次表</h3>
									<p>${newspaperDetail.seatTable}</p>
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
           							<label class="am-u-sm-2 am-form-label">座次表</label>
            						<div class="am-u-sm-10">
              							<textarea id="seat-table" placeholder="座次表"></textarea>
            						</div>
        						</div>
        						<div class="am-form-group">
            						<div class="am-u-sm-9 am-u-sm-push-3">
              						<div id="error-msg"></div>
              							<button type="button" class="am-btn am-btn-primary" onclick="showData()">发布公告</button>
              							<button type="button" class="am-btn am-btn-danger" onclick="">保存公告</button>
              							<button type="button" class="am-btn am-btn-warning" onclick="">生成座次表</button>
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

$(function(){
	$("#collapse-nav li:eq(2) .am-icon-star").removeClass("invisible");
})

function showEditNewspaperForm(){
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
	$("#seat-table").html(replaceTag(content.eq(3).html()));
	showEditNewspaperForm();
}

function showData(){
	alert($("#headline-body").html());
}

</script>

</body>
</html>
