<%--suppress ALL --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>代码生成</title>
    <jsp:include page="../import.jsp" flush="true"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div id="content" class="col-lg-12">
            <form id="myForm" role="form" method="post" action="<c:url value='/base/generateCode.do'/>">
                <div class="form-group">
                    <label>选择表</label>

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
            </form>
        </div>
    </div>
</div>
<jsp:include page="../externalJS.jsp" flush="true"/>
<script>
    /**
     * 所有处理方式
     */
    function getAllToDealWith(){
        var toDealWithArr = new Array();
        var useDict = {value:"1",text:"字典翻译",children_name:"statusKey"};
        var allStatusMap = new Array();
        $.ajax({
            async:false,
            url:"<c:url value='/base/getAllStatusMap.do'/>",
            type:"POST",
            dataType:"json",
            success:function(data){
                allStatusMap = data;
            }
        });
        if(allStatusMap.length > 0){
            var child = new Array();
            $(allStatusMap).each(function(i,obj){
                $.each(obj,function(k){
                    child.push({
                        value:k,
                        text:k,
                        children_name:"statusType",
                        childrens:[
                            {value:"1",text:"单选"},
                            {value:"2",text:"多选"},
                            {value:"3",text:"下拉"}
                        ]
                    });
                });
            });
            useDict.childrens=child;
        }

        toDealWithArr.push({value:"0",text:"默认"});
        toDealWithArr.push(useDict);
        toDealWithArr.push({
            value:"2",
            text:"上传文件",
            children_name:"uploadFileType",
            childrens:[
                {
                    value:"1",
                    text:"只允许图片",
                    children_name:"uploadOnlyOne",
                    childrens:[
                        {value:"1",text:"单张"},
                        {value:"2",text:"多张"}
                    ]
                },
                {
                    value:"2",
                    text:"任意文件类型",
                    children_name:"uploadOnlyOne",
                    childrens:[
                        {value:"1",text:"单文件"},
                        {value:"2",text:"多文件"}
                    ]
                }
            ]
        });

        var toDealWithSelect = loopAllDealWith("toDealWith",toDealWithArr);
        return toDealWithSelect;
    }
    function loopAllDealWith(name,arr){
        var toDealWithDiv = $("<div></div>");
        var toDealWithSelect = $("<select></select>").attr("name",name);
        $(toDealWithDiv).append(toDealWithSelect);
        $(arr).each(function(){
            var optionValue = this['value'];
            var option = $("<option></option>").val(optionValue).text(this['text']);
            if(this['childrens']){
                var childrenSelect = loopAllDealWith(this['children_name'],this['childrens']);
                $(childrenSelect).css("margin-left","10px").css("display","none");
                $(childrenSelect).attr("data-parent",optionValue);
                $(toDealWithSelect).after(childrenSelect);
            }
            $(toDealWithSelect).append(option);
        });
        $(toDealWithSelect).on("change",function(){
            $(this).nextAll().hide();
            var childrenSelect = $(this).nextAll("[data-parent="+this.value+"]");
            $(childrenSelect).css("display","inline");
            $("select",childrenSelect).change();
        });
        return toDealWithDiv;
    }

    $(document).ready(function () {
        var allToDealWithSelect = getAllToDealWith();
        $.ajax({
            url: "<c:url value='/base/getTables.do'/>",
            type: "POST",
            dataType: "json",
            success: function (data) {
                $(data).each(function () {
                    var divPanel = $.parseHTML('<div class="panel panel-info"><div class="panel-heading"><h4 class="panel-title">' +
                    '<input type="checkbox" name="tables" value="' + this + '"><a data-toggle="collapse" data-parent="#accordion" href="#collapse_' + this + '">' + this + '</a>' +
                    '</h4></div><div id="collapse_' + this + '" class="panel-collapse collapse"><div class="panel-body"><table class="table responsive" id="dataTable_'+this+'"></table></div></div></div>');
                    var tableName = this;
                    $("#collapse_" + this, divPanel).on("show.bs.collapse", function () {
                        if (!$.fn.DataTable.isDataTable($("table", divPanel))) {
                            $.ajax({
                                url: "<c:url value='/base/getColumns.do'/>",
                                type: "POST",
                                data: {table: tableName},
                                dataType: "json",
                                success: function (data) {
                                    $("table",divPanel).before("<label><input name='"+tableName+"_align' type='radio' value='1' checked>垂直排列</label>&nbsp;&nbsp;");
                                    $("table",divPanel).before("<label><input name='"+tableName+"_align' type='radio' value='2'>水平排列</label>");
                                    $("table", divPanel).DataTable({
                                        dom: "t",
                                        paging: false,
                                        ordering: false,
                                        columns: [
                                            {data: "columnName", title: "字段",width:"200px"},
                                            {data: "remarks", title: "名称",width:"200px",render:function(data){
                                                return '<input type="text" value="'+data+'">';
                                            }},
                                            {title:"处理方式",render:function(d,t,r){
                                                switch (r.simpleType){
                                                    case 0:
                                                        return "无";
                                                    case 1:
                                                        return "格式化为:<code>'%Y/%m/%d %H:%i:%s'</code>";
                                                    case 2:
                                                    case 3:
                                                    case 4:
                                                        return "<div class='toDealWith'></div>";
                                                }
                                            }}
                                        ],
                                        data: data
                                    });
                                    $(".toDealWith",divPanel).append(allToDealWithSelect);
                                    $("table", divPanel).before("<input type='hidden' id='"+tableName+"_config' name='"+tableName+"_config' >");
                                }
                            });
                        }
                    });
                    $("#collapse_" + this, divPanel).on("shown.bs.collapse hidden.bs.collapse",function(){
                       resetHeight();
                    });
                    $("#tableList").append(divPanel);
                    resetHeight();
                })
            }
        });
        $("#myForm").on("submit", function () {
            if ($("input[name='tables']:checked").length == 0) {
                tipMsg("请至少选择一张表!");
                return false;
            }
            if ($("input[name='types']:checked").length == 0) {
                tipMsg("请至少选择一种生成对象!");
                return false;
            }
            //把每个表的设置拼接到hidden
            $("input[name='tables']:checked").each(function(){
                var tableName = $(this).val();
                var configHidden = $("#"+tableName+"_config");
                if(configHidden){
                    var configArr = new Array();
                    var dataTable = $("#dataTable_"+tableName);
                    $("tr",dataTable).each(function(i,tr){
                        var notNullInput = $('input:text,option:selected:visible',tr).filter(function() { return $(this).val() != ""; });
                        if(notNullInput.length > 0){
                            var columnName = $("td:first-child",tr).text();
                            if(columnName){
                                var config = new Object();
                                config.column = columnName;
                                var $tds = $(tr).children();
                                var remarks = $tds.eq(1).children().first().val();
                                if(remarks){
                                    config.remarks = remarks;
                                }
                                if($tds.eq(2).children().length > 0){
                                    var select = $tds.eq(2).find("select:visible");
                                    $(select).each(function(){
                                        config[$(this).attr("name")] = $(this).val();
                                    });
                                }
                                configArr.push(config);
                            }
                        }
                    });
                    $(configHidden).val(JSON.stringify(configArr));
                }
            });
        });
    });
</script>
</body>
</html>