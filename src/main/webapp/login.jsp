<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Charisma SpringMVC Mybatis Framework Demo Login Page</title>
    <meta name="description" content="SargerasWang's CSMFramework Demo">
    <jsp:include page="import.jsp" flush="true"/>
    <style>
        #imgCaptcha {
            position: absolute;
            right: 3px;
            top: 3px;
            z-index: 999;
        }
    </style>
</head>

<body>
<div class="ch-container">
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
                <div id="divInfo" class="alert alert-info">
                    请输入您的用户名和密码.
                </div>
                <form id="loginForm" class="form-horizontal" method="post" action="<c:url value='/login/login.do'/>">
                    <fieldset>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                            <input id="loginname" name="loginname" type="text" class="form-control" placeholder="用户名"
                                   required/>
                        </div>
                        <div class="clearfix"></div>
                        <br>

                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                            <input name="password" type="password" class="form-control" placeholder="密码" required/>
                        </div>
                        <div class="clearfix"></div>
                        <br>

                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i style="font-size: 22px" class="fa fa-user-md red"></i></span>
                            <img id="imgCaptcha" alt="点击更换验证码" src="<c:url value='/login/captcha.do'/>"
                                 onclick="reloadCaptcha()"/>
                            <input id="captcha" name="captcha" maxlength="8" type="text" class="form-control"
                                   placeholder="验证码" required/>
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
<jsp:include page="externalJS.jsp" flush="true"/>
<script>
    function reloadCaptcha() {
        $("#imgCaptcha").attr("src", "<c:url value='/login/captcha.do?'/>" + new Date().getTime());
    }
    if (top != self) {
        top.location.href = location.href;
    }
    $(document).ready(function () {
        $("#loginname").focus();
        var msg = "${msg}";
        if(msg){
            switch (msg){
                case "2":
                    $('#divInfo').addClass("alert-danger").text('用户名或密码错误!');
                    break;
                case "3":
                    $('#divInfo').addClass("alert-danger").text('验证码失效,请重新输入!');
                    break;
                case "4":
                    $('#divInfo').addClass("alert-danger").text('验证码错误,请重新输入!');
                    break;
            }
        }
        $("#btnSubmit").click(function(){
            $(this).button("loading");
        });
//        //登入按钮提交
//        $('#loginForm').ajaxForm(function (data) {
//            if (data == 3 || data == 4) {
//                if (data == 3) {
//                    $('#divInfo').addClass("alert-danger").text('验证码失效,请重新输入!');
//                } else {
//                    $('#divInfo').addClass("alert-danger").text('验证码错误,请重新输入!');
//                }
//                reloadCaptcha();
//                $("#captcha").val("").focus();
//
//                $('#btnSubmit').button('reset');
//            } else if (data == 2) {
//                $('#divInfo').addClass("alert-danger").text('用户名或密码错误!');
//                $("#loginname").focus();
//                $('#btnSubmit').button('reset');
//            } else {
//                location.href = getContextPath() + "index.jsp";
//            }
//        });
    });
</script>
</body>
</html>