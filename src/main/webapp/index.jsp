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
        <a class="navbar-brand" href="index.jsp"> <img alt="Charisma Logo" src="/img/logo20.png" class="hidden-xs"/>
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
                        <li><a class="ajax-link" href="index.jsp"><i
                                class="glyphicon glyphicon-home"></i><span> 仪表盘</span></a>
                        </li>
                        <li><a class="ajax-link" href="ui.html"><i
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
                        <li><a class="ajax-link" href="/table.jsp"><i
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
            <!-- content starts -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">主页</a>
                    </li>
                    <li>
                        <a href="#">仪表盘</a>
                    </li>
                </ul>
            </div>
            <div class=" row">
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a data-toggle="tooltip" title="6个新成员." class="well top-block" href="#">
                        <i class="glyphicon glyphicon-user blue"></i>

                        <div>所有成员</div>
                        <div>507</div>
                        <span class="notification">6</span>
                    </a>
                </div>

                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a data-toggle="tooltip" title="4个新专业成员." class="well top-block" href="#">
                        <i class="glyphicon glyphicon-star green"></i>

                        <div>专业成员</div>
                        <div>228</div>
                        <span class="notification green">4</span>
                    </a>
                </div>

                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a data-toggle="tooltip" title="34美元 新销售额." class="well top-block" href="#">
                        <i class="glyphicon glyphicon-shopping-cart yellow"></i>

                        <div>销售额</div>
                        <div>$13320</div>
                        <span class="notification yellow">$34</span>
                    </a>
                </div>

                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a data-toggle="tooltip" title="12个新消息." class="well top-block" href="#">
                        <i class="glyphicon glyphicon-envelope red"></i>

                        <div>消息</div>
                        <div>25</div>
                        <span class="notification red">12</span>
                    </a>
                </div>
            </div>

            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well">
                            <h2><i class="glyphicon glyphicon-info-sign"></i> 介绍</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-setting btn-round btn-default"><i
                                        class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content row">
                            <div class="col-lg-7 col-md-12">
                                <h1>Charisma <br>
                                    <small>自由的, 优质的, 敏捷的, 多主题后台模板.</small>
                                </h1>
                                <p>这是一个模板的演示页面.我为了简化项目中的重复工作创建了Charisma.
                                    现在,我以Charisma为基础创建我的后台模块工作,并且与你分享 :)</p>

                                <p><b>菜单中的所有页面都是可用的,都看一看,请与你的跟随者们共享.</b></p>

                                <p class="center-block download-buttons">
                                    <a href="http://usman.it/free-responsive-admin-template/"
                                       class="btn btn-primary btn-lg"><i
                                            class="glyphicon glyphicon-chevron-left glyphicon-white"></i> 返回文章</a>
                                    <a href="http://usman.it/free-responsive-admin-template/"
                                       class="btn btn-default btn-lg"><i
                                            class="glyphicon glyphicon-download-alt"></i> 下载页面</a>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="box col-md-4">
                    <div class="box-inner homepage-box">
                        <div class="box-header well">
                            <h2><i class="glyphicon glyphicon-th"></i> 标签</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-setting btn-round btn-default"><i
                                        class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active"><a href="#info">信息</a></li>
                                <li><a href="#custom">习惯</a></li>
                                <li><a href="#messages">消息</a></li>
                            </ul>

                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane active" id="info">
                                    <h3>Charisma
                                        <small>一个全面的模板</small>
                                    </h3>
                                    <p>一个全面的,敏捷的后台模板. 它对平板和手机进行了优化.</p>

                                    <p>查看它在其他设备的表现:</p>
                                    <a href="http://www.responsinator.com/?url=usman.it%2Fthemes%2Fcharisma"
                                       target="_blank"><strong>在iPhone大小预览.</strong></a>
                                    <br>
                                    <a href="http://www.responsinator.com/?url=usman.it%2Fthemes%2Fcharisma"
                                       target="_blank"><strong>在iPad大小预览.</strong></a>
                                </div>
                                <div class="tab-pane" id="custom">
                                    <h3>习惯
                                        <small>小字</small>
                                    </h3>
                                    <p>示例片段.</p>

                                    <p>你自己的文字.</p>
                                </div>
                                <div class="tab-pane" id="messages">
                                    <h3>消息
                                        <small>小字</small>
                                    </h3>
                                    <p>示例片段.</p>

                                    <p>你自己的文字.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/span-->

                <div class="box col-md-4">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-user"></i> 成员活动</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="box-content">
                                <ul class="dashboard-list">
                                    <li>
                                        <a href="#">
                                            <img class="dashboard-avatar" alt="Usman"
                                                 src="/img/hash.jpg"></a>
                                        <strong>姓名:</strong> <a href="#">Usman
                                    </a><br>
                                        <strong>加入时间:</strong> 17/05/2014<br>
                                        <strong>状态:</strong> <span class="label-success label label-default">批准</span>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="dashboard-avatar" alt="Sheikh Heera"
                                                 src="/img/hash.jpg"></a>
                                        <strong>姓名:</strong> <a href="#">Sheikh Heera
                                    </a><br>
                                        <strong>加入时间:</strong> 17/05/2014<br>
                                        <strong>状态:</strong> <span class="label-warning label label-default">等待</span>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="dashboard-avatar" alt="Abdullah"
                                                 src="/img/hash.jpg"></a>
                                        <strong>姓名:</strong> <a href="#">Abdullah
                                    </a><br>
                                        <strong>加入时间:</strong> 25/05/2014<br>
                                        <strong>状态:</strong> <span class="label-default label label-danger">禁止</span>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="dashboard-avatar" alt="Sana Amrin"
                                                 src="/img/hash.jpg"></a>
                                        <strong>姓名:</strong> <a href="#">Sana Amrin</a><br>
                                        <strong>加入时间:</strong> 17/05/2014<br>
                                        <strong>状态:</strong> <span class="label label-info">更新</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/span-->

                <!--/span-->
            </div>
            <!--/row-->

            <div class="row">
                <div class="box col-md-4">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-list"></i> 按钮</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-setting btn-round btn-default"><i
                                        class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content buttons">
                            <p class="btn-group">
                                <button class="btn btn-default">左</button>
                                <button class="btn btn-default">中</button>
                                <button class="btn btn-default">右</button>
                            </p>
                            <p>
                                <button class="btn btn-default btn-sm"><i class="glyphicon glyphicon-star"></i> 图标按钮
                                </button>
                                <button class="btn btn-primary btn-sm">小按钮</button>
                                <button class="btn btn-danger btn-sm">小按钮</button>
                            </p>
                            <p>
                                <button class="btn btn-warning btn-sm">小按钮</button>
                                <button class="btn btn-success btn-sm">小按钮</button>
                                <button class="btn btn-info btn-sm">小按钮</button>
                            </p>
                            <p>
                                <button class="btn btn-inverse btn-default btn-sm">小按钮</button>
                                <button class="btn btn-primary btn-round btn-lg">圆形按钮</button>
                                <button class="btn btn-round btn-default btn-lg"><i class="glyphicon glyphicon-ok"></i>
                                </button>
                                <button class="btn btn-primary"><i class="glyphicon glyphicon-edit glyphicon-white"></i>
                                </button>
                            </p>
                            <p>
                                <button class="btn btn-default btn-xs">迷你按钮</button>
                                <button class="btn btn-primary btn-xs">迷你按钮</button>
                                <button class="btn btn-danger btn-xs">迷你按钮</button>
                                <button class="btn btn-warning btn-xs">迷你按钮</button>
                            </p>
                            <p>
                                <button class="btn btn-info btn-xs">迷你按钮</button>
                                <button class="btn btn-success btn-xs">迷你按钮</button>
                                <button class="btn btn-inverse btn-default btn-xs">迷你按钮</button>
                            </p>
                        </div>
                    </div>
                </div>
                <!--/span-->

                <div class="box col-md-4">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-list"></i> 按钮</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-setting btn-round btn-default"><i
                                        class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content  buttons">
                            <p>
                                <button class="btn btn-default btn-lg">大按钮</button>
                                <button class="btn btn-primary btn-lg">大按钮</button>
                            </p>
                            <p>
                                <button class="btn btn-danger btn-lg">大按钮</button>
                                <button class="btn btn-warning btn-lg">大按钮</button>
                            </p>
                            <p>
                                <button class="btn btn-success btn-lg">大按钮</button>
                                <button class="btn btn-info btn-lg">大按钮</button>
                            </p>
                            <p>
                                <button class="btn btn-inverse btn-default btn-lg">大按钮</button>
                            </p>
                            <div class="btn-group">
                                <button class="btn btn-default btn-lg">大下拉菜单</button>
                                <button class="btn dropdown-toggle btn-default btn-lg" data-toggle="dropdown"><span
                                        class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="glyphicon glyphicon-star"></i> 动作</a></li>
                                    <li><a href="#"><i class="glyphicon glyphicon-tag"></i> 另一个动作</a></li>
                                    <li><a href="#"><i class="glyphicon glyphicon-download-alt"></i> 一些别的</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="glyphicon glyphicon-tint"></i> 特殊链接</a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
                <!--/span-->

                <div class="box col-md-4">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-list"></i> 每周统计</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-setting btn-round btn-default"><i
                                        class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <ul class="dashboard-list">
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-arrow-up"></i>
                                        <span class="green">92</span>
                                        新评论
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-arrow-down"></i>
                                        <span class="red">15</span>
                                        新注册
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-minus"></i>
                                        <span class="blue">36</span>
                                        新文章
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-comment"></i>
                                        <span class="yellow">45</span>
                                        新回复
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-arrow-up"></i>
                                        <span class="green">112</span>
                                        新评论
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-arrow-down"></i>
                                        <span class="red">31</span>
                                        新注册
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-minus"></i>
                                        <span class="blue">93</span>
                                        新文章
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-comment"></i>
                                        <span class="yellow">254</span>
                                        用户评论
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--/span-->
            </div>
            <!--/row-->
            <!-- content ends -->
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
</body>
</html>
