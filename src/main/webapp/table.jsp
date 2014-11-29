<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>表格</title>
 <jsp:include page="import.jsp" flush="true"/>
<script>
$(document).ready(function() {

    $('#example').baseTable({
        "index": "selectAll",
        "columns": [
            { "mData": "id",title:"编号",width:"100px","mRender":function(data,type,row){

                return data;
            } },
            { "mData": "text","title":"文本" },
            { "mData": "ctime",title:"创建时间" },
            { mData:"status",title:"状态",render:function (data) {
                var s;
                var c;
                switch (data){
                    case 0:
                        s="初始状态"
                        c="";
                        break;
                    case 1:
                        s="进行中"
                        c="label-warning";
                        break;
                    case 2:
                        s="已完成"
                        c="label-success";
                        break;
                    case 3:
                        s="已删除";
                        c="label-danger"
                        break;
                    default :
                }
                return '<span class="'+c+' label label-default">'+s+'</span>';
            }}
        ],
        "search":[
            {"column":"id"},
            {"column":"text"},
            {"column":"ctime","date":true,"placeholder":"创建时间起讫"},
            {column:"status",select:true,"placeholder":"全部状态",
                data:[
                {value:0,text:"初始状态"},
                {value:1,text:"进行中"},
                {value:2,text:"已完成"},
                {value:3,text:"已删除"}
            ]}
        ]
    } );

});
</script>
</head>

<body>
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
    <%-- begin --%>
    <table id="example"></table>
    <%-- end --%>


    <!-- content ends -->
    </div><!--/#content.col-md-0-->
    </div><!--/fluid-row-->

</div><!--/.fluid-container-->
<jsp:include page="externalJS.jsp" flush="true" />
</body>
</html>
