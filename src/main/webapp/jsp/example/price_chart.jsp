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
            <div id="choices">
                时间:
                <label><input type="radio" value="7" name="time">最近一周 </label>
                <label><input type="radio" value="31" name="time">最近一月</label>
                <label><input type="radio" value="90" name="time">最近3月 </label>
                <label><input type="radio" value="183" checked name="time">最近半年 </label>
                <label><input type="radio" value="365" name="time">最近一年 </label>
                <label><input type="radio" value="1095" name="time">最近三年 </label>
                <label><input type="radio" value="0" name="time">所有</label>
                <br>
            </div>
            <div id="example" class="center" style="height:500px">
            </div>
        </div>
    </div>
</div>
<jsp:include page="/externalJS.jsp" flush="true"/>
<script src="<c:url value='/bower_components/flot/excanvas.min.js'/>"></script>
<script src="<c:url value='/bower_components/flot/jquery.flot.js'/>"></script>
<script src="<c:url value='/bower_components/flot/jquery.flot.time.js'/>"></script>
<script src="<c:url value='/bower_components/flot/jquery.flot.resize.js'/>"></script>

<script>
    function formatTime(time) {
        var date = new Date(parseInt(time));
        return "" + (1900 + date.getYear()) + "/" + (1 + date.getMonth()) + "/" + date.getDate();
    }
    function getPname(pid) {
        switch (pid) {
            case 8:
                return "玉米";
            case 9:
                return "豆粕";
            case 19:
                return "外三元猪";
            case 20:
                return "土杂猪";
            case 22:
                return "内三元猪";
        }
    }
    function getProvinceName(id) {
        switch (id) {
            case 0:
                return "全国平均";
            case 17:
                return "山西";
        }
    }
    function plotAccordingToChoices() {
        var choiceContainer = $("#choices");

        var pids = [];
        var province_ids = [];
        var time = 0;

        var datas = [];
        choiceContainer.find("input:checked").each(function () {
            var key = $(this).attr("name");
            var val = parseInt($(this).val());
            if (key == "choice_pids") {
                pids.push(val);
            } else if (key == "choice_provinceids") {
                province_ids.push(val);
            } else {
                time = val;
            }
        });

        for (var pid in pids) {
            for (var province_id in province_ids) {
                ajaxQuery({
                    async: false,
                    data: {
                        index: "price.selectForChart",
                        pid: pids[pid],
                        province_id: province_ids[province_id],
                        price_time: time
                    },
                    success: function (data) {
                        var tmpData = new Array();
                        for (var i = 0; i < data.length; i++) {
                            tmpData.push([data[i].price_time * 1000, data[i].price]);
                        }
                        datas.push(
                                {
                                    data: tmpData,
                                    label: getProvinceName(province_ids[province_id]) + "-" + getPname(pids[pid]),
                                    yaxis: pids[pid] < 10 ? 1 : 2
                                }
                        );
                    }
                });
                NProgress.inc();
            }
        }
        $.plot($("#example"), datas, {
            series: {
                lines: {show: true}//,                        points: {show: true}
            },
            legend: {position: "nw"},
            grid: {hoverable: true, backgroundColor: {colors: ["#fff", "#eee"]}},
            xaxis: {mode: "time", timeformat: "%Y/%m/%d"},
            yaxes: [{position: 'left', min: 1000, max: 6000},
                {position: 'right', min: 8, max: 20}],
            hooks:{drawOverlay:[function(){
                NProgress.done();
            }]}
        });
        function showTooltip(x, y, contents) {
            var tooltip = $('<div id="tooltip">' + contents + '</div>').css({
                position: 'absolute',
                display: 'none',
                top: y + 5,
                border: '1px solid #fdd',
                padding: '2px',
                'background-color': '#dfeffc',
                opacity: 0.80
            });
            if (x + 200 > $("#example").width()) {
                $(tooltip).css({right: $("#example").width() - x - 5});
            } else {
                $(tooltip).css({left: x + 5});
            }
            tooltip.appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#example").bind("plothover", function (event, pos, item) {

            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2);

                    showTooltip(item.pageX, item.pageY,
                            item.series.label + "在" + formatTime(x) + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    }

    $(document).ready(function () {
        resetHeight();
        var pids = [8, 9, 19, 20, 22];
        var province_ids = [0, 17];

        //筛选器
        var choiceContainer = $("#choices");
        choiceContainer.append("商品:");
        for (var pid in pids) {
            var html = "<input type='checkbox' name='choice_pids' value=" + pids[pid];
            if (pids[pid] == 8 || pids[pid] == 19) {
                html += " checked='checked'";
            }
            html += " id='pid" + pids[pid] + "'></input>" +
            "<label for='pid" + pids[pid] + "'>"
            + getPname(pids[pid]) + "</label>";
            choiceContainer.append(html);
        }
        choiceContainer.append("<br>地区:");
        for (var province_id in province_ids) {
            var html = "<input type='checkbox' name='choice_provinceids' value=" + province_ids[province_id];
            if (province_ids[province_id] == 17) {
                html += " checked='checked'";
            }
            html += " id='prid" + province_ids[province_id] + "'></input>" +
            "<label for='prid" + province_ids[province_id] + "'>"
            + getProvinceName(province_ids[province_id]) + "</label>";
            choiceContainer.append(html);
        }
        //筛选器绑定事件
        choiceContainer.find("input").click(function(){
            NProgress.start();
            setTimeout(function () {
                plotAccordingToChoices();
            },10);
        });
        NProgress.start();
        setTimeout(function () {
            plotAccordingToChoices();
        },10);

    });
</script>
</body>
</html>