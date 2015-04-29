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
    $(document).ready(function () {
        //所有字典值
        var allStatusMap = new Object();
        $.ajax({
            async:false,
            url:"<c:url value='/base/getAllStatusMap.do'/>",
            type:"POST",
            dataType:"json",
            success:function(data){
                allStatusMap = data;
            }
        })
        //选字典值用的下拉菜单
        var divSelectStatus = $.parseHTML('<div></div>');
        var selectStatus = $.parseHTML('<select></select>');
        var selectText = $.parseHTML('<code style="display:none;"></code>');
        var statusType = $.parseHTML('<span style="display:none;"><select><option value="1" checked>单选</option>' +
            '<option value="2" checked>多选</option></select></sapn>')
        $(selectStatus).append("<option value='' >无</option>");
        $(allStatusMap).each(function(i,obj){
            $.each(obj,function(k){
                var option = $.parseHTML('<option value="'+k+'" index="'+i+'">'+k+'</option>');
                $(selectStatus).append(option);
            });
        });
        $(selectStatus).on("change",function(){
            var sIndex = $(":selected",this).attr("index");
            if(sIndex){
                var v= $(":selected",this).val();
                $(this).next().show();
                $(this).next().next().show();
                $(this).next().next().text(JSON.stringify(allStatusMap[parseInt(sIndex)][v]));
            }else{
                $(this).next().hide();
                $(this).next().next().hide();
                $(this).next().next().text("");
            }
        });
        $(divSelectStatus).append(selectStatus).append(statusType).append(selectText);

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
                                    $("table", divPanel).DataTable({
                                        dom: "t",
                                        paging: false,
                                        ordering: false,
                                        columns: [
                                            {data: "columnName", title: "字段"},
                                            {data: "remarks", title: "名称",render:function(data){
                                                return '<input type="text" value="'+data+'">';
                                            }},
                                            {title:"使用字典翻译",render:function(d,t,r){
                                                if(r.simpleType ==2 || r.simpleType == 3){
                                                    return "<div class='selectAllStatusMap'></div>";
                                                }
                                                return "";
                                            }}
                                        ],
                                        data: data,
                                        drawCallback: function () {
                                            resetHeight();
                                        }
                                    });
                                    $(".selectAllStatusMap",divPanel).append(divSelectStatus);
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
                                    var statusKey = $tds.eq(2).find("select").first().val();
                                    var statusType = $tds.eq(2).find("select").eq(1).val();
                                    if(statusKey){
                                        config.statusKey = statusKey;
                                        config.statusType = statusType;
                                    }
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