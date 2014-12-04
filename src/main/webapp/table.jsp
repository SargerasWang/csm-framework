<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>表格</title>
    <jsp:include page="import.jsp" flush="true"/>
</head>

<body>
<form id="myForm" role="form" class="hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="text">文本</label>
        <input type="text" class="form-control" id="text" name="text"
               placeholder="请输入文本">
    </div>
</form>
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">主页</a>
                    </li>
                    <li>
                        <a href="#">表格</a>
                    </li>
                </ul>
            </div>
            <table id="example"></table>
        </div>
    </div>
</div>
<jsp:include page="externalJS.jsp" flush="true"/>
<script>
    $(document).ready(function () {
        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "测试表单",
            submit: function (data) {
                ajaxUpdate({
                    index: data.index,
                    data: data,
                    success: function (r) {
                        if (r.status = 1) {
                            tipMsg("操作成功!");
                            table.reload();
                        }
                    }
                });
            }
        });
        var table = $('#example').baseTable({
            "index": "test.selectAll",
//                "single":true,
            "order":[[2,"desc"]],
            "columns": [
                {"mData": "id", title: "编号", width: "60px"},
                {"mData": "text", "title": "文本"},
                {"mData": "ctime", title: "创建时间"},
                {
                    mData: "status", title: "状态", render: function (data) {
                    var s;
                    var c;
                    switch (data) {
                        case 0:
                            s = "初始状态"
                            c = "";
                            break;
                        case 1:
                            s = "进行中"
                            c = "label-warning";
                            break;
                        case 2:
                            s = "已完成"
                            c = "label-success";
                            break;
                        case 3:
                            s = "已删除";
                            c = "label-danger"
                            break;
                        default :
                    }
                    return '<span class="' + c + ' label label-default">' + s + '</span>';
                }
                }
            ],
            "search": [
                {"column": "id"},
                {"column": "text"},
                {"column": "ctime", "date": true, "placeholder": "创建时间起讫"},
                {
                    column: "status", select: true, "placeholder": "全部状态",
                    data: [
                        {value: 0, text: "初始状态"},
                        {value: 1, text: "进行中"},
                        {value: 2, text: "已完成"},
                        {value: 3, text: "已删除"}
                    ]
                }
            ],
            "buttons": [
                [
                    {
                        "text": "新增",
                        "css": "btn-success",
                        icon: "plus",
                        allowNull: true,
                        "method": function () {
                            myForm.open({index: "test.insert"});
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "edit",
                        "method": function (datas) {
                            myForm.open({data:datas[0], index: "test.update"});
                        }
                    },
                    {
                        "text": "删除",
                        "css": "btn-danger",
                        icon: "trash",
                        "method": function (datas) {
                            bootbox.confirm('确认删除数据[' + datas[0].text + ']么?', function (r) {
                                if (r) {
                                    ajaxUpdate({
                                        index: "test.delete",
                                        data:{id: datas[0].id},
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
