<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="import.jsp" flush="true"/>
</head>

<body>
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12 col-sm-12">
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

<jsp:include page="externalJS.jsp" flush="true"/>
</body>
</html>
