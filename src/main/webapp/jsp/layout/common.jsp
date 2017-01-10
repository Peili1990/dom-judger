<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${baseUrl}assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${baseUrl}assets/css/admin.css">
<link rel="stylesheet" type="text/css" href="${baseUrl}css/chat-panel.css">
<link rel="stylesheet" type="text/css" href="${baseUrl}css/common.css">
<script src="${baseUrl}js/common/jquery-3.0.0.min.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/reconnecting-websocket.min.js" type="text/javascript"></script>
<script src="${baseUrl}ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="${baseUrl}ueditor/ueditor.all.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/common.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/amazeui.min.js" type="text/javascript"></script>

<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
  <div class="am-modal-dialog">
    <div class="am-modal-hd"></div>
    <div class="am-modal-bd">
      <span class="am-icon-warning"></span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd"></div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="info-query">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">维多利亚的噩梦</div>
		<div class="am-modal-bd">
		<ul>
		</ul>
		</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			<span class="am-modal-btn" data-am-modal-cancel>取消</span>
		</div>
	</div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd"></div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>      
    </div>
  </div>
</div>

<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-loading">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">正在保存...</div>
    <div class="am-modal-bd">
      <span class="am-icon-spinner am-icon-spin"></span>
    </div>
  </div>
</div>


