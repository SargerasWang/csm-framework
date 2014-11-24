<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入</title>
    <jsp:include page="import.jsp" flush="true"/>
    <script>
        $(function() {
            $("#loginname").focus();

            //登陆按钮提交
            $('#loginForm').submit(function(e){
                e.preventDefault();
                $('#loginForm').serialize();

                $('#loginForm').ajaxSubmit({
                    type:'post',
                    url:"<c:url value='/login/login.do'/>",
                    success:function(data){
                        if(data == 2){
                            $('#divInfo').addClass("alert-danger").text('用户名或密码错误!');
                            $("#loginname").focus();
                        }else{
                            location.href="<c:url value='/'/>";
                        }
                    },
                    error:function(){
                        $('#divInfo').addClass("alert-danger").text('登陆失败!');
                    }
                });
            });
            //回车键绑定
            document.onkeydown = function (e) {
                var theEvent = window.event || e;
                var code = theEvent.keyCode || theEvent.which;
                if (code == 13) {
                    $('#btnSubmit').click();
                }
            }
        });


    </script>
</head>

<body>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>欢迎登陆系统</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <c:if test="${message == null}">
                <div id="divInfo" class="alert alert-info">
                    请输入您的用户名和密码.
                </div>
            </c:if>
            <c:if test="${message != null}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert"
                            aria-hidden="true">
                        &times;
                    </button>
                    <c:out value="${message}" />
                </div>
            </c:if>

            <form id="loginForm" class="form-horizontal" >
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input id="loginname" name="loginname" type="text" class="form-control" placeholder="用户名" required />
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input name="password" type="password" class="form-control" placeholder="密码" required />
                    </div>
                    <div class="clearfix"></div>

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember">记住我</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <button type="submit" id="btnSubmit" class="btn btn-primary">登入</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->
<jsp:include page="externalJS.jsp" flush="true"/>
</body>
</html>
