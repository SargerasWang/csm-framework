/**
 * default
 */
bootbox.setDefaults({locale: "zh_CN"});

/**
 *重设iframe高度
 */
function resetHeight() {
    parent.resetIframeHeight(window.frameElement);
}

/**
 *ajax查询
 * @param opt
 */
function ajaxQuery(opt) {
    $.ajax($.extend({
        url:"/base/query.do",
        type:"POST",
        dataType:"json",
        data: $.extend(opt.data,{"index":opt.index}),
        error:function(err){
            ajaxErrorCallback(err);
        }
    }, opt));
}
/**
 *ajax更新
 * @param opt
 */
function ajaxUpdate(opt) {
    $.ajax($.extend({
        url:"/base/execute.do",
        type:"POST",
        dataType:"json",
        data: $.extend(opt.data,{"index":opt.index}),
        error:function(err){
            ajaxErrorCallback(err);
        }
    }, opt));
}
/**
 * ajax error callback
 */
function ajaxErrorCallback(err) {
    if (err.status == 200) {
        location.href = "/login.jsp";
    } else {
        bootbox.alert("服务器发生错误,代码[" + err.status +"]");
    }
}
/**
 * 提示框
 * @param text 文字内容
 * @param title 标题,默认"系统提示"
 * @param type 类型:info,success(默认),warning,danger
 * @param time 显示多长时间后关闭,默认800ms
 */
function tipMsg(text,title,type,time){
    if(typeof title == "undefined"){
        title="系统提示";
    }
    if(typeof type == "undefined"){
        type="success";
    }
    if(typeof time == "undefined"){
        time=800;
    }
    var _alert= $.parseHTML('<div class="alert alert-'+type+' basealert" style="display:none;">'
           // +'<a href="#" class="close" data-dismiss="alert">&times;</a>'
            +'<h4 class="alert-heading">'+title+'</h4>'+text+'</div>');
    $(document.body).append(_alert);
    $(_alert).fadeIn('fast').delay(time).fadeOut('fast',function(){
        this.remove();
    });
}

/**
 * Created by SagerasWang on 14/11/25.
 */
$.fn.dateRangeBox = function (opt) {
    opt = $.extend({
        placeholder: "",
        inputClass: "",
        id: ""
    }, opt);
    var html = '<span class="input-group-addon">' + opt.placeholder + ':</span>'
        + '<input type="text" class="input-sm form-control '
        + opt.inputClass + '" id="' + opt.id + '_0' + '" />'
        + '<span class="input-group-addon">~</span>'
        + '<input type="text" class="input-sm form-control '
        + opt.inputClass + '" id="' + opt.id + '_1' + '" />';
    this.append(html);
    this.addClass('input-daterange input-group');
    this.datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd",
        autoclose: true
    });
}

/**
 * baseTable
 * @param opt
 */
$.fn.baseTable = function (opt) {
    var _this = this;
    this.addClass("table table-striped table-bordered");
    var table = this.DataTable($.extend(
        {
            "processing": true,
            "serverSide": true,
            "searching": false,
            "dom": "<'row-fluid'r>t<'row'<'col-md-3'l><'col-md-6 center'p><'col-md-3 right'i>>",
            "paginationType": "bootstrap",
            "columns": opt.columns,
            "language": {
                "sProcessing": "正在加载中......",
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "对不起，查询不到相关数据！",
                "sEmptyTable": "对不起，查询不到相关数据！",
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "sInfoEmpty": "当前显示 0 到 0 条，共 0 条记录",
                "sInfoFiltered": "数据表中共 _MAX_ 条记录",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            },
            //"sAjaxSource": "/base/query.do",
            "ajax": {
                "url": "/base/query.do",
                "type": "POST",
                "data": function (d) {
                    //index
                    d.index = opt.index;
                    //order
                    var order_index = d.order[0].column;
                    var column = d.columns[order_index].data;
                    var dir = d.order[0].dir;
                    d.order = {"column": column, "dir": dir};
                    //search
                    $(".baseSearch", $(_this).parent()).each(function () {
                        if ($(this).val() != '') {
                            d[this.id] = $(this).val();
                        }
                    });
                    delete d.search;
                    delete d.columns;
                }
            },
            "drawCallback": function () {
                //加载完数据后,通知外层改变iframe高度
                resetHeight();
            }
            /*,"fnServerData": function (sSource, aoData, fnCallback) {
            console.debug(sSource);
                $.ajax({
                    "dataType": 'json',
                    //"type": "GET",
                    "url": sSource,
                    "data": aoData,
                    "success": fnCallback,
                    "timeout": 15000,   // optional if you want to handle timeouts (which you should)
                    "error": ajaxErrorCallback
                });
            }*/
        },opt)
    );
    $(table).DataTable.ext.errMode = "throw";//出错时不alert
    //绑定选中事件
    if (opt.single == false) {
        $("tbody", this).on('click', 'tr', function () {
            $(this).toggleClass('selected');
        });
    } else {
        $("tbody", this).on('click', 'tr', function () {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        });
    }
    //按钮集合
    if (typeof opt.search != "undefined" || typeof opt.buttons != "undefined") {
        var panel = $.parseHTML('<div class="panel panel-default"></div>');
        var panel_heading = $.parseHTML('<div class="panel-heading"></div>');
        var panel_body = $.parseHTML('<div class="panel-body" style="display:none"></div>');
        var btn_toolbar = $.parseHTML('<div class="btn-toolbar" role="toolbar"></div>');
        $(_this).prev().append(panel);
        $(panel).append(panel_heading);
        $(panel_heading).append(btn_toolbar);

        if (typeof opt.search != "undefined") {
            //搜索按钮添加到toolbar,自己一个group
            var searchBtnGrp = $.parseHTML('<div class="btn-group"></div>');
            var _searchBtn = $.parseHTML('<button type="button" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-search"></span>搜索</button>');
            //点击按钮显示出搜索条件
            $(_searchBtn).bind("click", function () {
                $(panel_body).slideToggle("slow", function () {
                    //加载完数据后,通知外层改变iframe高度
                    resetHeight();
                });
            });
            $(btn_toolbar).append(searchBtnGrp);
            $(searchBtnGrp).append(_searchBtn);
            //搜索条件容器
            $(panel).append(panel_body);
            $(opt.search).each(function (index) {
                var colObj = opt.search[index];
                var column = colObj.column;
                var title = $.grep(opt.columns, function (o) {
                    return o.mData == column;
                })[0].sTitle;
                //placeholder 为空 则使用title
                colObj.placeholder = colObj.placeholder == null ? title : colObj.placeholder;
                if (colObj.date) {
                    //日期控件
                    var div = $.parseHTML("<div></div>");
                    $(div).dateRangeBox({
                        "placeholder": colObj.placeholder,
                        "id": column,
                        "inputClass": "baseSearch"
                    });
                    $(panel_body).append(div);
                } else if (colObj.select) {
                    //下拉菜单
                    var select = $.parseHTML("<select></select>");
                    $(select).addClass("chosen-select baseSearch")
                    $(select).attr("id", column);
                    $(select).append("<option></option>");
                    $(colObj.data).each(function () {
                        var option = $.parseHTML("<option></option>");
                        $(option).attr("value", this.value)
                        $(option).text(this.text)
                        $(select).append(option);
                    });

                    $(select).attr("data-placeholder", colObj.placeholder);
                    $(panel_body).append(select);
                    $(select).chosen({width: "150px", disable_search: true, allow_single_deselect: true});
                } else {
                    //文本框
                    var placeholder = colObj.placeholder == null ? "搜索" + column + "..." : colObj.placeholder;
                    var html = '<div class="input-group">'
                        + '<span class="input-group-addon">' + placeholder + '</span>'
                        + "<input type='text' class='baseSearch' id=" + column + " >"
                        + '</div>';
                    $(panel_body).append(html);
                }
            });
            //真正的搜索按钮
            var searchBtn = $.parseHTML('<button class="btn btn-primary btn-sm pull-right" data-loading-text="查询中...">' +
            '<i class="glyphicon glyphicon-search"></i>搜索</button>');
            $(searchBtn).on('click', function () {
                $(this).button('loading');
                var btn = $(this);
                table.ajax.reload(function () {
                    btn.button('reset');
                });
            });
            $(panel_body).append(searchBtn);
        }
        //按钮
        if (typeof opt.buttons != "undefined") {
            $(opt.buttons).each(function () {
                var _btnGroup = $.parseHTML('<div class="btn-group"></div>');
                $(panel_body).append(_btnGroup);
                $(this).each(function () {
                    var css;
                    if (typeof this.css === "undefined") {
                        css = "btn-default";
                    } else {
                        css = this.css;
                    }
                    var _btn = $.parseHTML('<button type="button" class="btn btn-sm"></button>');
                    $(_btn).text(this.text).addClass(css);
                    if (typeof this.icon !== "undefined") {
                        var span = $.parseHTML('<span class="glyphicon glyphicon-' + this.icon + '"></span>');
                        $(_btn).prepend(span)
                    }
                    var method = this.method;
                    var allowNull = this.allowNull;
                    //点击按钮,将当前选中数据当做参数传回
                    $(_btn).bind("click", function () {
                        if (!allowNull && table.rows('.selected').data().length == 0) {
                            tipMsg("请先选择数据","提示","warning");
                            return false;
                        }
                        method(table.rows('.selected').data());
                    });
                    $(_btnGroup).append(_btn);
                    $(btn_toolbar).append(_btnGroup);
                });

            });

        }
    }
    //baseTable 事件
    table = $.extend(table,{
       reload:table.ajax.reload
    });
    return table;
}
//baseTable End

/**
 * baseForm
 * @param opt
 */
$.fn.baseForm = function (opt) {
    var div_modal = $.parseHTML('<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>');
    var div_dialog = $.parseHTML('<div class="modal-dialog"></div>');
    var div_content = $.parseHTML('<div class="modal-content"></div>');
    var div_header = $.parseHTML('<div class="modal-header">' +
    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">' + opt.title + '</h4></div>');
    var div_body = $.parseHTML('<div class="modal-body"></div>');
    var div_footer = $.parseHTML('<div class="modal-footer">' +
    '<button type="button" class="btn btn-primary">提交</button></div>');
    var _form = this;
    $(this).removeClass("hide");
    //组装弹出层
    var modal_box = $.extend($(div_modal).append($(div_dialog).append($(div_content).append(div_header).append($(div_body).append(this)).append(div_footer))), {
        open: function (opt) {
            modal_box.modal("show");
            $(_form)[0].reset();
            $("[type=hidden]",_form).val('');
            if (opt) {
                opt.data = $.extend(opt.data,{index:opt.index});
                if (opt.data) {
                    $(_form).autofill(opt.data);
                }
            }
        },
        close: function () {
            modal_box.modal("hide");
        }
    });
    //绑定提交事件
    $(".btn-primary", div_footer).on("click", function () {
        opt.submit($(_form).serializeArray());
        modal_box.close();
    });
    return modal_box;
}