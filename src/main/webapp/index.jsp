<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>自由的 HTML5 Bootstrap 后台模板</title>
    <jsp:include page="import.jsp" flush="true"/>
</head>

<body>
<!-- topbar starts -->
<div class="navbar navbar-default" role="navigation">

    <div class="navbar-inner">
        <button type="button" class="navbar-toggle pull-left animated flip">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand arial" href="index.jsp"> <img alt="Charisma Logo" src="/img/logo20.png" class="hidden-xs"/>
            <span>XX后台管理</span></a>

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

    </div>
</div>
<!-- topbar ends -->
<div class="ch-container">
    <div class="row">

        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">主菜单</li>
                        <li><a class="ajax-link" href="#" url="/dashboard.jsp"><i
                                class="glyphicon glyphicon-home"></i><span> 仪表盘</span></a>
                        </li>
                        <li><a class="ajax-link" href="#" url="/ui.jsp"><i
                                class="glyphicon glyphicon-eye-open"></i><span> UI 特性</span></a>
                        </li>
                        <li><a class="ajax-link" href="form.html"><i
                                class="glyphicon glyphicon-edit"></i><span> Forms</span></a></li>
                        <li><a class="ajax-link" href="chart.html"><i
                                class="glyphicon glyphicon-list-alt"></i><span> 图表</span></a>
                        </li>
                        <li><a class="ajax-link" href="typography.html"><i class="glyphicon glyphicon-font"></i><span> 排版</span></a>
                        </li>
                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-picture"></i><span> 照片墙</span></a>
                        </li>
                        <li class="nav-header hidden-md">Sample Section</li>
                        <li><a class="ajax-link" href="#" url="/table.jsp"><i
                                class="glyphicon glyphicon-align-justify"></i><span> 表格</span></a></li>
                        <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 手风琴菜单</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#">子菜单1</a></li>
                                <li><a href="#">子菜单2</a></li>
                            </ul>
                        </li>
                        <li><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span> 日历</span></a>
                        </li>
                        <li><a class="ajax-link" href="grid.html"><i
                                class="glyphicon glyphicon-th"></i><span> 网格</span></a></li>
                        <li><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span> 指引</span></a></li>
                        <li><a class="ajax-link" href="icon.html"><i
                                class="glyphicon glyphicon-star"></i><span> Icons</span></a></li>
                        <li><a href="error.jsp"><i class="glyphicon glyphicon-ban-circle"></i><span> 错误页面</span></a>
                        </li>
                        <li><a href="login.jsp"><i class="glyphicon glyphicon-lock"></i><span> 登陆页面</span></a>
                        </li>
                    </ul>
                    <label id="for-is-ajax" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax 菜单</label>
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
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad
            Usman</a> 2012 - 2014</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">由: <a
                href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
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
        //绑定menu事件
        $("a","ul.nav-pills li").bind("click",function(){
            if($(this).parent().children("ul").length == 0 ){
                $(this).openTab();
            }
        });
    });
    //改变iframe高度
    function resetIframeHeight(iframe){
        if(iframe){
            var win = iframe.contentWindow || iframe.contentDocument.parentWindow;
            if(win.document.body){
                iframe.height = win.document.documentElement.scrollHeight || win.document.body.scrollHeight;
            }
        }
    }

    function openTab(url,text){
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
        var text = $(this).find("span").text();
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
