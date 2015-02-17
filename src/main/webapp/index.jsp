<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>自由的 HTML5 Bootstrap 后台模板</title>
    <script>
        if(top != self){
            top.location.href = location.href;
        }
    </script>
    <jsp:include page="import.jsp" flush="true"/>
</head>

<body>
<!-- topbar starts -->
<div class="navbar navbar-default topMenu" role="navigation">

    <div class="navbar-inner">
        <button type="button" class="navbar-toggle pull-left animated flip">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand arial font-hei" href="<c:url value='/'/>"> <img alt="Charisma Logo" src="<c:url value='/img/logo20.png'/>" class="hidden-xs"/>
            <span>XXXXXXX后台管理系统</span></a>

        <!-- user dropdown starts -->
        <div class="btn-group pull-right">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-user"></i>
                <span class="hidden-sm hidden-xs">
                    <c:out value="${SESSION_KEY_UINFO.name}"/>
                </span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">配置</a></li>
                <li class="divider"></li>
                <li><a href="<c:url value='/login/logout.do'/>">注销</a></li>
            </ul>
        </div>
        <!-- user dropdown ends -->

        <!-- theme selector starts -->
        <div class="btn-group pull-right theme-container animated tada">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-tint"></i><span
                    class="hidden-sm hidden-xs"> 切换主题 / 皮肤</span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" id="themes">
                <li><a data-value="classic" href="#"><i class="whitespace"></i> 经典</a></li>
                <li><a data-value="cerulean" href="#"><i class="whitespace"></i> 天蓝</a></li>
                <li><a data-value="cyborg" href="#"><i class="whitespace"></i> 电子</a></li>
                <li><a data-value="simplex" href="#"><i class="whitespace"></i> 单纯</a></li>
                <li><a data-value="darkly" href="#"><i class="whitespace"></i> 黑夜</a></li>
                <li><a data-value="lumen" href="#"><i class="whitespace"></i> 流明</a></li>
                <li><a data-value="slate" href="#"><i class="whitespace"></i> 板岩</a></li>
                <li><a data-value="spacelab" href="#"><i class="whitespace"></i> 太空</a></li>
                <li><a data-value="united" href="#"><i class="whitespace"></i> 曼联</a></li>
            </ul>
        </div>
        <!-- theme selector ends -->
        <%--
        <ul class="collapse navbar-collapse nav navbar-nav top-menu">
            <li><a href="#"><i class="glyphicon glyphicon-globe"></i> 访问网站</a></li>
            <li class="dropdown">
                <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i> 下拉菜单 <span
                        class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">动作</a></li>
                    <li><a href="#">另一个动作</a></li>
                    <li><a href="#">一些别的</a></li>
                    <li class="divider"></li>
                    <li><a href="#">特殊链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">更多的特殊链接</a></li>
                </ul>
            </li>
            <li>
                <form class="navbar-search pull-left">
                    <input placeholder="搜索" class="search-query form-control col-md-10" name="query"
                           type="text">
                </form>
            </li>
        </ul>
--%>
    </div>
</div>
<!-- topbar ends -->
<div class="ch-container">
    <div class="row">

        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2 leftMenu">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">主菜单</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">警告!</h4>

                <p>这个网站必须使用 <a href="http://baike.baidu.com/view/16168.htm?fr=aladdin" target="_blank">JavaScript</a>
                </p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
            <div class="tabbable" style="display:none;"> <!-- Only required for left/right tabs -->
                <ul class="nav nav-tabs">

                </ul>
                <div class="tabFullScreen" <%--title="全屏" data-toggle="tooltip" data-placement="bottom"--%>><i class="fa fa-expand"></i></div>
                <div class="tab-content">

                </div>
            </div>
        </div>
        <div id="contextMenu" class="dropdown clearfix" target="">
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="1" href="#">关闭标签页</a></li>
                <li><a tabindex="2" href="#">关闭所有标签页</a></li>
                <li><a tabindex="3" href="#">关闭其他标签页</a></li>
            </ul>
        </div>
        <!--/#content.col-md-0-->
    </div>
    <!--/fluid-row-->


    <hr>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>设置</h3>
                </div>
                <div class="modal-body">
                    <p>在这里可以配置设置..</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">保存修改</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="row">
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://www.sargeraswang.com" target="_blank">SargerasWang</a> 2014-2015</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">由: <a
                href="http://www.sargeraswang.com">SargerasWang</a></p>
    </footer>

</div>
<!--/.fluid-container-->
<jsp:include page="externalJS.jsp" flush="true"/>
<script>
    //tab_id 流水号
    var _tab_index=0;
    //tab 右键菜单
    var $contextMenu = $("#contextMenu");

    $(document).ready(function() {
        //右键菜单
        bindTabRightClick();
        //读取菜单
        ajaxLoadMenu();
    });

    //全屏
    $("div.tabFullScreen").click(function(){
        $("i",this).toggleClass("fa-expand fa-compress")
        if(!$("body div.topMenu").is(':visible')){
            $(".ch-container div#content").toggleClass("col-lg-10 col-sm-10 col-lg-12 col-sm-12");
        }
        var toggleFlag = 0;
        $("body div.topMenu,.ch-container div.leftMenu").toggle(400,function(){
            toggleFlag ++;
            if(toggleFlag == 2 && !$("body div.topMenu").is(':visible')){
                $(".ch-container div#content").toggleClass("col-lg-10 col-sm-10 col-lg-12 col-sm-12");
            }
        });
            //$(".ch-container div#content").toggleClass("col-lg-10 col-sm-10 col-lg-12 col-sm-12");
    });

    //右侧tab页的右键菜单
    function bindTabRightClick() {
        $contextMenu.on("click", "a", function (source) {
            var tabId = $(source.target).parents("div").attr("target");
            var i = $(source.target).attr("tabindex");
            var ul = $(".nav-tabs", ".tabbable");
            var div_p = $(".tab-content", ".tabbable");
            switch (i) {
                case "1":
                    closeTab(tabId);
                    break;
                case "2":
                    $(ul).empty();
                    $(div_p).empty();
                    $(".tabbable").hide();
                    break;
                case "3":
                    $(div_p).children().each(function () {
                        if (this.id != tabId) {
                            closeTab(this.id);
                        }
                    });
                    break;
            }
            $contextMenu.hide();
        });
        $("body").bind("click", function () {
            $contextMenu.hide();
        });
    }
    //ajax读取菜单
    function ajaxLoadMenu() {
        $.ajax({
            url: "<c:url value='/login/getMenu.do'/>",
            type: "POST",
            dataType: "json",
            success: function (data) {
                $(data).each(function () {
                    var li = $.parseHTML("<li></li>");
                    var icon = this.icon ? this.icon : "";
                    if (this.childrens.length > 0) {
                        $(li).addClass("accordion");
                        $(li).append('<a href="#"><i class="' + icon + '"></i><span> ' + this.name + '</span></a>')
                        var subUl = $.parseHTML('<ul class="nav nav-pills nav-stacked"></ul>');
                        $(this.childrens).each(function () {
                            var subIcon = this.icon ? this.icon : "";
                            $(subUl).append('<li><a href="#" url="' + this.url + '"><i class="' + subIcon + '"></i> ' + this.name + '</a></li>');
                        })
                        $(li).append(subUl);
                    } else {
                        var a = $.parseHTML('<a class="ajax-link" href="#" url="' + this.url + '"><i class="' + icon + '"></i><span> ' + this.name + '</span></a>');
                        $(li).append(a);
                    }
                    $("ul.main-menu").append(li);
                });
                //二级菜单展开
                $('.accordion > a').click(function (e) {
                    e.preventDefault();
                    var $ul = $(this).siblings('ul');
                    var $li = $(this).parent();
                    if ($ul.is(':visible')) $li.removeClass('active');
                    else                    $li.addClass('active');
                    $ul.slideToggle();
                });

                $('.accordion li.active:first').parents('ul').slideDown();
                //绑定menu事件
                $("a", "ul.nav-pills li").bind("click", function () {
                    $("li", "ul.nav-pills").removeClass("active");
                    $(this).parent().addClass("active");
                    if ($(this).parent().children("ul").length == 0) {//有子菜单的父菜单无动作
                        $(this).openTab();
                    }
                });
            }
        });
    }

    //改变iframe高度
    function resetIframeHeight(iframe,height){
        if(iframe){
            var win = iframe.contentWindow || iframe.contentDocument.parentWindow;
            if(win.document.body){
                iframe.height = win.document.documentElement.scrollHeight || win.document.body.scrollHeight;
                if(height > iframe.height){
                    iframe.height = height;
                }
                if($(".ch-container","body").height() > iframe.height){
                    iframe.height = $(".ch-container","body").height();
                }
            }
        }
    }

    //打开tab
    function openTab(url,text){
        url =getContextPath()+url;
        $(".tabbable").show();
        var ul = $(".nav-tabs",".tabbable");
        var div_p = $(".tab-content",".tabbable");
        //已存在的直接切换过去
        var old = $(div_p).find("iframe[src='"+url+"']");
        if(old.length > 0 ){
            var old_id = $(old).first().parent().attr("id");
            $("#a_"+old_id).click();
            old[0].contentDocument.location.reload(true);
            return false;
        }
        var index = ++_tab_index ;
        var id= "tab_"+index;
        var li = $.parseHTML('<li><a id="a_'+id+'" href="#'+id+'" data-toggle="tab">'+text+'</a><span class="tab-close">X</span></li>');
        var div = $.parseHTML('<div class="tab-pane" id="'+id+'">'
            +'<iframe scrolling="no" src="'+url+'" class="mainFrame" onload="resetIframeHeight(this)"></iframe>'
            +'</div>');
        //绑定右键事件
        $(li).children("a").first().bind("contextmenu",function(e){
            $contextMenu.css({
                display: "block",
                left: e.pageX - 5,
                top: e.pageY - 5
            });
            $contextMenu.attr("target",e.target.id.substr(2));
            return false;
        });
        //绑定关闭tab事件
        $(li).children("span").first().bind("click",function(){
            var id = $(this).prev().attr("href").substr(1);
            closeTab(id);
        });
        $(ul).append(li);
        $(div_p).append(div);
        $(li).children().first().click();
    }
    //点击menu
    $.fn.openTab=function(){
        var url = $(this).attr("url");
        var text ;
        if($(this).find("span").length != 0){
            //一级菜单
            text = $(this).find("span").text();
        }else{
            //二级菜单
            text = $(this).parent().parent().prev().last().text() + "-" + $(this).text();
        }
        openTab(url,text);
    };
    //关闭tab标签页
    function closeTab(id){
        $("#a_"+id).parent().remove();
        $("#"+id).remove();
        var ul = $(".nav-tabs",".tabbable");
        if($(ul).children().size() != 0){
            $(ul).children().first().children().first().click();
        }else{
            $(".tabbable").hide();
        }
    }
</script>
</body>
</html>
