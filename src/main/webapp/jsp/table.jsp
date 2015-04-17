<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>表格</title>
    <jsp:include page="../import.jsp" flush="true"/>
    <script src="<c:url value='/base/getStatusJS/blog_status.do'/>"></script>

</head>

<body>
<form id="myForm" role="form" class="hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="title">文本</label>
        <input type="text" class="form-control" id="title" name="title" maxlength="45" required
               placeholder="请输入文本">
    </div>
    <div class="form-group">
        <label for="level">级别</label>
        <input type="number" class="form-control" id="level" name="level" required
               placeholder="请输入级别">
    </div>
</form>
<div class="container-fluid">
    <div class="row">
        <div id="content" class="col-lg-12">
            <table id="example"></table>
        </div>
    </div>
</div>
<jsp:include page="../externalJS.jsp" flush="true"/>
<script>
    $(document).ready(function () {
        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "测试表单",
            submit: function (data) {
                ajaxUpdate({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                            table.reload();
                        }else{
                            tipMsg("错误原因"+ r.message,"error",5000);
                        }
                    }
                });
            }
        });
        var table = $('#example').baseTable({
            "index": "blog.selectAll",
//                "single":true,
            "order":[[2,"desc"]],
            "columns": [
                {data: "id", title: "编号", width: "60px"},
                {data: "title", "title": "标题"},
                {data: "level",title:"等级"},
                {data: "ctime", title: "创建时间"},
                {data: "status", title: "状态", render: function (data) {
                    var c;
                    switch (data) {
                        case 0:
                            c = "";
                            break;
                        case 1:
                            c = "label-warning";
                            break;
                        case 2:
                            c = "label-success";
                            break;
                        case 3:
                            c = "label-danger"
                            break;
                        default :
                    }
                    return '<span class="' + c + ' label label-default">' + blog_status[data] + '</span>';
                    }
                }
            ],
            "search": [
                {column: "id"},
                {column: "title"},
                {column: "ctime", date: true, placeholder: "创建时间起讫"},
                {column: "status", select: true, placeholder: "全部状态",data:convertObj2Arr(blog_status)}
            ],
            "buttons": [
                [
                    {
                        text: "新增",
                        css: "btn-success",
                        icon: "glyphicon glyphicon-plus",
                        allowNull: true,
                        method: function () {
                            myForm.open({index: "blog.insert"});
                        }
                    },
                    {
                        text: "修改",
                        css: "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        method: function (datas) {
                            myForm.open({data:datas[0], index: "blog.update"});
                        }
                    },
                    {
                        text: "删除",
                        css: "btn-danger",
                        icon: "glyphicon glyphicon-trash",
                        method: function (datas) {
                            bootbox.confirm('确认删除数据[' + datas[0].title + ']么?', function (r) {
                                if (r) {
                                    ajaxUpdate({
                                        data:{index: "blog.delete",id: datas[0].id},
                                        success:function(r){
                                            if(r.status == 1){
                                                tipMsg("操作成功!");
                                                table.reload();
                                            }
                                        }
                                    });
                                }
                            });
                        }
                    }
                ]
            ]
        });
    });
</script>
</body>
</html>