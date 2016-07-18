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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">报名管理</strong> / <small>Apply management</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-3 am-u-md-push-9"> 
      	<div class="am-panel am-panel-default">
          <div class="am-panel-bd">
            <div class="user-info">
              <p>版杀信息</p>
              	<p class="user-info-order">
              	<c:choose>
                  <c:when test="${ applyingGame != null }">
                  	版杀名称：<strong>${ applyingGame.gameDesc }</strong><br>
              		当前状态：<strong>${ applyingGame.gameStatusDesc }</strong><br>
              		报名人数：<strong>${ applyingGame.playCurNum }/${ applyingGame.playerNum }</strong><br>
                  	开版时间：<strong>${ applyingGame.startDate }</strong><br>
                  	<c:if test="${ applyingGame.gameStatus == 1 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="changeGameStatus(${applyingGame.id},2)">结束报名</button>
                       <button type="button" class="am-btn am-btn-danger am-btn-xs" onclick="">修改报名帖</button></p>
                  	</c:if>
                  	<c:if test="${ applyingGame.gameStatus == 2 }">
                  	<p><button type="button" class="am-btn am-btn-primary am-btn-xs" 
                  		onclick="">结束报名</button>
                       <button type="button" class="am-btn am-btn-danger am-btn-xs" onclick="">修改报名帖</button></p>
                  	</c:if>
                  </c:when>
                  <c:otherwise>
                  	目前没有正在报名的版杀
                  </c:otherwise>
              	</c:choose>     
              	</p>
            </div>   
          </div>
        </div>
      </div>

      <div class="am-u-sm-12 am-u-md-9 am-u-md-pull-3">
      
      	<div class="am-panel am-panel-default" id="applyDetail">
          <div class="am-panel-bd">
            <div class="user-info">
              <p>报名情况</p>
              <p class="user-info-order">
              	<c:choose>
                  <c:when test="${ applyingGame != null }">
                  	<form class="am-form">
					  <table class="am-table am-table-striped am-table-hover table-main">
						<thead>
						  <tr>
							<th><input type="checkbox" /></th>
							<th>编号</th>
							<th>id</th>	
							<th>报名时间</th>
							<th>外在身份</th>
							<th>申请先驱</th>
							<th>实际身份</th>
							<th class="table-set">操作</th>
						  </tr>
						</thead>
						<tbody>
							<c:forEach items="${ applyingGame.players }" var="player" varStatus="playerStatus">
							  <tr>
								<td><input type="checkbox" /></td>
              					<td>${ playerStatus.index+1 }</td>
             					<td>${ player.nickname }</td>
              					<td>${ player.applyTime }</td>
              					<td>${ player.characterName }</td>
              					<td>${ player.applyPioneer }</td>
              					<td></td>
              					<td>
                				<div class="am-btn-toolbar">
                  				  <div class="am-btn-group am-btn-group-xs">
                    				<button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 查看版杀记录</button>
                   					<button class="am-btn am-btn-default am-btn-xs"><span class="am-icon-paper-plane-o"></span> 发送消息</button>
                    				<button class="am-btn am-btn-default am-btn-xs am-text-danger"><span class="am-icon-trash-o"></span> 踢出</button>
                  				  </div>
                				</div>
              					</td>
              				  </tr>
							</c:forEach>
						</tbody>
					  </table>
					</form>
                  </c:when>
                  <c:otherwise>
                  	目前没有正在报名的版杀          	
                    <p><button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="showApplyForm()">新建版杀</button>
                       <button type="button" class="am-btn am-btn-danger am-btn-xs" onclick="">申请成为其他版杀法官</button></p>
                  </c:otherwise>
              	</c:choose>
              </p>
            </div>     
          </div>
        </div>
      	
        <form class="am-form am-form-horizontal" id="applyPublish" style="display:none">
          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">版杀名称</label>
            <div class="am-u-sm-9">
              <input type="text" id="gameDesc" placeholder="版杀名称">
            </div>
          </div>

          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">法官配置</label>
            <div class="am-u-sm-9">
              <input type="text" value="${ sessionUser.nickname }" disabled="disabled">
            </div>
          </div>

          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">人数配置</label>
            <div class="am-u-sm-9">
              <select data-am-selected id="playerNum">
              	 <option value="19">19</option>
  				 <option value="22">22</option>
              </select>
            </div>
          </div>

          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">QQ群</label>
            <div class="am-u-sm-9">
              <input type="text" id="QQgroup" value="132697360">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-weibo" class="am-u-sm-3 am-form-label">预计开版时间</label>
            <div class="am-u-sm-9">
              <input type="text" id="startDate" class="am-form-field" placeholder="选择预计开版时间" data-am-datepicker readonly required />
            </div>
          </div>
          
          <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">外在身份选择方式</label>
            <div class="am-u-sm-9">
              <select data-am-selected id="characterSelect">
              	 <option value="A">个人选择</option>
  				 <option value="B">3选1</option>
              </select>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">备注</label>
            <div class="am-u-sm-9">
              <input type="text" id="remark" placeholder="">
            </div>
          </div>
		  
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <div id="error-msg"></div>
              <button type="button" class="am-btn am-btn-primary" onclick="submitApply(${sessionUser.id})">发布报名帖</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license. <a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</footer>

<script src="${baseUrl}js/apply/apply.js" type="text/javascript"></script>
</body>
</html>
