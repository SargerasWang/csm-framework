<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/import.jsp" flush="true"/>
    <script src="<c:url value='/base/getStatusJS/role_status.do'/>"></script>
    <script src="<c:url value='/base/getStatusJS/role_type.do'/>"></script>
</head>

<body>
<form id="myForm" role="form" class="hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="name">名称</label>
        <input type="text" class="form-control" id="name" name="name" maxlength="100" placeholder="请输入名称" required>
    </div>
    <div class="form-group">
        <label for="description">描述</label>
        <input type="text" class="form-control" id="description" name="description" maxlength="200" placeholder="请输入描述">
    </div>
    <div class="form-group">
        <label>状态</label>

        <div>
            <div class="radio">
                <label>
                    <input type="radio" name="status" id="status_1" value="1" checked>
                    正常
                </label>
            </div>
        </div>
    </div>

    </div>
    <div class="form-group">
        <label>类型</label>

        <div>
            <div class="radio">
                <label>
                    <input type="radio" name="type" id="type_2" value="1" checked>
                    一般角色
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="type" id="type_1" value="-1">
                    系统管理员
                </label>
            </div>
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
<jsp:include page="/externalJS.jsp" flush="true"/>
<script>
    $(document).ready(function () {
        //初始化富文本编辑器
        resetHeight();
        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "sys_role",
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
            index: "sys_role.selectAll",
            single: true,
            order: [[0, "asc"]],
            columns: [
                {data: "id", title: "ID", visible: false}
                , {data: "name", title: "名称"}
                , {data: "description", title: "描述", defaultContent: ""}
                , {
                    data: "status", title: "状态", render: function (data) {
                        return role_status[data]
                    }
                }
                , {data: "c_time", title: "创建时间"}
                , {data: "c_user", title: "创建人"}
                , {
                    data: "type", title: "类型", render: function (data) {
                        return role_type[data]
                    }
                }
            ],
            search: [
                {column: "name", "placeholder": "名称"}
                , {column: "description", "placeholder": "描述"}
                , {column: "status", "placeholder": "状态", select: true, data: convertObj2Arr(role_status)}
                , {column: "c_time", "placeholder": "创建时间", date: true}
                , {column: "c_user", "placeholder": "创建人"}
                , {column: "type", "placeholder": "类型", select: true, data: convertObj2Arr(role_type)}
            ],
            download: {
                type: "all",
                fileName: "sys_role",
                statusColumn: [
                    {column: "status", statusArr: "role_status", statusType: "1"}
                    , {column: "type", statusArr: "role_type", statusType: "1"}
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
                            myForm.open({index: "sys_role.insert"});
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        "method": function (datas) {
                            myForm.open({data: datas[0], index: "sys_role.update"});
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
                        icon: "glyphicon glyphicon-trash",
                        "css": "btn-danger",
                        "method": function (datas) {
                            tipConfirm('确认删除数据[' + datas[0].name + ']么?', function (r) {
                                ajaxUpdate({
                                    data: {index: "sys_role.delete", id: datas[0].id},
                                    success: function (r) {
                                        if (r.status == 1) {
                                            tipMsg('操作成功!');
                                            table.draw(false);
                                        }
                                    }
                                });
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