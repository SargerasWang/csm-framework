<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            margin: 0;
        }

        .content {
            width: 880px;
            height: 999px;
            background-image: url("<c:url value="/img/error_cat.jpg"/>");
        }

        .txt {
            padding: 20px;
            font-size: 20px;
            color: #ffffff;
        }
    </style>
    <title>什么!竟然发生了错误!</title>
</head>
<body>
<div align="center">
    <div class="content">
        <div class="txt">
            <c:out value="${message}"></c:out>
            <c:if test="${message eq null}">
                <h2>
                    这个页面被我吃了....
                </h2>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
