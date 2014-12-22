<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>代码生成</title>
    <jsp:include page="../import.jsp" flush="true"/>
</head>

<body>
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12">
            <form id="myForm" role="form" method="post" action="/base/generateCode.do">
                <div class="form-group">
                    <div class="form-group">
                        <label >选择表</label>
                        <div id="tableList"></div>
                    </div>
                    <div class="form-group">
                        <label>生成:</label>
                        <div class="checkbox">
                            <label><input type="checkbox" name="types" value="JSP">JSP</label>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" name="types" value="XML">XML</label>
                        </div>
                    </div>
                    <button class="btn btn-primary">生成</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../externalJS.jsp" flush="true"/>
<script>
    $(document).ready(function () {
        $.ajax({
            url: "/base/getTables.do",
            type: "POST",
            dataType: "json",
            success:function(data){
                $(data).each(function(){
                    var label = $.parseHTML('<div class="checkbox"><label><input type="checkbox" name="tables" value="'+this+'">'+this+'</label></div>');
                    $("#tableList").append(label);
                })
            }
        });
        $("#myForm").on("submit",function(){
           if($("input[name='tables']:checked").length == 0){
               tipMsg("请至少选择一张表!");
               return false;
           }
           if($("input[name='types']:checked").length == 0){
               tipMsg("请至少选择一种生成对象!");
               return false;
           }
        });
    });
</script>
</body>
</html>