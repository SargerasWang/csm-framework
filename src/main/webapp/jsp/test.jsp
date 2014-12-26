<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../import.jsp" flush="true"/>
    <script src="<c:url value='/base/getStatusJS/blog_status.do'/>"></script>
    <script src="<c:url value='/base/getStatusJS/blog_permissions.do'/>"></script>
    <script src="<c:url value='/base/getStatusJS/blog_tags.do'/>"></script>
</head>

<body>
<form id="myForm" role="form" class="hide">
    <input type="hidden" name="index">
    <input type="hidden" name="id">

    <div class="form-group">
        <label for="title"></label>
        <input type="text" class="form-control" id="title" name="title" maxlength="45" placeholder="请输入" required>
    </div>
    <div class="form-group">
        <label>状态</label>
        <div>
            <div class="radio">
                <label>
                    <input type="radio" name="status" id="status_1" value="0" checked>
                    初始状态
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="status" id="status_2" value="1" >
                    进行中
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="status" id="status_3" value="2" >
                    已完成
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="status" id="status_4" value="3" >
                    已删除
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="level"></label>
        <input type="number" class="form-control" id="level" name="level" maxlength="0" placeholder="请输入" required>
    </div>
    <div class="form-group">
        <label for="article"></label>
        <textarea id="article" name="article" placeholder="请输入"></textarea>
    </div>
    <div class="form-group">
        <label>权限:</label>
        <div>
            <div class="radio">
                <label>
                    <input type="radio" name="permissions" id="permissions_1" value="1" checked>
                    公开
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="permissions" id="permissions_2" value="2" >
                    私有
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
<div class="ch-container-main">
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
            height: 200
        });
        resetHeight();
        //初始化form
        var myForm = $("#myForm").baseForm({
            title: "blog",
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
            index: "blog.selectAll",
            single: true,
            order: [[0, "asc"]],
            columns: [
                {data: "id", title: "",visible:false}
                ,{data: "ctime", title: ""}
                ,{data: "title", title: ""}
                ,{data: "status", title: "状态",render: function (data) {return blog_status[data]}}
                ,{data: "level", title: ""}
                ,{data: "article", title: "",visible:false,defaultContent:""
                }
                ,{data: "permissions", title: "权限:",render: function (data) {return blog_permissions[data]}}
                ,{data: "tags", title: "标签",defaultContent:""
                    ,render: function (data) {
                        var text = '';
                        if(data != null){
                            var keys = data.split(',');
                            for(var i =0;i<keys.length;i++){
                                if(i != 0){
                                    text +=',';
                                }
                                text +=blog_tags[keys[i]];
                            }
                        }
                        return text;
                    }}
            ],
            search: [
                {column: "ctime","placeholder": "",date:true}
                ,{column: "title","placeholder": ""}
                ,{column: "status","placeholder": "状态",select:true,data: convertObj2Arr(blog_status)}
                ,{column: "level","placeholder": ""}
                ,{column: "article","placeholder": ""}
                ,{column: "permissions","placeholder": "权限:",select:true,data: convertObj2Arr(blog_permissions)}
                ,{column: "tags","placeholder": "标签",select:true,data: convertObj2Arr(blog_tags)}
            ],
            download: {
                type: "all",
                fileName: "blog",
                statusColumn: [
                    {column: "status", statusArr: "blog_status",statusType:"1"}
                    ,{column: "permissions", statusArr: "blog_permissions",statusType:"1"}
                    ,{column: "tags", statusArr: "blog_tags",statusType:"2"}
                ]
            },
            buttons: [
                [
                    {
                        "text": "新增",
                        "css": "btn-success",
                        icon: "plus",
                        allowNull: true,
                        "method": function () {
                            myForm.open({index: "blog.insert"});
                        }
                    },
                    {
                        "text": "修改",
                        "css": "btn-warning",
                        icon: "edit",
                        "method": function (datas) {
                            myForm.open({data: datas[0], index: "blog.update"});
                        }
                    },
                    {
                        text:"查看",
                        icon:"eye-open",
                        "css": "btn-info",
                        method:function(datas){
                            myForm.open({data: datas[0], readOnly: true });
                        }
                    },
                    {
                        "text": "删除",
                        "css": "btn-danger",
                        icon: "trash",
                        "method": function (datas) {
                            bootbox.confirm('确认删除数据[' + datas[0] + ']么?', function (r) {
                                if (r) {
                                    ajaxUpdate({
                                        data: {index: "blog.delete",id: datas[0].id},
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