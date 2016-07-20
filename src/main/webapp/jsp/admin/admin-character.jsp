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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">角色状态</strong> / <small>Character Status</small></div>
    </div>

    <hr/>

    <div class="am-g">
    	<div class="am-u-sm-12 am-u-sm-centered">
    		<div class="am-panel am-panel-default">
    			<div class="am-panel-bd">
    				<div class="character-info">
    					<select data-am-selected>
              	 			<option value="A">游戏开始前</option>
  				 			<option value="B">第一夜</option>
              			</select>
              		</div>
              		<form class="am-form">
					  <table class="am-table am-table-striped am-table-hover table-main">
						<thead>
						  <tr>
							<th width="90px">角色</th>
							<th>实际身份</th>
							<th>行动</th>
							<th>特权</th>
							<th>反馈</th>
							<th>投票</th>
							<th>备注</th>
							<th class="table-set" width="130px">操作</th>
						  </tr>
						</thead>
						<tbody id="character-info">
							<tr>
              					<td>普拉马逊斯</td>
             					<td><input type="text" value="警察（星型警徽）"></td>
              					<td><input type="text" value="查验沃兹沃斯"></td>
              					<td><input type="text" value="野蛮人野蛮人 昆西"></td>
              					<td><input type="text" value="沃兹沃斯是杀手（棍）；昆西是平民/帮众"></td>
              					<td><input type="text" value="马克唐"></td>            					
              					<td><input type="text" value="衰竭"></td>
              					<td>
                				<div class="am-btn-toolbar">
                  				  <div class="am-btn-group am-btn-group-xs">
                    				<button class="am-btn am-btn-default am-btn-xs am-text-secondary" title="结算"><span class="am-icon-pencil-square-o"></span></button>
                   					<button class="am-btn am-btn-default am-btn-xs" title="发送消息"><span class="am-icon-paper-plane-o"></span></button>
                   					<button class="am-btn am-btn-default am-btn-xs am-text-success" title="查看提交时间"><span class="am-icon-clock-o"></span></button>
                  				  </div>
                				</div>
              					</td>
              				  </tr>
              				  <tr>
              					<td>普拉马逊斯</td>
             					<td><input type="text" value="警察（星型警徽）"></td>
              					<td><input type="text" value="查验沃兹沃斯"></td>
              					<td><input type="text" value="野蛮人野蛮人 昆西"></td>
              					<td><input type="text" value="沃兹沃斯是杀手（棍）；昆西是平民/帮众"></td>
              					<td><input type="text" value="马克唐"></td>            					
              					<td><input type="text" value="衰竭"></td>
              					<td>
                				<div class="am-btn-toolbar">
                  				  <div class="am-btn-group am-btn-group-xs">
                    				<button class="am-btn am-btn-default am-btn-xs am-text-secondary" title="结算"><span class="am-icon-pencil-square-o"></span></button>
                   					<button class="am-btn am-btn-default am-btn-xs" title="发送消息"><span class="am-icon-paper-plane-o"></span></button>
                   					<button class="am-btn am-btn-default am-btn-xs am-text-success" title="查看提交时间"><span class="am-icon-clock-o"></span></button>
                  				  </div>
                				</div>
              					</td>
              				  </tr>
						</tbody>
						</table>
					</form>
    				
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

</body>
</html>
