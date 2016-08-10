<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="window noselect">
        <div class="pew">
            Header
        </div>
        <div class="container">
            The Cords
        </div>
</div>

<script type="text/javascript">

var clicked = "Nope.";
var mausx = "0";
var mausy = "0";
var winx = "0";
var winy = "0";
var difx = mausx - winx;
var dify = mausy - winy;

$("html").mousemove(function (event) {
    mausx = event.pageX;
    mausy = event.pageY;
    winx = $(".window").offset().left;
    winy = $(".window").offset().top;
    if (clicked == "Nope.") {
        difx = mausx - winx;
        dify = mausy - winy;
    }

    var newx = event.pageX - difx - $(".window").css("marginLeft").replace('px', '');
    var newy = event.pageY - dify - $(".window").css("marginTop").replace('px', '');
    newx = newx < 0 ? 0 : newx;
    newx = newx > $(window).width()-$(".window").width() ? $(window).width()-$(".window").width() : newx;
    newy = newy < 0 ? 0 : newy;
    newy = newy > $(window).height()-$(".window").height() ? $(window).height()-$(".window").height() : newy;
    $(".window").css({ top: newy, left: newx });

    $(".container").html("Mouse Cords: " + parseFloat($(window).width()-$(".window").width()) + " , " + newx + "<br />" + "Window Cords:" + winx + " , " + winy + "<br />Draggin'?: " + clicked + "<br />Difference: " + difx + " , " + dify + "");
});

$(".pew").mousedown(function (event) {
    clicked = "Yeah.";
});

$("html").mouseup(function (event) {

    clicked = "Nope.";
});

</script>