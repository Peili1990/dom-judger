
/**
 * “保存功能”插件的行为
 */

//注册一个名为“save”的插件
UM.plugins['spoiler'] = function () {
	
	var spoiler = '<div style="margin:20px; margin-top:5px">'+
				  '<div class="smallfont" style="margin-bottom:2px">'+
                  '<strong>劇透			</strong>'+
				  '- &nbsp;<em>	在这里输入标题			</em>:			<input type="button" value="顯示" style="width:60px;font-size:10px;margin:0px;padding:0px;" onclick="if (this.parentNode.parentNode.getElementsByTagName(&#39;div&#39;)[1].getElementsByTagName(&#39;div&#39;)[0].style.display != &#39;&#39;) { this.parentNode.parentNode.getElementsByTagName(&#39;div&#39;)[1].getElementsByTagName(&#39;div&#39;)[0].style.display = &#39;&#39;; &nbsp; &nbsp; &nbsp; &nbsp;this.innerText = &#39;&#39;; this.value = &#39;隱藏&#39;; } else { this.parentNode.parentNode.getElementsByTagName(&#39;div&#39;)[1].getElementsByTagName(&#39;div&#39;)[0].style.display = &#39;none&#39;; this.innerText = &#39;&#39;; this.value = &#39;顯示&#39;; }"/>'+
				  '</div>'+
				  '<div class="alt2" style="margin: 0px; padding: 6px; border: 1px inset;">'+
                  '<div style="display: none;">'+
                  '在这里输入内容</div></div></div>'

    UM.commands[ 'spoiler' ] = {

        execCommand: function (cmdName) {

            //在这里实现具体的命令的行为
            //当调用 editor.execCommand("save") 时， 该方法就会被调用
            //保存功能的实际代码由用户自己实现
			this.focus();
			this.execCommand('inserthtml',spoiler);

        },
        queryCommandState: function (cmdName) {

            //这里返回只能是 1, 0, -1
            //1代表当前命令已经执行过了
            //0代表当前命令未执行
            //-1代表当前命令不可用

            //在这里总是返回0， 这样做可以使保存按钮一直可点击
            return 0;
        },
        //声明该插件不支持“撤销／保存”功能， 这样就不会触发ctrl+z 和ctrl+y的记忆功能
        notNeedUndo: 1

    };

};
