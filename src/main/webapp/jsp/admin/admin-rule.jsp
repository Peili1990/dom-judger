<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!doctype html>
<html class="no-js">
<head>
  <title>法官后台结算管理系统 - 维多利亚的噩梦</title>
  <jsp:include page="../layout/common.jsp"></jsp:include>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
</head>
<body>

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/chat-panel.jsp"></jsp:include>
<div class="am-cf admin-main">
  <jsp:include page="../layout/sider-bar.jsp"></jsp:include>
  
  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">规则查看</strong> / <small>Rule Checking</small></div>
    </div>

    <hr/>

    <div class="am-g">
    	<div class="am-u-sm-12 am-u-sm-centered" id="rule-content-box">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<div id="rule-nav">
						<div class="am-panel-hd">
							<h2>规则目录</h2>
						</div>
						<div class="am-panel-bd">
							<ul data-am-scrollspynav>
								<c:forEach items="${ rules }" var="rule">
									<li><a href="#rule-row-${rule.chapterId}">${ rule.chapter}</a></li>
									<c:if test="${not empty rule.indexs}">
										<ul class="second-index">
										<c:forEach items="${rule.indexs}" var="index">
											<li><a href="#rule-row-${rule.chapterId }-${index.indexId}">${index.header }</a></li>
										</c:forEach>
										</ul>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div id="rule-content">
						<c:forEach items="${ rules }" var="rule">
							<div class="am-panel-hd">
		 						<h2 class="am-panel-title">
		 						${ rule.chapter}
		 						</h2> 
							</div>
							<div class="am-panel-bd">
								<c:if test="${user.authority > 1}">
								<div class="am-form-group operation">
									<input type="button" class="am-btn am-btn-primary" value="编辑此模块" onclick="showRuleEditor(${rule.chapterId},0)">	
									<input type="button" class="am-btn am-btn-danger" value="增加子模块" onclick="showRuleEditor(${rule.chapterId},1,${fn:length(rule.indexs)})">						
								</div>
								</c:if>
								<div id="rule-row-${rule.chapterId}">
									${rule.content}
								</div>														
							</div>
							<c:if test="${not empty rule.indexs}">
								<c:forEach items="${rule.indexs}" var="index">
									<div class="am-panel-bd">
										<c:if test="${user.authority > 1}">
										<div class="am-form-group operation">
											<input type="button" class="am-btn am-btn-primary" value="编辑此模块" onclick="showRuleEditor(${rule.chapterId},0,${index.indexId})">	
										</div>
										</c:if>
										<div id="rule-row-${rule.chapterId }-${index.indexId}">
											${index.content}
										</div>																	
									</div>								
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="am-u-sm-12 am-u-sm-centered invisible" id="rule-editor-box">
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<div class="am-form-group operation">
						<input type="button" class="am-btn am-btn-primary" value="保存规则">	
						<input type="button" class="am-btn am-btn-danger" value="返回" onclick="showRuleContent()">						
					</div>
				</div>
				<div class="am-panel-bd">
					<textarea id="rule-editor" style="height:600px"></textarea> 
				</div>
			</div>
		</div>
		
    
    </div>
  </div>
  
  <div class="am-modal am-modal-confirm" tabindex="-1" id="my-textarea">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd">
    	请将bb代码复制到以下对话框
    <textarea id="bbcode-area"></textarea>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
    </div>
  </div>
  </div>
   <!-- content end -->

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
var um = UE.getEditor("rule-editor",{
	'enterTag':'br',
	'allowDivTransToP':false,
	'autoHeightEnabled' : false,
	'enableAutoSave' : false,
	'iframeCssUrl' :getRootPath()+'/assets/css/amazeui.min.css'});


$(function(){
	$(".admin-sidebar-list > li:eq(2) .am-icon-angle-right").removeClass("invisible");
	$("#rule-nav").css({top:$(window).scrollTop()+15});
})

function showRuleEditor(row,newIndex,index){
	$("#rule-content-box").addClass("invisible");
	$("#rule-editor-box").removeClass("invisible");
	$(".edui-container").removeAttr("style");
	$(".edui-body-container").removeAttr("style").css({"height":"600px"});
	if(newIndex==1){
		um.setContent("");
		$("#rule-editor-box .am-btn-primary").unbind("click").click(function(){
			myPrompt('请输入子模块的标题','saveRule('+row+','+index+',1)');			
		})
	} else if(index!=null){
		um.setContent($("#rule-row-"+row+"-"+index).html());
		$("#rule-editor-box .am-btn-primary").unbind("click").click(function(){
			saveRule(row,index,0)
		})
	} else {
		um.setContent($("#rule-row-"+row).html());
		$("#rule-editor-box .am-btn-primary").unbind("click").click(function(){
			saveRule(row,null,0)
		})
	}
	
}

function showRuleContent(){
	$("#rule-content-box").removeClass("invisible");
	$("#rule-editor-box").addClass("invisible");
}

function saveRule(row,index,newIndex){
	var url = getRootPath() + "/saveRule";
	var options = {
			row : row,
			index : index,
			newIndex : newIndex,
			content : dealRuleText(um.getContent()).trim()
	}
	if(newIndex==1){
		options.header = $("input[name='header']").val();
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("修改成功！",function(){
				window.location = getRootPath() + "/admin-rule";
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

$.each($("#rule-content .am-panel-bd"),function(){
	$(this).hover(function(){
		$(this).find(".float-toolbar").stop().fadeIn();
	},function(){
		$(this).find(".float-toolbar").stop().fadeOut();
	})
})

$(window).scroll(function(){
	$("#rule-nav").stop().animate({top:$(window).scrollTop()+15});
})

</script>

</body>
</html>