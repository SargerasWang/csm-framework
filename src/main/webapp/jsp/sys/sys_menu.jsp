<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/import.jsp" flush="true"/>
    <style >
        #iconList a{

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
            <input type="text" class="form-control" id="url" name="url" maxlength="200" placeholder="请输入链接" >
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
            <button type="button" class="form-control" onclick="clickSelectIcon()"><i id="iSelectBtn" class="glyphicon glyphicon-hand-up"></i></button>
            <div id="iconList" style="display: none;">
                <a><i class="glyphicon glyphicon-glass"></i></a>
                <a><i class="glyphicon glyphicon-music"></i></a>
                <a><i class="glyphicon glyphicon-search"></i></a>
                <a><i class="glyphicon glyphicon-envelope"></i></a>
                <a><i class="glyphicon glyphicon-heart"></i></a>
                <a><i class="glyphicon glyphicon-star"></i></a>
                <a><i class="glyphicon glyphicon-star-empty"></i></a>
                <a><i class="glyphicon glyphicon-user"></i></a>
                <a><i class="glyphicon glyphicon-film"></i></a>
                <a><i class="glyphicon glyphicon-th-large"></i></a>
                <a><i class="glyphicon glyphicon-th"></i></a>
                <a><i class="glyphicon glyphicon-th-list"></i></a>
                <a><i class="glyphicon glyphicon-ok"></i></a>
                <a><i class="glyphicon glyphicon-remove"></i></a>
                <a><i class="glyphicon glyphicon-zoom-in"></i></a>
                <a><i class="glyphicon glyphicon-zoom-out"></i></a>
                <a><i class="glyphicon glyphicon-off"></i></a>
                <a><i class="glyphicon glyphicon-signal"></i></a>
                <a><i class="glyphicon glyphicon-cog"></i></a>
                <a><i class="glyphicon glyphicon-trash"></i></a>
                <a><i class="glyphicon glyphicon-home"></i></a>
                <a><i class="glyphicon glyphicon-file"></i></a>
                <a><i class="glyphicon glyphicon-time"></i></a>
                <a><i class="glyphicon glyphicon-road"></i></a>
                <a><i class="glyphicon glyphicon-download-alt"></i></a>
                <a><i class="glyphicon glyphicon-download"></i></a>
                <a><i class="glyphicon glyphicon-upload"></i></a>
                <a><i class="glyphicon glyphicon-inbox"></i></a>
                <a><i class="glyphicon glyphicon-play-circle"></i></a>
                <a><i class="glyphicon glyphicon-repeat"></i></a>
                <a><i class="glyphicon glyphicon-refresh"></i></a>
                <a><i class="glyphicon glyphicon-list-alt"></i></a>
                <a><i class="glyphicon glyphicon-lock"></i></a>
                <a><i class="glyphicon glyphicon-flag"></i></a>
                <a><i class="glyphicon glyphicon-headphones"></i></a>
                <a><i class="glyphicon glyphicon-volume-off"></i></a>
                <a><i class="glyphicon glyphicon-volume-down"></i></a>
                <a><i class="glyphicon glyphicon-volume-up"></i></a>
                <a><i class="glyphicon glyphicon-qrcode"></i></a>
                <a><i class="glyphicon glyphicon-barcode"></i></a>
                <a><i class="glyphicon glyphicon-tag"></i></a>
                <a><i class="glyphicon glyphicon-tags"></i></a>
                <a><i class="glyphicon glyphicon-book"></i></a>
                <a><i class="glyphicon glyphicon-bookmark"></i></a>
                <a><i class="glyphicon glyphicon-print"></i></a>
                <a><i class="glyphicon glyphicon-camera"></i></a>
                <a><i class="glyphicon glyphicon-font"></i></a>
                <a><i class="glyphicon glyphicon-bold"></i></a>
                <a><i class="glyphicon glyphicon-italic"></i></a>
                <a><i class="glyphicon glyphicon-text-height"></i></a>
                <a><i class="glyphicon glyphicon-text-width"></i></a>
                <a><i class="glyphicon glyphicon-align-left"></i></a>
                <a><i class="glyphicon glyphicon-align-center"></i></a>
                <a><i class="glyphicon glyphicon-align-right"></i></a>
                <a><i class="glyphicon glyphicon-align-justify"></i></a>
                <a><i class="glyphicon glyphicon-list"></i></a>
                <a><i class="glyphicon glyphicon-indent-left"></i></a>
                <a><i class="glyphicon glyphicon-indent-right"></i></a>
                <a><i class="glyphicon glyphicon-facetime-video"></i></a>
                <a><i class="glyphicon glyphicon-picture"></i></a>
                <a><i class="glyphicon glyphicon-pencil"></i></a>
                <a><i class="glyphicon glyphicon-map-marker"></i></a>
                <a><i class="glyphicon glyphicon-adjust"></i></a>
                <a><i class="glyphicon glyphicon-tint"></i></a>
                <a><i class="glyphicon glyphicon-edit"></i></a>
                <a><i class="glyphicon glyphicon-share"></i></a>
                <a><i class="glyphicon glyphicon-check"></i></a>
                <a><i class="glyphicon glyphicon-move"></i></a>
                <a><i class="glyphicon glyphicon-step-backward"></i></a>
                <a><i class="glyphicon glyphicon-fast-backward"></i></a>
                <a><i class="glyphicon glyphicon-backward"></i></a>
                <a><i class="glyphicon glyphicon-play"></i></a>
                <a><i class="glyphicon glyphicon-pause"></i></a>
                <a><i class="glyphicon glyphicon-stop"></i></a>
                <a><i class="glyphicon glyphicon-forward"></i></a>
                <a><i class="glyphicon glyphicon-fast-forward"></i></a>
                <a><i class="glyphicon glyphicon-step-forward"></i></a>
                <a><i class="glyphicon glyphicon-eject"></i></a>
                <a><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a><i class="glyphicon glyphicon-chevron-right"></i></a>
                <a><i class="glyphicon glyphicon-plus-sign"></i></a>
                <a><i class="glyphicon glyphicon-minus-sign"></i></a>
                <a><i class="glyphicon glyphicon-remove-sign"></i></a>
                <a><i class="glyphicon glyphicon-ok-sign"></i></a>
                <a><i class="glyphicon glyphicon-question-sign"></i></a>
                <a><i class="glyphicon glyphicon-info-sign"></i></a>
                <a><i class="glyphicon glyphicon-screenshot"></i></a>
                <a><i class="glyphicon glyphicon-remove-circle"></i></a>
                <a><i class="glyphicon glyphicon-ok-circle"></i></a>
                <a><i class="glyphicon glyphicon-ban-circle"></i></a>
                <a><i class="glyphicon glyphicon-arrow-left"></i></a>
                <a><i class="glyphicon glyphicon-arrow-right"></i></a>
                <a><i class="glyphicon glyphicon-arrow-up"></i></a>
                <a><i class="glyphicon glyphicon-arrow-down"></i></a>
                <a><i class="glyphicon glyphicon-share-alt"></i></a>
                <a><i class="glyphicon glyphicon-resize-full"></i></a>
                <a><i class="glyphicon glyphicon-resize-small"></i></a>
                <a><i class="glyphicon glyphicon-plus"></i></a>
                <a><i class="glyphicon glyphicon-minus"></i></a>
                <a><i class="glyphicon glyphicon-asterisk"></i></a>
                <a><i class="glyphicon glyphicon-exclamation-sign"></i></a>
                <a><i class="glyphicon glyphicon-gift"></i></a>
                <a><i class="glyphicon glyphicon-leaf"></i></a>
                <a><i class="glyphicon glyphicon-fire"></i></a>
                <a><i class="glyphicon glyphicon-eye-open"></i></a>
                <a><i class="glyphicon glyphicon-eye-close"></i></a>
                <a><i class="glyphicon glyphicon-warning-sign"></i></a>
                <a><i class="glyphicon glyphicon-plane"></i></a>
                <a><i class="glyphicon glyphicon-calendar"></i></a>
                <a><i class="glyphicon glyphicon-random"></i></a>
                <a><i class="glyphicon glyphicon-comment"></i></a>
                <a><i class="glyphicon glyphicon-magnet"></i></a>
                <a><i class="glyphicon glyphicon-chevron-up"></i></a>
                <a><i class="glyphicon glyphicon-chevron-down"></i></a>
                <a><i class="glyphicon glyphicon-retweet"></i></a>
                <a><i class="glyphicon glyphicon-shopping-cart"></i></a>
                <a><i class="glyphicon glyphicon-folder-close"></i></a>
                <a><i class="glyphicon glyphicon-folder-open"></i></a>
                <a><i class="glyphicon glyphicon-resize-vertical"></i></a>
                <a><i class="glyphicon glyphicon-resize-horizontal"></i></a>
                <a><i class="glyphicon glyphicon-hdd"></i></a>
                <a><i class="glyphicon glyphicon-bullhorn"></i></a>
                <a><i class="glyphicon glyphicon-bell"></i></a>
                <a><i class="glyphicon glyphicon-certificate"></i></a>
                <a><i class="glyphicon glyphicon-thumbs-up"></i></a>
                <a><i class="glyphicon glyphicon-thumbs-down"></i></a>
                <a><i class="glyphicon glyphicon-hand-right"></i></a>
                <a><i class="glyphicon glyphicon-hand-left"></i></a>
                <a><i class="glyphicon glyphicon-hand-up"></i></a>
                <a><i class="glyphicon glyphicon-hand-down"></i></a>
                <a><i class="glyphicon glyphicon-circle-arrow-right"></i></a>
                <a><i class="a icon-circle-arrow-left s s"></i></a>
                <a><i class="glyphicon glyphicon-circle-arrow-up"></i></a>
                <a><i class="glyphicon glyphicon-circle-arrow-down"></i></a>
                <a><i class="glyphicon glyphicon-globe"></i></a>
                <a><i class="glyphicon glyphicon-wrench"></i></a>
                <a><i class="glyphicon glyphicon-tasks"></i></a>
                <a><i class="glyphicon glyphicon-filter"></i></a>
                <a><i class="glyphicon glyphicon-briefcase"></i></a>
                <a><i class="glyphicon glyphicon-fullscreen"></i></a>
            </div>
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
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12">
            <table id="example"></table>
        </div>
    </div>
</div>
<jsp:include page="/externalJS.jsp" flush="true"/>
<script>
    //显示父菜单用的
    var level1Menus=new Array();
    level1Menus[0]="*ROOT*";

    //选择图标
    function clickSelectIcon(){
        $("#iconList").slideToggle();
    }
    $(document).ready(function () {
        resetHeight();
        //初始化选择图标div
        $("#iconList a").each(function(){
            var clazz = $("i",this).attr("class");
            var icon = clazz;
            $(this).click(function(){
                $("#myForm #icon").val(icon);
                $("#myForm #iSelectBtn").attr("class",icon);
                $("#iconList").hide();
            });
        });

        //父级菜单加载
        ajaxQuery({
            async:false,
            data:{index:"sys_menu.selectLevel1Menus"},
            success:function(data){
                var $sel=$("#myForm select#parent");
                $sel.append("<option value='0'>*ROOT*</option>");
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    $sel.append("<option value='" + obj.id + "'>" + obj.name + "</option>");

                    level1Menus[obj.id] = obj.name;
                }

                $sel.on("change",function(){
                   if($(this).val()==0){
                       $("#myForm input#level").val(1);
                   } else{
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
        var table = $('#example').baseTable({
            index: "sys_menu.selectAll",
            single: true,
            order: [[0, "asc"]],
            columns: [
                {data: "id", title: "ID"}
                ,{data: "name", title: "菜单名称"}
                ,{data: "url", title: "链接"}
                ,{data: "level", title: "层级"}
                ,{data: "parent", title: "父菜单",render:function(d){
                    return level1Menus[d];
                }}
                ,{data: "icon", title: "图标",defaultContent:"",render:function(d){
                    var icon = d ?  d : "";
                    return "<i class='"+icon+"' />";
                }}
                ,{data: "remarks", title: "备注",defaultContent:""}
                ,{data: "c_time", title: "创建时间"}
                ,{data: "c_user", title: "创建人"}
                ,{data: "seq", title: "排序"}
            ],
            search: [
                {column: "name","placeholder": "菜单名称"}
                ,{column: "url","placeholder": "链接"}
                ,{column: "level","placeholder": "层级"}
                ,{column: "parent","placeholder": "父菜单"}
                ,{column: "icon","placeholder": "图标"}
                ,{column: "remarks","placeholder": "备注"}
                ,{column: "c_time","placeholder": "创建时间",date:true}
                ,{column: "c_user","placeholder": "创建人"}
                ,{column: "seq","placeholder": "排序"}
            ],
            buttons: [
                [
                    {
                        "text": "新增",
                        "css": "btn-success",
                        icon: "glyphicon glyphicon-plus",
                        allowNull: true,
                        "method": function () {
                            myForm.open({index: "sys_menu.insert"},function(){
                                $("#myForm #iSelectBtn").attr("class","glyphicon glyphicon-hand-up");
                                $("#iconList").hide();
                                $("#iSelectBtn").parent().prop("disabled",false);
                                $("#myForm input#level").val(1);
                            });
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "glyphicon glyphicon-edit",
                        "method": function (datas) {
                            myForm.open({data: datas[0], index: "sys_menu.update"},function(){
                                $("#myForm #iSelectBtn").attr("class",datas[0].icon);
                                $("#iconList").hide();
                                $("#iSelectBtn").parent().prop("disabled",false);
                            });
                        }
                    },
                    {
                        text:"查看",
                        icon: "glyphicon glyphicon-eye-open",
                        "css": "btn-info",
                        method:function(datas){
                            myForm.open({data: datas[0], readOnly: true },function(){
                                $("#myForm #iSelectBtn").attr("class",datas[0].icon);
                                $("#iconList").hide();
                                $("#iSelectBtn").parent().prop("disabled",true);
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
                                        data: {index: "sys_menu.delete",id: datas[0].id},
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
                ]
            ]
        });
    });
</script>
</body>
</html>