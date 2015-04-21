<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <label for="title">标题</label>
        <input type="text" class="form-control" id="title" name="title" maxlength="45" required
               placeholder="请输入标题">
    </div>
    <div class="form-group">
        <label for="level">级别</label>
        <input type="number" class="form-control" id="level" name="level" required
               placeholder="请输入级别">
    </div>
    <div class="form-group">
        <label for="article">文章</label>

        <textarea id="article" name="article" placeholder="请撰写文章内容">
        </textarea>
    </div>
    <div class="form-group">
        <label>权限</label>

        <div>
            <div class="radio">
                <label>
                    <input type="radio" name="permissions" id="permissions_1" value="1" checked>
                    公开
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="permissions" id="permissions_2" value="2">
                    私有(仅本人可见)
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label>标签</label>

        <div>
            <label class="checkbox-inline">
                <input type="checkbox" name="tags" value="1"> 技术
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="tags" value="2"> 人文
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="tags" value="3"> 科技
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="tags" value="4"> 时事评论
            </label>
        </div>
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
        //初始化富文本编辑器
        $('#article').richEditor({
            height: 200,
            disableResizeEditor: true
        });
        resetHeight();
        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "测试表单",
            submit: function (data) {
                ajaxUpdate({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                            table.draw(false);
                        } else {
                            tipMsg("错误原因" + r.message, "error", 5000);
                        }
                    }
                });
            }
        });
        var table = $('#example').baseTable({
            index: "blog.selectAll",
            single: true,
            order: [[2, "desc"]],
            columns: [
                {data: "id", title: "编号", width: "60px"},
                {data: "title", "title": "标题"},
                {data: "level", title: "等级"},
                {data: "ctime", title: "创建时间"},
                {
                    data: "status", title: "状态", render: function (data) {
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
                },
                {data: "article", title: "文章内容", visible: false}
            ],
            search: [
                {column: "id"},
                {column: "title"},
                {column: "ctime", "date": true, "placeholder": "创建时间起讫"},
                {column: "status", select: true, "placeholder": "全部状态", data: convertObj2Arr(blog_status)}
            ],
            download: {
                type: "all",
                fileName: "博客列表",
                statusColumn: [
                    {column: "status", statusArr: "blog_status"}
                ]
            },
            buttons: [
                [
                    {
                        "text": "新增",
                        "css": "btn-success",
                        icon: "glyphicon glyphicon-plus",
                        allowNull: true,
                        "method": function () {
                            myForm.open({index: "blog.insert"});
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        "method": function (datas) {
                            myForm.open({data: datas[0], index: "blog.update"});
                        }
                    },
                    {
                        text: "查看",
                        icon: "glyphicon glyphicon-eye-open",
                        "css": "btn-info",
                        method: function (datas) {
                            myForm.open({data: datas[0], readOnly: true});
                        }
                    },
                    {
                        "text": "删除",
                        "css": "btn-danger",
                        icon: "glyphicon glyphicon-trash",
                        "method": function (datas) {
                            tipConfirm('确认删除数据[' + datas[0].title + ']么?', function (r) {
                                ajaxUpdate({
                                    data: {index: "blog.delete", id: datas[0].id},
                                    success: function (r) {
                                        if (r.status == 1) {
                                            tipMsg('操作成功!');
                                            table.reload();
                                        }
                                    }
                                });
                            });
                        }
                    }
                ],
                [
                    {
                        "text": "审核"
                    },
                    {
                        text: "上架"
                    },
                    {
                        text: "下架"
                    }
                ]
            ]
        });
    });
</script>
</body>
</html>