<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/import.jsp" flush="true"/>
</head>

<body>
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12">
            <table id="example"></table>
        </div>
    </div>
</div>
<jsp:include page="/externalJS.jsp" flush="true"/>
<script>
    $(document).ready(function () {
        resetHeight();
        //初始化table
        $('#example').baseTable({
            index: "price.selectAll",
            single: true,
            order: [[3, "desc"]],
            columns: [
                {data: "id", title: "",visible:false}
                ,{data: "pid", title: "商品ID"}
                ,{data: "product_name", title: "名称"}
                ,{data: "price_time", title: "时间"}
                ,{data: "price", title: "价格"}
                ,{data: "province_id", title: "地区ID"}
                ,{data: "province_name", title: "地区"}
                ,{data: "c_time", title: "扫描时间"}
            ],
            search: [
                {column: "pid","placeholder": "商品ID"}
                ,{column: "price_time","placeholder": "时间",date:true}
                ,{column: "province_id","placeholder": "地区ID"}
                ,{column: "c_time","placeholder": "扫描时间",date:true}
            ],
            download: {
                type: "all",
                fileName: "price",
                statusColumn: []
            },
            buttons:[[{text: "查看图表",
                css: "btn-success",
                icon: "fa fa-bar-chart",
                allowNull: true,
                method: function () {
                    parent.openTab("/jsp/example/price_chart.jsp","价格图表");
                }}]]
        });
    });
</script>
</body>
</html>