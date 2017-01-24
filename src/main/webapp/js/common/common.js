/**
 * common.js
 * 
 * @author z```s
 */
var Common = function() {
	// 异步调用AJAX方法
	// data参数：为异步传输的参数，需定义为JSON格式
	// url参数：为异步访问路径
	// callback参数：为AJAX执行成功的回调函数需为function(){};
	this.callAction = function(data, url, callback, contentType) {
		$.ajax({
			type : "POST",
			url : url,
			data : data,
			contentType : contentType,
			dataType : "json",
			success : function(data) {
				if(!data){
					return;
				}
				switch(data.status){
				case 1:callback(data);
					return;
				case 0:
					timeoutHandle();
					return;
				default:
					myAlert(data.message);
					return;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				var resText = XMLHttpRequest.responseText;
				if (resText != null && resText != "") {
					var error = eval("(" + resText + ")");
					if (error.sessionState == 0) {
						window.open(error.contextPath + '/login.html?errorType=Login_Timeout', '_top');
					}
				} else {
					//alert("系统出错，请重试");
				}
			}
		});
	};

	this.timeVerify = function(startTime, endTime) {
		startTime = this.stringToDate(startTime);
		endTime = this.stringToDate(endTime);
		if (startTime == null || endTime == null) {
			return;
		}
		if (startTime > endTime) {
			return false;
		}
		return true;
	};

	this.stringToDate = function(time) {
		if (time.length > 0) {
			time = time.toString().replace(/-/g, "/");
			time = new Date(Date.parse(time));
			return time;
		}
		return null;
	};

};

var Chat = function(){
	this.clicked = "Nope.";
	this.winx = "0";
	this.winy = "0";
	this.difx = 0;
	this.dify = 0;
	this.pageNum = 0;
	
	this.newWindow = function(chatInfo){
		var builder = new StringBuilder();
		builder.appendFormat('<div class="window noselect" style="top:{0}" id="{1}">',$(document).scrollTop()+100+"px", chatInfo.chatId);
		builder.append('<div class="pew">');
		builder.append('<span class="cross am-icon-close"></span>');
		builder.appendFormat('<img src="{0}" class="am-comment-avatar">',chatInfo.picServer+chatInfo.toUserAvatar);
		builder.appendFormat('<span>{0}</span>',chatInfo.toUserNickname);
		builder.appendFormat('<p>{0}</p>',chatInfo.toUserMotto);
		builder.append('</div>');
		builder.append('<div class="container"><ul>');
		builder.append('</ul></div><div class="base"><textarea></textarea></div>');
		$("#chat-pool").append(builder.toString());
	}
	
} 

/** * 日期格式化 ** */
Date.prototype.format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, // 小时
		"H+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	var week = {
		"0" : "\u65e5",
		"1" : "\u4e00",
		"2" : "\u4e8c",
		"3" : "\u4e09",
		"4" : "\u56db",
		"5" : "\u4e94",
		"6" : "\u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f"
								: "\u5468") : "") + week[this.getDay() + ""]);
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;

};

/** * 返回字节数 ** */
String.prototype.lenB = function() {
	return this.replace(/[^\x00-\xff]/g, "**").length;
};

/** * 删除首尾空格 ** */
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

/** * 检验是否为邮箱地址 ** */
String.prototype.isEmail = function() {
	return /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
			.test(this);
};

/** * 检验字符串是否存在中文 ** */
String.prototype.existChinese = function() {
	return (this.length != this.replace(/[^\x00-\xff]/g, "**").length);
};

/** * 检查是否为数 ** */
String.prototype.isNumber = function() {
	var s = this.trim();
	return (s.search(/^[+-]?[0-9.]*$/) >= 0);
};

String.prototype.isNumeric = function() {
	var s = this.trim();
	return /^[0-9]*$/.test(s);
};

String.prototype.isUrl = function() {
	var str_url = this.trim();
	var strRegex = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
	var reg = new RegExp(strRegex);
	return reg.test(str_url);
};

String.prototype.isFloat = function() {
	return /^(-?\d+)(\.\d+)?$/.test(this);
};

String.prototype.isNumOrChar = function() {
	return /^[A-Za-z0-9]*$/.test(this);
};

String.prototype.toDate = function() {
	if (this.length == 0) {
		return null;
	}
	var time = this.replace(/-/g, "/");
	time = new Date(Date.parse(time));
	return time;
};

String.prototype.startsWith = function(str) {
	var reg = new RegExp("^" + str);
	return reg.test(this);
};

String.prototype.endsWith = function(str) {
	var reg = new RegExp(str + "$");
	return reg.test(this);
};

Array.prototype.indexOf = function(val) {  
    for (var i = 0; i < this.length; i++) {   	
        if (JSON.stringify(this[i]) == JSON.stringify(val)) return i;  
    }  
    return -1;  
};  

Array.prototype.remove = function(val) {  
    var index = this.indexOf(val);  
    while(index>-1){  
        this.splice(index, 1);  
        index = this.indexOf(val);  
    }  
};  

Array.prototype.removeOne = function(val) {  
    var index = this.indexOf(val);  
    if(index>-1){
    	this.splice(index, 1);     
    }
}; 

Array.prototype.shuffle = function(){
	    var _floor = Math.floor, _random = Math.random, 
	        len = this.length, i, j, arri, 
	        n = _floor(len/2)+1; 
	    while( n-- ){ 
	        i = _floor(_random()*len); 
	        j = _floor(_random()*len); 
	        if( i!==j ){ 
	            arri = this[i]; 
	            this[i] = this[j]; 
	            this[j] = arri; 
	        } 
	    } 
	    //增加切牌操作 
	    i = _floor(_random()*len); 
	    this.push.apply(this, this.splice(0,i)); 
}

function StringBuilder() {
	this._buffers = [];
	this._length = 0;
	this._splitChar = arguments.length > 0 ? arguments[arguments.length - 1]
			: "";
	if (arguments.length > 0) {
		for (var i = 0, len = arguments.length - 1; i < len; i++) {
			this.append(arguments[i]);
		}
	}
}

StringBuilder.prototype.append = function(str) {
	this._length += str.length;
	this._buffers.push(str);
	return this;
};

StringBuilder.prototype.add = StringBuilder.prototype.append;

StringBuilder.prototype.appendFormat = function() {
	if (arguments.length > 1) {
		var tString = arguments[0];
		if (arguments[1] instanceof Array) {
			for (var i = 0, len = arguments[1].length; i < len; i++) {
				var jIndex = i;
				var re = eval("/\\{" + jIndex + "\\}/g;");
				tString = tString.replace(re, arguments[1][i]);
			}
		} else {
			for (var i = 0, len = arguments.length; i < len; i++) {
				var jIndex = i - 1;
				var re = eval("/\\{" + jIndex + "\\}/g;");
				tString = tString.replace(re, arguments[i]);
			}
		}
		this.append(tString);
	} else if (arguments.length == 1) {
		this.append(arguments[0]);
	}
	return this;
};

StringBuilder.prototype.length = function() {
	if (this._splitChar.length > 0 && (!this.isEmpty())) {
		return this._length
				+ (this._splitChar.length * (this._buffers.length - 1));
	} else {
		return this._length;
	}
};

StringBuilder.prototype.isEmpty = function() {
	return this._buffers.length <= 0;
};

StringBuilder.prototype.clear = function() {
	this._buffers = [];
	this._length = 0;
};

StringBuilder.prototype.toString = function() {
	if (arguments.length == 1) {
		return this._buffers.join(arguments[0]);
	} else {
		return this._buffers.join(this._splitChar);
	}
};

function getRootPath() {
	var version = "debug";
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = "";
	if (version == "debug" || version == "demo") {
		projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	}
	return (localhostPaht + projectName);
}

function center(parent,child){
	var a=parent.offsetHeight;
	var b=child.offsetHeight;
	child.style.top=(a-b)/2+"px";
}

function getClass(tagName,className){
    if(document.getElementsByClassName){
        return document.getElementsByClassName(className);
    }else{
        var tags=document.getElementsByTagName(tagName);
        var tagArr=[];
        for(var i=0;i<tags.length;i++){
            if(tags[i].className==className){
                tagArr.push(tags[i]);
            }
        }
        return tagArr;
    }
}

/*
* 频率控制 返回函数连续调用时，fn 执行频率限定为每多少时间执行一次
* @param fn {function}  需要调用的函数
* @param delay  {number}    延迟时间，单位毫秒
* @param immediate  {bool} 给 immediate参数传递false 绑定的函数先执行，而不是delay后后执行。
* @return {function}实际调用函数
*/
var throttle = function (fn,delay, immediate, debounce) {
   var curr = +new Date(),//当前事件
       last_call = 0,
       last_exec = 0,
       timer = null,
       diff, //时间差
       context,//上下文
       args,
       exec = function () {
           last_exec = curr;
           fn.apply(context, args);
       };
   return function () {
       curr= +new Date();
       context = this,
       args = arguments,
       diff = curr - (debounce ? last_call : last_exec) - delay;
       clearTimeout(timer);
       if (debounce) {
           if (immediate) {
               timer = setTimeout(exec, delay);
           } else if (diff >= 0) {
               exec();
           }
       } else {
           if (diff >= 0) {
               exec();
           } else if (immediate) {
               timer = setTimeout(exec, -diff);
           }
       }
       last_call = curr;
   }
};
 
/*
* 空闲控制 返回函数连续调用时，空闲时间必须大于或等于 delay，fn 才会执行
* @param fn {function}  要调用的函数
* @param delay   {number}    空闲时间
* @param immediate  {bool} 给 immediate参数传递false 绑定的函数先执行，而不是delay后后执行。
* @return {function}实际调用函数
*/
 
var debounce = function (fn, delay, immediate) {
   return throttle(fn, delay, immediate, true);
};

function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

function myAlert(text){
	$("#my-modal-loading .am-modal-hd").html(text);
	$('#my-modal-loading').modal('open');
	setTimeout(function(){
		$('#my-modal-loading').modal('close');
	},1000);
}

function myInfo(text,callback){
	$("#my-alert .am-modal-bd").html(text);
	$('#my-alert').modal('open');
	$('#my-alert .am-modal-btn').on('click',callback);	
}

function myConfirm(text,callback){
	$("#my-confirm .am-modal-bd").html(text);
	$('#my-confirm').modal({
	      relatedTarget: this,
	      onConfirm: function(e){
	    	  eval(callback);
	      },
	      onCancel: function(e) {
	      }
	});
}

function myPrompt(text,callback){
	$("#my-prompt .am-modal-bd").html(text).append("<input type='text' class='am-modal-prompt-input' name='header'>")
	$('#my-prompt').modal({
	      relatedTarget: this,
	      onConfirm: function(e){
	    	  eval(callback);
	    	  return $("input[name='header']").val();
	      },
	      onCancel: function(e) {
	      }
	});
}

function myLoading(){
	$("#my-loading").modal('open');
}

function myLoadingClose(){
	$("#my-loading").modal('close');
}

function timeoutHandle(){
	myInfo("登录超时",function(){
		window.location = getRootPath() + "/index";
	});
}

function randomsort(a, b) {
	return Math.random()>.5 ? -1 : 1;//用Math.random()函数生成0~1之间的随机数与0.5比较，返回-1或1
}

function replaceTag(input){
	if(typeof(input) == "undefined")
		return "";
	var reg=new RegExp("<br>","g");
	return input.replace(reg,"\r\n")
}

function recoverTag(input){
	if(typeof(input) == "undefined")
		return "";
	return input.replace(/\n|\r\n/g,"<br>");
}

function dealRuleText(input){
	if(typeof(input) == "undefined")
		return "";
	return input.replace(new RegExp('class="spoiler-button am-btn am-btn-default"',"g"),'class="spoiler-button am-btn am-btn-default" onclick="showSpoiler(this)"').replace(new RegExp('<p>',"g"),'').replace(new RegExp('</p>',"g"),'');
}

function getCurrentDb(userId) {
    //打开数据库，或者直接连接数据库参数：数据库名称，版本，概述，大小
    //如果数据库不存在那么创建之
    var db = openDatabase("nv_db", "1.0", "historical chat record", 1024 * 1024); 
    if(!db) {
    	myAlert("您的浏览器不支持HTML5本地数据库,聊天记录可能无法保存");
    	return;
    }
    db.transaction(function (trans) {
    	trans.executeSql("create table if not exists chat_record_"+userId+"(chatId,userId,content,createTime)", [], function (trans, result) {	
    	},function(trans, result){},function(trans, message){myAlert(message)});
    },function(trans, result){},function(){})//启动一个事务，并设置回调函数
       
 
    return db;
}

function setCache(name, value){
	var storage = window.localStorage; 
	if (storage) { 
        storage.setItem(name, value);   
    } else { 
    	setCookie(name, value, "3d");
    } 
}

function getCache(name){
	var storage = window.localStorage; 
	if (storage) { 
        return storage.getItem(name);   
    } else { 
    	return getCookie(name);
    } 
}

function delCache(name){
	var storage = window.localStorage; 
	if (storage) { 
        return storage.removeItem(name);   
    } else { 
    	return delCookie(name);
    } 
}

function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}

function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function setCookie(name, value, time) {
	var strsec = getsec(time);
	var exp = new Date();
	exp.setTime(exp.getTime() + strsec * 1);
	document.cookie = name + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}

function getsec(str) {
	var str1 = str.substring(0, str.length-1) * 1;
	var str2 = str.substring(str.length-1, str.length);
	if (str2 == "s") {
		return str1 * 1000;
	} else if (str2 == "h") {
		return str1 * 60 * 60 * 1000;
	} else if (str2 == "d") {
		return str1 * 24 * 60 * 60 * 1000;
	}
}

function changeRadioValue(radio_oj,aValue){//传入一个对象
	for (var i = 0; i < radio_oj.length; i++) {//循环
		if (radio_oj[i].value == aValue) { //比较值
			radio_oj[i].checked = true; //修改选中状态
		} else {
			radio_oj[i].checked = false; //取消选中状态
		}
	}
}

function indexOfKey(array,val){
	if(!array){
		return -1;
	}
	for (var i = 0; i< array.length; i++) {
		if(array[i].chatId == val) return i;
	}
	return -1;
}

function showSpoiler(obj){
	if ($(obj).parent().next().children().hasClass('invisible')) { 
		$(obj).parent().next().children().removeClass('invisible')
		obj.innerHTML = '隐藏'; 
	} else {
		$(obj).parent().next().children().addClass('invisible')
		obj.innerHTML = '显示'; 
	}
}


