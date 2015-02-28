<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/import.jsp" flush="true"/>
    <style>
        #iconList a i {
            font-size: 24px;
            margin: 2px;
        }
        .sql_index{
            margin-left: 20px;
        }
        #sqlList .list-group-item{
            cursor: pointer;
        }
    </style>
</head>

<body>
<form id="myForm" role="form" class="form-horizontal hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="name" class="col-sm-2">菜单名称</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" maxlength="50" placeholder="请输入菜单名称" required>
        </div>
    </div>
    <div class="form-group">
        <label for="url" class="col-sm-2">链接</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="url" name="url" maxlength="200" placeholder="请输入链接">
        </div>
    </div>
    <div class="form-group">
        <label for="parent" class="col-sm-2">父菜单</label>

        <div class="col-sm-10">
            <select class="form-control" id="parent" name="parent"></select>
        </div>
    </div>
    <div class="form-group">
        <label for="level" class="col-sm-2">层级</label>

        <div class="col-sm-10">
            <input type="number" class="form-control" id="level" name="level" maxlength="0" required readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="icon" class="col-sm-2">图标</label>

        <div class="col-sm-10">
            <input type="hidden" id="icon" name="icon" value="hand-up">
            <button type="button" class="form-control" onclick="clickSelectIcon()"><i id="iSelectBtn"
                                                                                      class="glyphicon glyphicon-hand-up"></i>
            </button>
            <div id="iconList" style="display: none;height: 200px;overflow-y: scroll;"></div>
        </div>
    </div>
    <div class="form-group">
        <label for="remarks" class="col-sm-2">备注</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="remarks" name="remarks" maxlength="200" placeholder="请输入备注">
        </div>
    </div>
    <div class="form-group">
        <label for="seq" class="col-sm-2">排序</label>

        <div class="col-sm-10">
            <input type="number" class="form-control" id="seq" name="seq" maxlength="0" placeholder="请输入排序" required>
        </div>
    </div>
</form>
<form id="menuRoleForm" role="form" class="form-horizontal hide">
    <input type="hidden" name="menu_id">
    <input type="hidden" name="index">
    <input type="hidden" name="level">
    <input type="hidden" name="repeat">
    <div id="rolesList"></div>
</form>
<form id="menuSqlForm" role="form" class="form-horizontal hide">
    <input type="hidden" name="menu_id">
    <input type="hidden" name="index">
    <input type="hidden" name="level">
    <input type="hidden" name="repeat">
    <div id="sqlList"></div>
</form>
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12">
            <table id="example"></table>
        </div>
    </div>
</div>
<jsp:include page="/externalJS.jsp" flush="true"/>
<script src="<c:url value='/js/icon-list.js'/>"></script>
<script>
    //显示父菜单用的
    var level1Menus = new Array();
    level1Menus[0] = "*ROOT*";

    //选择图标
    function clickSelectIcon() {
        $("#iconList").slideToggle();
    }
    //选择角色窗口
    function initRolesList(menu, menuRoleForm) {
        $("#rolesList", menuRoleForm).empty();
        var data = new Array();
        ajaxQuery({
            data: {
                index: "sys_menu.selectRoleListByMenuId",
                menu_id: menu.id
            }, success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    var role = result[i];
                    data.push(role.role_id);
                }
                ajaxQuery({
                    data: {
                        index: "sys_menu.selectRoleIdAndNameList"
                    },
                    success: function (result) {
                        for (var i = 0; i < result.length; i++) {
                            var role = result[i];
                            var checked = "";
                            if (data && $.inArray(role.id, data) != -1) {
                                checked = "checked";
                            }
                            $("#rolesList", menuRoleForm).append('<label><input type="checkbox" name="role_id" value="' + role.id + '" ' + checked + '>' + role.name + '</label><br>');
                        }
                    }
                });
            }
        });
        menuRoleForm.open({
            data: {
                menu_id: menu.id,
                level:menu.level,
                repeat:"role_id"
            },
            index: 'sys_menu.menuUpdateRoles'
        });
    }

    //选择sqlIndex窗口
    function initSqlList(menu, sqlForm) {
        $("#sqlList", sqlForm).empty();
        var data = new Array();
        ajaxQuery({
            data: {
                index: "sys_menu.selectSqlListByMenuId",
                menu_id: menu.id
            }, success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    var sql = result[i];
                    data.push(sql["sql_index"]);
                }
                ajaxQuery({
                    url: getContextPath() + "/base/getAllSqlIndex.do",
                    success: function (result) {
                        var namespace = Object.keys(result);
                        for(var i = 0;i<namespace.length;i++){
                            var div_id = "namespace_"+i;
                            var div = $.parseHTML("<div class='sql_index collapse' id='"+div_id+"'></div>");

                            var indexs = result[namespace[i]];
                            var hasCheck = false;
                            for(var j =0;j<indexs.length;j++){

                                var checked = "";
                                if(data && $.inArray(indexs[j],data) !=-1){
                                    checked = "checked";
                                    hasCheck = true;
                                }
                                $(div).append('<label><input type="checkbox" name="sql_index" value="' + indexs[j] + '" ' + checked + '>' + indexs[j] + '</label><br>');
                            }
                            if(hasCheck){
                                $(div).addClass("in");
                            }
                            $("#sqlList",sqlForm).append("<li class='list-group-item' data-toggle='collapse' data-target='#"+div_id+"'>"+namespace[i]+"</li>").append(div);
                        }
                    }
                });
            }
        });
        sqlForm.open({
            data: {
                menu_id: menu.id,
                level:menu.level,
                repeat:"sql_index"
            },
            index: 'sys_menu.menuUpdateSqlIndex'
        });
    }

    $(document).ready(function () {
        resetHeight();
        //初始化选择图标div
        var iconList = getFaIconList().concat(getGlyphiconIconList());
        $(iconList).each(function () {
            var icon = this;
            var aTag = $.parseHTML('<a><i class="' + icon + '"></i></a>');
            $(aTag).click(function () {
                $("#myForm #icon").val(icon);
                $("#myForm #iSelectBtn").attr("class", icon);
                $("#iconList").hide();
            });
            $("#iconList").append(aTag);
        });

        //父级菜单加载
        ajaxQuery({
            async: false,
            data: {index: "sys_menu.selectLevel1Menus"},
            success: function (data) {
                var $sel = $("#myForm select#parent");
                $sel.append("<option value='0'>*ROOT*</option>");
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    $sel.append("<option value='" + obj.id + "'>" + obj.name + "</option>");

                    level1Menus[obj.id] = obj.name;
                }

                $sel.on("change", function () {
                    if ($(this).val() == 0) {
                        $("#myForm input#level").val(1);
                    } else {
                        $("#myForm input#level").val(2);
                    }
                });
            }
        });
        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "sys_menu",
            submit: function (data) {
                ajaxUpdate({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                            table.draw(false);
                        } else {
                            tipMsg("错误原因" + r.message, "操作失败", "danger", 5000);
                        }
                    }
                });
            }
        });
        var menuRoleForm = $("#menuRoleForm").baseForm({
            title: "设置菜单用户权限",
            submit: function (data) {
                ajaxUpdateBatch({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                        } else {
                            tipMsg("错误原因" + r.message, "操作失败", "danger", 5000);
                        }
                    }
                });
            }
        });
        var menuSqlForm = $("#menuSqlForm").baseForm({
            title: "设置菜单数据权限",
            submit: function (data) {
                ajaxUpdateBatch({
                    data: data,
                    success: function (r) {
                        if (r.status != -1) {
                            tipMsg("操作成功!");
                        } else {
                            tipMsg("错误原因" + r.message, "操作失败", "danger", 5000);
                        }
                    }
                });
            }
        });
        var table = $('#example').baseTable({
            index: "sys_menu.selectAll",
            single: true,
            ordering:false,
            columns: [
                {data: "id", title: "ID"}
                , {data: "name", title: "菜单名称"}
                , {data: "url", title: "链接"}
                , {data: "level", title: "层级"}
                , {
                    data: "parent", title: "父菜单", render: function (d) {
                        return level1Menus[d];
                    }
                }
                , {
                    data: "icon", title: "图标", defaultContent: "", render: function (d) {
                        var icon = d ? d : "";
                        return "<i class='" + icon + "' />";
                    }
                }
                , {data: "remarks", title: "备注", defaultContent: ""}
                , {data: "seq", title: "排序"}
            ],
            buttons: [
                [
                    {
                        "text": "新增",
                        "css": "btn-success",
                        icon: "glyphicon glyphicon-plus",
                        allowNull: true,
                        "method": function () {
                            myForm.open({index: "sys_menu.insert"}, function () {
                                $("#myForm #iSelectBtn").attr("class", "glyphicon glyphicon-hand-up");
                                $("#iconList").hide();
                                $("#iSelectBtn").parent().prop("disabled", false);
                                $("#myForm input#level").val(1);
                            });
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        "method": function (datas) {
                            myForm.open({data: datas[0], index: "sys_menu.update"}, function () {
                                $("#myForm #iSelectBtn").attr("class", datas[0].icon);
                                $("#iconList").hide();
                                $("#iSelectBtn").parent().prop("disabled", false);
                            });
                        }
                    },
                    {
                        text: "查看",
                        icon: "glyphicon glyphicon-eye-open",
                        "css": "btn-info",
                        method: function (datas) {
                            myForm.open({data: datas[0], readOnly: true}, function () {
                                $("#myForm #iSelectBtn").attr("class", datas[0].icon);
                                $("#iconList").hide();
                                $("#iSelectBtn").parent().prop("disabled", true);
                            });
                        }
                    },
                    {
                        "text": "删除",
                        "css": "btn-danger",
                        icon: "glyphicon glyphicon-trash",
                        "method": function (datas) {
                            bootbox.confirm('确认删除数据[' + datas[0] + ']么?', function (r) {
                                if (r) {
                                    ajaxUpdate({
                                        data: {index: "sys_menu.delete", id: datas[0].id},
                                        success: function (r) {
                                            if (r.status == 1) {
                                                tipMsg('操作成功!');
                                                table.draw(false);
                                            }
                                        }
                                    });
                                }
                            });
                        }
                    }
                ], [
                    {
                        text: "用户权限",
                        css: "btn-success",
                        icon: "fa fa-key",
                        method: function (datas) {
                            var menu = datas[0];
                            if (menu.level == 1 && menu.url == "") {
                                bootbox.confirm('对父菜单设置权限将覆盖其所有子菜单的权限设置,您确定么?', function (r) {
                                    if (r) {
                                        initRolesList(menu, menuRoleForm);
                                    }
                                });
                            } else {
                                initRolesList(menu, menuRoleForm);
                            }
                        }
                    },{
                        text: "数据权限",
                        css: "btn-success",
                        icon: "fa fa-database",
                        method: function (datas) {
                            var menu = datas[0];
                            if (menu.level == 1 && menu.url == "") {
                                bootbox.confirm('对父菜单设置权限将覆盖其所有子菜单的权限设置,您确定么?', function (r) {
                                    if (r) {
                                        initSqlList(menu, menuSqlForm);
                                    }
                                });
                            } else {
                                initSqlList(menu, menuSqlForm);
                            }
                        }
                    }
                ]
            ]
        });
    });
</script>
</body>
</html>