<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%String path = request.getContextPath();%>
    <SCRIPT LANGUAGE="JavaScript">CsmContextPath = '<%=path%>';</SCRIPT>
    <title>Charisma SpringMVC Mybatis Framework Demo Login Page</title>
    <meta name="description" content="SargerasWang's CSMFramework Demo">
    <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
    <link rel="stylesheet" href="<c:url value="/css/preloader.css"/> "/>
    <link href="<c:url value='/css/charisma-app.css'/>" rel="stylesheet">

    <style>
        #imgCaptcha {
            position: absolute;
            right: 3px;
            top: 3px;
            z-index: 999;
        }
    </style>
</head>

<body onload="onload()">
<div id="loader-wrapper">
    <div id="loader"></div>
</div>
<div class="ch-container" style="display:none;">
    <div class="row">

        <div class="row">
            <div class="col-md-12 center login-header">
                <h2>欢迎登入系统</h2>
            </div>
            <!--/span-->
        </div>
        <!--/row-->

        <div class="row">
            <div class="well col-md-5 center login-box">
                <c:if test="${msg eq null}">
                    <div id="divInfo" class="alert alert-info">
                        请输入您的用户名和密码.
                    </div>
                </c:if>
                <c:if test="${msg ne null}">
                    <div id="divInfo" class="alert alert-danger">
                        <c:out value="${msg}"></c:out>
                    </div>
                </c:if>
                <form id="loginForm" onsubmit="return validateForm()" class="form-horizontal" method="post"
                      action="<c:url value='/login/login.do'/>">
                    <fieldset>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                            <input id="loginname" name="loginname" type="text" class="form-control" placeholder="用户名"/>
                        </div>
                        <div class="clearfix"></div>
                        <br>

                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                            <input id="password" name="password" type="password" class="form-control" placeholder="密码"/>
                        </div>
                        <div class="clearfix"></div>
                        <br>

                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open red"></i></span>
                            <img id="imgCaptcha" alt="点击更换验证码" src="<c:url value='/login/captcha.do'/>"
                                 onclick="reloadCaptcha()"/>
                            <input id="captcha" name="captcha" maxlength="8" type="text" class="form-control"
                                   placeholder="验证码"/>
                        </div>
                        <div class="clearfix"></div>

                        <p class="center col-md-5">
                            <button type="submit" id="btnSubmit" class="btn btn-primary" data-loading-text="登入中...">登入
                            </button>
                        </p>
                    </fieldset>
                </form>
            </div>
            <!--/span-->
        </div>
        <!--/row-->
    </div>
    <!--/fluid-row-->

</div>
<!--/.fluid-container-->
<script src="<c:url value='/js/lazyload.js'/>"></script>
<script>
    function reloadCaptcha() {
        $("#imgCaptcha").attr("src", "<c:url value='/login/captcha.do?'/>" + new Date().getTime());
    }
    function validateForm() {
        if ($("#loginname").val() == '') {
            $('#divInfo').addClass("alert-danger").text('请填写用户名!');
            return false;
        } else if ($("#password").val() == '') {
            $('#divInfo').addClass("alert-danger").text('请填写密码!');
            return false;
        } else if ($("#captcha").val() == '') {
            $('#divInfo').addClass("alert-danger").text('请填写验证码!');
            return false;
        }
        $("#btnSubmit").button("loading");
        NProgress.start();
        NProgress.inc();
        return true;
    }
    if (top != self) {
        top.location.href = location.href;
    }
    function onload() {
        LazyLoad.js('<c:url value='/bower_components/jquery/1.11.2/jquery-1.11.2.min.js'/>', function () {
            LazyLoad.css('<c:url value='/css/bootstrap.min.css'/>', function () {
                $('body').addClass('loaded');
                $(".ch-container").show();
                $("#loginname").focus();
                setTimeout(function () {
                    LazyLoad.js(['<c:url value='/js/jquery.form.js'/>',
                        '<c:url value='/bower_components/bootstrap/dist/js/bootstrap.min.js'/>',
                        '<c:url value='/js/jquery.cookie.js'/>',
                        '<c:url value='/bower_components/moment/min/moment.min.js'/>',
                        '<c:url value='/bower_components/fullcalendar/dist/fullcalendar.min.js'/>',
                        '<c:url value='/js/jquery.dataTables.min.js'/>',
                        '<c:url value='/js/dataTables.bootstrap.js'/>',
                        '<c:url value='/bower_components/chosen/chosen.jquery.min.js'/>',
                        '<c:url value='/bower_components/colorbox/jquery.colorbox-min.js'/>',
                        '<c:url value='/js/jquery.noty.packaged.min.js'/>',
                        '<c:url value='/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js'/>',
                        '<c:url value='/js/jquery.raty.min.js'/>',
                        '<c:url value='/js/jquery.iphone.toggle.js'/>',
                        '<c:url value='/js/jquery.autogrow-textarea.js'/>',
                        '<c:url value='/js/jquery.uploadify-3.1.min.js'/>',
                        '<c:url value='/js/jquery.history.js'/>',
                        '<c:url value='/js/bootstrap-datepicker.js'/>',
                        '<c:url value='/js/bootstrap-datepicker.zh-CN.js'/>',
                        '<c:url value='/js/prism.js'/>',
                        '<c:url value='/js/bootbox.js'/>',
                        '<c:url value='/js/summernote.js'/>',
                        '<c:url value='/js/summernote-zh-CN.js'/>',
                        '<c:url value='/js/jquery.formautofill.js'/>',
                        '<c:url value='/js/nprogress.js'/>',
                        '<c:url value='/js/base.js'/>',
                        '<c:url value='/js/charisma.js'/>']);
                    LazyLoad.css([
                        '<c:url value='/css/base.css'/>',
                        '<c:url value='/css/charisma-app.css'/>',
                        '<c:url value='/bower_components/fullcalendar/dist/fullcalendar.css'/>',
                        '<c:url value='/bower_components/fullcalendar/dist/fullcalendar.print.css'/>',
                        '<c:url value='/bower_components/chosen/chosen.min.css'/>',
                        '<c:url value='/bower_components/colorbox/example3/colorbox.css'/>',
                        '<c:url value='/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'/>',
                        '<c:url value='/css/elfinder.min.css'/>',
                        '<c:url value='/css/elfinder.theme.css'/>',
                        '<c:url value='/css/jquery.iphone.toggle.css'/>',
                        '<c:url value='/css/uploadify.css'/>',
                        '<c:url value='/css/animate.min.css'/>',
                        '<c:url value='/css/dataTables.bootstrap.css'/>',
                        '<c:url value='/css/datepicker3.css'/>',
                        '<c:url value='/css/prism.css'/>',
                        '<c:url value='/css/nprogress.css'/>',
                        '<c:url value='/css/summernote.css'/>',
                        '<c:url value='/css/font-awesome.min.css'/>']);
                }, 1000);
            });
        });
    }
</script>
</body>
</html>