<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/import.jsp" flush="true"/>
    <script src="<c:url value='/base/getStatusJS/user_status.do'/>"></script>
</head>

<body>
<form id="myForm" role="form" class="hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="role_id">角色</label>
        <select id="role_id" class="form-control" name="role_id"></select>
    </div>
    <div class="form-group">
        <label for="loginname">账号</label>
        <input type="text" class="form-control" id="loginname" name="loginname" maxlength="50" placeholder="请输入账号"
               required>
    </div>
    <div class="form-group">
        <label for="name">姓名</label>
        <input type="text" class="form-control" id="name" name="name" maxlength="50" placeholder="请输入姓名">
    </div>
    <div class="form-group">
        <label for="info">描述</label>
        <input type="text" class="form-control" id="info" name="info" maxlength="1000" placeholder="请输入描述">
    </div>
    <div class="form-group">
        <label for="mobile">手机号</label>
        <input type="text" class="form-control" id="mobile" name="mobile" maxlength="32" placeholder="请输入手机号">
    </div>
    </div>
</form>
<form id="passwordForm" role="form" class="hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="loginname">密码</label>
        <input type="password" class="form-control" id="password" name="password" maxlength="50" placeholder="请输入密码"
               required>
    </div>
</form>
<div class="container-fluid">
    <div class="row">
        <div id="content" class="col-lg-12">
            <table id="example"></table>
        </div>
    </div>
</div>
<div id="onlineDiv">
    <table id="onlineTable" class="table table-striped table-bordered "></table>
</div>
<jsp:include page="/externalJS.jsp" flush="true"/>
<script>
    function disconnect(session_id) {
        ajaxQuery({
            url: "<c:url value='/base/disconnectSession.do'/>",
            data: {session_id: session_id},
            success: function () {
                showOnlineUser()
            }
        });
    }

    function showOnlineUser() {
        $("#onlineTable").empty();
        var th = "<tr><th>用户</th><th>上线时间</th><th>IP</th><th>操作</th></tr>";
        $("#onlineTable").append(th);
        ajaxQuery({
            url: "<c:url value='/base/getOnlineUsers.do'/>",
            success: function (datas) {
                for (var i = 0; i < datas.length; i++) {
                    var data = datas[i];

                    var tr = $.parseHTML("<tr><td>" + data['user_name'] + "</td>"
                    + "<td>" + data['start_time'] + "</td>"
                    + "<td>" + data['ip'] + "</td>"
                    + "<td><a class='btn btn-danger btn-sm' sid='" + data['session_id'] + "' href='#' ><i class='fa fa-chain-broken'></i></a></td>"
                    + "</tr>");
                    $("a", tr).click(function () {
                        disconnect($(this).attr('sid'));
                    });
                    $("#onlineTable").append(tr);
                }
            }
        });
    }

    $(document).ready(function () {
        resetHeight();
        //角色下拉菜单
        $("#role_id").baseSelect({
            index: "selectRoleNameList",
            value: "id",
            text: "name",
            hasNull: false
        });
        //在线用户列表
        var onlineDiv = $("#onlineDiv").modalWin({
            title: "在线用户 <i style='margin-left: 20px;cursor: pointer;color:green;' class='glyphicon glyphicon-refresh' onclick='showOnlineUser()'></i>"
        }).on('shown.bs.modal', function () {
            showOnlineUser()
        });

        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "sys_user_account",
            submit: function (data) {
                ajaxUpdate({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                            myForm.close();
                            table.draw(false);
                        } else {
                            tipAlert({text:"操作失败,原因:" + r.message,type:"error"});
                        }
                    }
                });
            }
        });
        var passwordForm = $("#passwordForm").baseForm({
            title: "修改密码",
            submit: function (data) {
                ajaxUpdate({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                            passwordForm.close();
                        } else {
                            tipAlert({text:"操作失败,原因:" + r.message,type:"error"});
                        }
                    }
                });
            }
        });
        //初始化table
        var table = $('#example').baseTable({
            index: "sys_user_account.selectAll",
            single: true,
            order: [[0, "asc"]],
            columns: [
                {data: "id", title: "ID", visible: true}
                , {
                    data: "role_id", title: "角色", defaultContent: "", render: function (d, a, b) {
                        return b['role_name'];
                    }
                }
                , {data: "loginname", title: "账号"}
                , {data: "name", title: "姓名", defaultContent: ""}
                , {data: "info", title: "描述", defaultContent: ""}
//                ,{data: "status", title: "状态",defaultContent:"",render: function (data) {return user_status[data]}}
                , {data: "mobile", title: "手机号", defaultContent: ""}
                , {data: "c_time", title: "创建时间", defaultContent: ""}
                , {data: "c_user", title: "创建人", defaultContent: ""}
            ],
            search: [
                {column: "role_id", "placeholder": "角色"}
                , {column: "loginname", "placeholder": "账号"}
                , {column: "name", "placeholder": "姓名"}
                , {column: "info", "placeholder": "描述"}
//                ,{column: "status","placeholder": "状态",select:true,data: convertObj2Arr(user_status)}
                , {column: "mobile", "placeholder": "手机号"}
                , {column: "c_time", "placeholder": "创建时间", date: true}
            ],
            buttons: [
                [
                    {
                        "text": "新增",
                        "css": "btn-success",
                        icon: "glyphicon glyphicon-plus",
                        allowNull: true,
                        "method": function () {
                            myForm.open({index: "sys_user_account.insert"});
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        "method": function (datas) {
                            myForm.open({data: datas[0], index: "sys_user_account.update"});
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
                            tipConfirm('确认删除数据[' + datas[0].name + ']么?', function (r) {
                                ajaxUpdate({
                                    data: {index: "sys_user_account.delete", id: datas[0].id},
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
                ], [
                    {
                        "text": "修改密码",
                        "css": "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        "method": function (datas) {
                            passwordForm.open({data: datas[0], index: "sys_user_account.updatePassword!"});
                        }
                    }
                ], [
                    {
                        "text": "查看在线用户",
                        "css": "btn-info",
                        icon: "fa fa-link",
                        allowNull: true,
                        "method": function () {
                            onlineDiv.modal("show");
                        }
                    }
                ]
            ]
        });
    });
</script>
</body>
</html>