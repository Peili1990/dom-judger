<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 版杀管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
          <li><a href="${ baseUrl }admin-apply" class="am-cf"><span class="am-icon-check"></span> 报名管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="${ baseUrl }admin-character"><span class="am-icon-puzzle-piece"></span> 角色状态</a></li>
          <li><a href="admin-gallery.html"><span class="am-icon-th"></span> 发布公告</a></li>
          <li><a href="admin-log.html"><span class="am-icon-calendar"></span> 发送反馈</a></li>
          <li><a href="admin-404.html"><span class="am-icon-bug"></span> 复盘总结</a></li>
        </ul>
      </li>
      <li><a href="admin-table.html"><span class="am-icon-table"></span> 规则更新</a></li>
      <li><a href="admin-form.html"><span class="am-icon-pencil-square-o"></span> 权限管理</a></li>
      <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>时光静好，与君语；细水流年，与君同。—— Amaze</p>
      </div>
    </div>

  </div>
  <!-- sidebar end -->