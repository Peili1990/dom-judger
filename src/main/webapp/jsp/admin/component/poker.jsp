<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="am-form am-form-horizontal" id="poker">
	<div class="am-form-group">
		<textarea style="height: 200px" disabled="disabled" id="poker-list"></textarea>
		<span id="poker-condition">&nbsp</span>
	</div>
	<div class="am-form-group">
		<label style="display: inline-block">梭哈使用者</label> 
		<input type="text" name="poker-user" placeholder=""
			style="width: 60px; display: inline-block"> 
		<label style="display: inline-block">打牌对象</label> 
		<input type="text" name="poker-object" placeholder=""
			style="width: 60px; display: inline-block">
		<button type="button" class="am-btn am-btn-primary float" onclick="pokerStart()" id="poker-start-btn">开始</button>
	</div>
	<div class="am-form-group">
		<label style="display: inline-block">生成数字</label> 
		<input type="text" name="poker-num" placeholder=""
			style="width: 60px; display: inline-block" disabled="disabled">
		<label style="display: inline-block">性别指定</label>
		<div style="width: 60px; display: inline-block">
			<select data-am-selected id="poker-sex">
				<option value="male">男</option>
				<option value="female">女</option>
				<option value="rand">随机</option>
			</select>
		</div>
		<button type="button" class="am-btn am-btn-primary float" id="poker-step-one-btn" onclick="firstList()" disabled="disabled">生成名单</button>
	</div>
	<div class="am-form-group">
		<span>第一份名单</span>
		<textarea style="height: 56px" id="poker-list-one"></textarea>
	</div>
	<div class="am-form-group">
		<label style="display: inline-block">锁定角色</label> 
		<input type="checkbox" name="poker-lock" value="1"/>1
		<input type="checkbox" name="poker-lock" value="2"/>2
		<input type="checkbox" name="poker-lock" value="3"/>3
		<input type="checkbox" name="poker-lock" value="4"/>4
		<input type="checkbox" name="poker-lock" value="5"/>5
		<button type="button" class="am-btn am-btn-primary float" onclick="" disabled="disabled" id="poker-step-two-btn">制衡</button>
	</div>
	<div class="am-form-group">
		<span>第二份名单</span>
		<textarea style="height: 56px" id="poker-list-two"></textarea>
	</div>
	<div class="am-form-group">	
		<input type="checkbox" class="">联机结算
		<span style="color:red" id="poker-result"></span>
		<button type="button" class="am-btn am-btn-danger float" onclick="resetPoker()">重置</button>
	</div>
</form>

<div class="am-modal am-modal-alert" tabindex="-1" id="sex-query">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">维多利亚的噩梦</div>
		<div class="am-modal-bd">
		<ul>
		</ul>
		</div>
		<div class="am-modal-footer" data-am-modal-confirm>
			<span class="am-modal-btn">确定</span>
		</div>
	</div>
</div>

<script>
var temp = [];

	$(function() {
		$.each(players, function(index, player) {
			$("#poker-list").append(
					parseInt(index) + 1 + "  " + player.characterName
							+ replaceTag("<br>"));
		})
	})

	function pokerStart() {
		var unknowSexChar = [];
		$.each(players, function(index) {
			if (players[index].sex == 2) {
				unknowSexChar.push(index);
			}
		})
		if(unknowSexChar.length>0){
			querySex(unknowSexChar);
		} else {
			stepOne();
		}
		$("#poker-start-btn").attr("disabled","disabled");
	}
	
	function stepOne(){
		pokerUser = $("#poker input[name='poker-user']").val();
		pokerobject = $("#poker input[name='poker-object']").val();
		if (!pokerUser.isNumeric() || !pokerobject.isNumeric() || pokerUser=="" || pokerobject=="") {
			myAlert("请输入梭哈使用者及打牌对象编号！");
			$("#poker-start-btn").removeAttr("disabled");
			return;
		}
		male = 0;
		female = 0;
		temp = [];
		$.each(players,function(index){
			if(index == pokerUser -1 || index == pokerobject - 1){
				return true;
			}
			temp.push(players[index]);
			switch(parseInt(players[index].sex)){
			case 0:
				male++;
				break;
			case 1:
				female++;
				break;
			case 3:
				male++;
				female++;
			}
		})
		$("#poker-condition").text("当前名单为"+male+"男"+female+"女");
		$("#poker input[name='poker-num']").val(parseInt(Math.random()*6));
		$("#poker-step-one-btn").removeAttr("disabled");
	}
	
	function querySex(unknowSexChar){
		$("#sex-query ul").empty();
		$.each(unknowSexChar,function(index,i){
			var builder = new StringBuilder();
			builder.appendFormat('<li>请选择{0}性别     ',players[i].characterName);
			builder.append('<select>'+
					'<option value="0">男</option>'+
					'<option value="1">女</option>'+
					'<option value="3">亦男亦女</option>'+
					'</select>');
			$("#sex-query ul").append(builder.toString());
		})
		$.each($("#sex-query select"),function(index,select){
			$(select).selected({
			    btnWidth: '200px'
			  });
		})
		$("#sex-query").modal({
			onConfirm : function(){
				$.each($("#sex-query select"),function(index,select){
					players[unknowSexChar[index]].sex=$(select).val();
				})
				stepOne();
			}
		});
	}
	
	function firstList(){
		var sex = $("#poker-sex").val();
		if(sex =="rand"){
			sex = Math.random()>.5 ? "male" : "female";
			if(sex == "male"){
				$("#poker-sex").find('option').eq(0).attr('selected', true);
			} else {
				$("#poker-sex").find('option').eq(1).attr('selected', true);
			}
		}
		$("#poker-sex").selected('disable');
		temp.shuffle();
		handCard = [];
		for(var i=0;i<5;i++){
			if(temp[i].characterName == "叶什（兄）" && temp[i].isSp == 0){
				continue;
			}
			handCard.push(temp[i]);
		}
		count(handCard,1);
		$("#poker-step-one-btn").attr("disabled","disabled");
		$("#poker-step-two-btn").removeAttr("disabled").click(function(){
			stepTwo(handCard);
		});
	}
	
	function stepTwo(handCard){
		newHandCard = [];
		var checkboxes = document.getElementsByName("poker-lock");
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
            	newHandCard.push(handCard[i]);
            }
        }
		end = 10-newHandCard.length;
		for(var i=5;i<end;i++){
			if(temp[i].characterName == "叶什（兄）" && temp[i].isSp == 0){
				continue;
			}
			newHandCard.push(temp[i]);
		}
		count(newHandCard,2);
		$("#poker-step-two-btn").attr("disabled","disabled");
	}
	
	function count(handCard,step){
		male = 0;
		female = 0;
		list = "";
		$.each(handCard,function(index){
			switch(parseInt(handCard[index].sex)){
			case 0:
				male++;
				break;
			case 1:
				female++;
				break;
			case 3:
				male++;
				female++;
			}
			list += parseInt(index)+1 +" "+ handCard[index].characterName+" ";
		})
		if(step == 1){
			$("#poker-list-one").append(list).append(replaceTag("<br>")).append("当前名单"+male+"男"+female+"女");
		} else {
			$("#poker-list-two").append(list).append(replaceTag("<br>")).append("当前名单"+male+"男"+female+"女");
			winsex = $("#poker-sex").val();
			winnum = $("#poker input[name='poker-num']").val();
			if(winsex == "male" && parseInt(winnum) == male || winsex == "female" && parseInt(winnum) == female ){
				$("#poker-result").text("打牌成功！");
			} else {
				$("#poker-result").text("打牌失败");
			}
		}
	}
	
	function resetPoker(){
		$("#poker-condition").html("&nbsp");
		$("#poker input[name='poker-user']").val("");
		$("#poker input[name='poker-object']").val("");
		$("#poker-start-btn").removeAttr("disabled");
		$("#poker input[name='poker-num']").val("");
		$("#poker-sex").selected('enable');
		$("#poker-step-one-btn").removeAttr("disabled");
		$("#poker-list-one").val("");
		$("#poker-step-two-btn").removeAttr("disabled");
		$("#poker-list-two").val("");
		$("#poker-result").text("");
	}
</script>