function getContextPath() {
    return CsmContextPath ? CsmContextPath : "";
}
/**
 * default
 */
bootbox.setDefaults({locale: "zh_CN"});
$(document).ajaxError(function (event, jqXHR, ajaxSettings, thrownError) {
    ajaxErrorCallback(jqXHR);
}).ajaxStart(function () {
    NProgress.start();
    NProgress.inc();
}).ajaxStop(function () {
    NProgress.done();
});
/**
 *重设iframe高度
 */
function resetHeight(height) {
    //index.jsp's function
    if(parent != self){
        parent.resetIframeHeight(window.frameElement, height);
    }
}
function convertObj2Arr(obj) {
    var arr = new Array();
    $.each(obj, function (key, value) {
        arr.push({value: key, text: value});
    });
    return arr;
}
/**
 * 获得随机数   e.g. 0~3  getRandom(3)
 * @param n 随机数范围 0~n
 * @returns {number}
 */
function getRandom(n){
    return Math.floor(Math.random()*n+1)
}
/**
 * 正在加载的遮罩
 * @param hide close关闭
 */
function loading(hide) {
    if ($("#_loading").length == 0) {
        var img = getContextPath() + "/img/ajax-loaders/ajax-loader-7.gif";
        $("<div id=\"_loading\" style=\"display: none;\">正在加载<img src=\"" + img + "\"></div>").prependTo("body");
        $("#_loading").css("height", $("body").height() + "px");
        $("#_loading").css("lineHeight", $("body").height() + "px");
    }
    if (hide == "close") {
        $("#_loading").hide();
    } else {
        $("#_loading").show();
    }
}
/**
 *ajax查询
 * @param opt
 */
function ajaxQuery(opt) {
    var opt = $.extend({}, {
        url: getContextPath() + "/base/query.do",
        type: "POST",
        dataType: "json"
    }, opt);
    $.ajax(opt);
}
/**
 *ajax更新
 * @param opt
 */
function ajaxUpdate(opt) {
    $.ajax($.extend({
        url: getContextPath() + "/base/execute.do",
        type: "POST",
        dataType: "json",
        data: opt.data
    }, opt));
}
/**
 *ajax更新(带批量参数)
 * @param opt
 */
function ajaxUpdateBatch(opt) {
    $.ajax($.extend({
        url: getContextPath() + "/base/executeBatch.do",
        type: "POST",
        dataType: "json",
        data: opt.data
    }, opt));
}

function gotoLoginPage() {
    setTimeout(function () {
        location.href = getContextPath() + "/login.jsp";
    }, 2000);
}
/**
 * ajax error callback
 */
function ajaxErrorCallback(err) {
    switch (err.status) {
        case 200:
            bootbox.alert("本次会话断开,即将重新登入...");
            gotoLoginPage();
            break;
        case 401:
            bootbox.alert("请登录后操作");
            gotoLoginPage();
            break;
        case 402:
            bootbox.alert("您无权限访问该数据");
            break;
        default :
            bootbox.alert("服务器发生错误,代码[" + err.status + "]");
    }
}
/**
 * 下载
 * @param url
 * @param data
 */
function ajax_download(url, data) {
    var $iframe,
        iframe_doc,
        iframe_html;

    if (($iframe = $('#download_iframe')).length === 0) {
        $iframe = $("<iframe id='download_iframe'" +
            " style='display: none' src='about:blank'></iframe>"
        ).appendTo("body");
    }

    iframe_doc = $iframe[0].contentWindow || $iframe[0].contentDocument;
    if (iframe_doc.document) {
        iframe_doc = iframe_doc.document;
    }

    iframe_html = "<html><head></head><body><form method='POST' action='" + url + "'>"

    Object.keys(data).forEach(function (key) {
        iframe_html += "<input type='hidden' name='" + key + "' value='" + data[key] + "'>";
    });

    iframe_html += "</form></body></html>";

    iframe_doc.open();
    iframe_doc.write(iframe_html);
    $(iframe_doc).find('form').submit();
}
/**
 * 导出方法
 */
function datatableDownload(type, options) {
    var index = options.index,
        fileName = options.fileName,
        columns = options.columns,
        statusColumn = options.statusColumn,
        params = options.queryParams,
        order = options.order
    //order
    var _order = [columns[order[0][0]].data, order[0][1]];
    //columns
    var cols = new Array();
    $(columns).each(function () {
        cols.push({data: this.data, title: this.title});
    });
    //params
    var queryParam = new Object();
    $(params).each(function () {
        if ($(this).val() != '') {
            queryParam[this.id] = $(this).val();
        }
    });
    ajax_download(getContextPath() + "/base/tableDownload.do", {
        type: type,
        index: index,
        fileName: fileName,
        columns: JSON.stringify(cols),
        statusColumn: JSON.stringify(statusColumn),
        params: JSON.stringify(queryParam),
        order: _order
    });
}

/**
 * 提示框
 * @param text 文字内容
 * @param type 类型:alert,success,warning,error,information(默认)
 * @param time 显示多长时间后关闭,默认800ms
 */
function tipMsg(opt) {
    if (typeof(opt) == "string") {
        opt = {text: opt};
    }
    top.noty($.extend({}, {type: "information", layout: "center", modal: false, timeout: 1000},opt));
}

/**
 * 模式框 有[确认]按钮,有遮罩
 * @param options
 */
function tipAlert(options) {
    if (typeof(options) == "string") {
        options = {text: options};
    }
    var options = $.extend({}, {layout: "center",  modal: true,buttons:[{
        addClass:'btn btn-sm btn-primary',text:'确认',onClick:function($noty){
            $noty.close();
        }
    }]}, options)
    top.noty(options);
}

/**
 * 确认框
 * @param text 文字
 * @param callback 点击确认后回调
 */
function tipConfirm(text,callback) {
    var options = {
        layout: "center", timeout: 2000, modal: true,type: "warning",
        text:text,
        buttons:[{
            addClass:'btn btn-sm btn-primary',text:'确认',onClick:function($noty){
                callback();
                $noty.close();
            }
        },{
            addClass:'btn btn-sm btn-default',text:'取消',onClick:function($noty){
                $noty.close();
            }
        }]
    };
    top.noty(options);
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
        + '<input type="text" class="input-sm form-control baseSearch'
        + '" id="' + opt.id + '_0' + '" />'
        + '<span class="input-group-addon">~</span>'
        + '<input type="text" class="input-sm form-control baseSearch'
        + '" id="' + opt.id + '_1' + '" />';
    this.append(html);
    this.addClass('input-daterange input-group');
    this.datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd",
        autoclose: true
    });
    this.css("marginRight", "5px");
}

/**
 * richEditor
 */
$.fn.richEditor = function (opt) {
    //placeholder
    var placeholder = false;
    if ($(this).attr("placeholder")) {
        placeholder = $(this).attr("placeholder");
    }
    this.summernote($.extend({
        height: 200,
        lang: 'zh-CN',
        disableResizeEditor: false,
        placeholder: placeholder,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline', 'clear']],
            ['fontname', ['fontname']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'hr']],
            ['view', ['fullscreen'/*, 'codeview'*/]]
            //,['help', ['help']]
        ]
    }, opt));

}

/**
 * baseSelect 下拉菜单
 * method:  默认ajax[通过index取值],
 *          statusMap通过[status.xml]取值,
 *          cascading级联方式通过[index,parent_key,parent_sel]取值
 */
$.fn.baseSelect = function (opt) {
    var opt = $.extend({}, {
        method:"ajax",
        index: "",
        text: "text",
        value: "value",
        hasNull: true,
        data:null,
        statusMap:null,
        parent_key:null,
        parent_sel:null
    }, opt);
    var $sel = $(this);
    if(opt.method == "ajax"){
        if (opt.hasNull) {
            $sel.append("<option value=''>请选择</option>");
        }
        ajaxQuery({
            async:false,
            data: $.extend({},{index: opt.index},opt.data),
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    $sel.append("<option value='" + obj[opt.value] + "'>" + obj[opt.text] + "</option>");
                }
            }
        });
    }else if(opt.method =="statusMap"){
        $sel.empty();
        $.each(opt.statusMap,function(k,v){
            $sel.append("<option value='"+k+"'>"+v+"</option>");
        });
    }else if(opt.method == "cascading"){
        $(opt.parent_sel).on("change",function(){
            $sel.empty();
            if (opt.hasNull) {
                $sel.append("<option value=''>请选择</option>");
            }
            if($(this).val() != ""){
                var d= {index:opt.index};
                d[opt.parent_key] = $(this).val();
                ajaxQuery({
                    async:false,
                    data: $.extend({},d,opt.data),
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {
                            var obj = data[i];
                            $sel.append("<option value='" + obj[opt.value] + "'>" + obj[opt.text] + "</option>");
                        }
                    }
                });
            }
        });
        $(opt.parent_sel).change();
    }
}

/**
 * baseTable
 * @param opt
 */
$.fn.baseTable = function (opt) {
    var _this = this;
    this.addClass("table table-striped table-bordered table-condensed");
    //翻译字段处理
    $(opt.columns).each(function(){
        var col = this;
        if(! col.render){
            this.render = function(data,type,row){
                var formatterValue = row["__"+col.data];
                if(typeof formatterValue != "undefined"){
                    return "["+data+"]"+formatterValue;
                }
                return data;
            }
        }
    });
    var table = this.DataTable($.extend({},
            {
                "autoWidth": false,
                "serverSide": true,
                "searching": false,
                "dom": "<'row-fluid'r><'table-responsive' t><'row'<'col-sm-3'l><'col-sm-5 text-center'p><'col-sm-3'i>>",
                "paginationType": "bootstrap",
                "columns": opt.columns,
                "language": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "对不起，查询不到相关数据！",
                    "sEmptyTable": "对不起，查询不到相关数据！",
                    "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty": "当前显示 0 到 0 条，共 0 条记录",
                    "sInfoFiltered": "数据表中共 _MAX_ 条记录",
                    "sSearch": "搜索",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "",
                        "sNext": "",
                        "sLast": "末页"
                    }
                },
                "ajax": {
                    "url": getContextPath() + "/base/query.do",
                    "type": "POST",
                    "data": function (d) {
                        //index
                        d.index = opt.index;
                        //order
                        if (d.order[0]) {
                            var order_index = d.order[0].column;
                            var column = d.columns[order_index].data;
                            var dir = d.order[0].dir;
                            d.order = {"column": column, "dir": dir};
                        }
                        //search
                        $(".baseSearch", $(_this).parent().parent()).each(function () {
                            if ($(this).val() != '') {
                                d[this.id] = $(this).val();
                            }
                        });
                        delete d.search;
                        delete d.columns;
                        //other data
                        if(opt.data){
                            d = $.extend(d,opt.data);
                        }
                    }
                },
                "drawCallback": function () {
                    //加载完数据后,通知外层改变iframe高度
                    resetHeight();
                    //dataTable_drawCallback();
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
            }, opt)
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
    if (opt.search || opt.download || opt.buttons) {
        var panel = $.parseHTML('<div class="panel panel-default"></div>');
        var panel_heading = $.parseHTML('<div class="panel-heading"></div>');
        var panel_body = $.parseHTML('<div class="panel-body" style="display:none"></div>');
        var btn_toolbar = $.parseHTML('<div class="btn-toolbar" role="toolbar"></div>');
        $(_this).parent().prev().append(panel);
        $(panel).append(panel_heading);
        $(panel_heading).append(btn_toolbar);

        if (opt.search) {
            //搜索按钮添加到toolbar,自己一个group
            var searchBtnGrp = $.parseHTML('<div class="btn-group"></div>');
            var _searchBtn = $.parseHTML('<button type="button" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-search"></span>搜索</button>');
            //点击按钮显示出搜索条件
            $(_searchBtn).on("click", function () {
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
                })[0].title;
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
                    $(select).append("<option value=''>"+colObj.placeholder+"-请选择</option>");
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
            '<i class="glyphicon glyphicon-search"></i> 搜索</button>');
            $(searchBtn).on('click', function () {
                $(this).button('loading');
                var btn = $(this);
                table.ajax.reload(function () {
                    btn.button('reset');
                });
            });
            $(panel_body).append(searchBtn);
        }
        //下载按钮
        if (opt.download) {
            var option = $.extend({
                type: "csv",//csv,excel,all
                statusColumn: []
            }, opt.download);
            var _btnGroup = $.parseHTML('<div class="btn-group"></div>');
            var btnStr = '<button type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-download-alt"></i></button>';
            var downloadOpts = {
                fileName: option.fileName,
                index: opt.index,
                columns: opt.columns,
                statusColumn: option.statusColumn,
                queryParams: $(".baseSearch", $(_this).parent().parent()),
                order: table.order()
            };
            if (option.type == "all" || option.type == "csv") {
                var btnCsv = $($.parseHTML(btnStr)).append(" CSV").on("click", function () {
                    datatableDownload("CSV", downloadOpts);
                });
                $(_btnGroup).append(btnCsv);
            }
            if (option.type == "all" || option.type == "excel") {
                var btnExcel = $($.parseHTML(btnStr)).append(" EXCEL").on("click", function () {
                    datatableDownload("EXCEL", downloadOpts)
                });
                $(_btnGroup).append(btnExcel);
            }
            $(btn_toolbar).append(_btnGroup);
        }
        //按钮
        if (opt.buttons) {
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
                    $(_btn).text(" " + this.text).addClass(css);
                    if (this.icon) {
                        var span = $.parseHTML('<span class="' + this.icon + '"></span>');
                        $(_btn).prepend(span)
                    }
                    var method = this.method;
                    var allowNull = this.allowNull;
                    //点击按钮,将当前选中数据当做参数传回
                    $(_btn).on("click", function () {
                        if (!allowNull && table.rows('.selected').data().length == 0) {
                            tipMsg("请先选择数据", "warning", 1000);
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
    table = $.extend(table, {
        reload: table.ajax.reload
    });
    //移动设备上显示 向左滑动显示更多
    $(_this).parent().prev().append("<div class='text-muted visible-xs'> <i class='fa fa-hand-o-left'/>向左滑动显示更多</div>");
    return table;
}
//baseTable End

/**
 * modalWin
 * @param opt
 * @returns {*|jQuery}
 */
$.fn.modalWin = function (opt) {
    opt = $.extend({}, {
        width: "",
        title: ""
    }, opt);
    var div_modal = $.parseHTML('<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>');
    var div_dialog = $.parseHTML('<div class="modal-dialog"></div>');
    $(div_dialog).width(opt.width);
    var div_content = $.parseHTML('<div class="modal-content"></div>');
    var div_header = $.parseHTML('<div class="modal-header">' +
    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">' + opt.title + '</h4></div>');
    var div_body = $.parseHTML('<div class="modal-body"></div>');

    var div_tmp = $(div_content).append(div_header).append($(div_body).append($(this)));
    if (opt.footer) {
        div_tmp.append(opt.footer);
    }
    var modal_box = $(div_modal).append($(div_dialog).append(div_tmp));
    return modal_box;
}

/**
 * baseForm
 * @param opt
 */
$.fn.baseForm = function (opt) {
    opt = $.extend({
        width: "80%",
        title: "",
        submit: null
    }, opt);

    var div_footer = $.parseHTML('<div class="modal-footer">' +
    '<button type="button" class="btn btn-primary">提交</button></div>');
    //隐藏的提交按钮
    var hide_submit = $.parseHTML('<input type="submit" class="hide" >');
    var _form = this;
    $(this).removeClass("hide");
    //模式化窗口
    var modal_win = $(this.append(hide_submit)).modalWin({
        width: opt.width,
        title: opt.title,
        footer: div_footer
    });
    //组装弹出层
    var modal_box = $.extend($(modal_win), {
        open: function (opt, callback) {
            modal_box.modal("show");
            $(_form)[0].reset();
            $("textarea:not(.note-codable)", _form).each(function () {
                if ($(this).code) {
                    $(this).code("");
                }
            });
            $("[type=hidden]", _form).val('');
            if (opt) {
                opt.data = $.extend(opt.data, {index: opt.index});
                if (opt.data) {
                    $(_form).autofill(opt.data);
                }
                if (opt.readOnly) {
                    $(div_footer).hide();
                    $("input,select", _form).attr("disabled", true);
                    $("div.note-editable", _form).attr("contenteditable", false);
                } else {
                    $(div_footer).show();
                    $("input,select", _form).attr("disabled", false);
                    $("div.note-editable", _form).attr("contenteditable", true);
                }
            }
            $(modal_box).on('shown.bs.modal hidden.bs.modal', function (e) {
                var height = $(modal_box).children()[0].scrollHeight;
                if (e.type == 'shown') {
                    height += 60;
                }
                resetHeight(height);
                if (callback) {
                    callback(opt.data);
                }
            })
        },
        close: function () {
            modal_box.modal("hide");
        },
        resetHeight:function(){
            var height = $(this).children()[0].scrollHeight;
            if ($(this).hasClass("in")) {
                height += 60;
            }
            resetHeight(height);
        }
    });
    //绑定提交事件
    $(_form).on("submit", function () {
        if ($(_form)[0].checkValidity()) {
            var values = $(_form).serializeArray()
            //处理相同name的value要用逗号相隔拼接
            var finalValues = new Object();
            $(values).each(function (i, field) {
                var repeat = false;
                for (var i = 0; i < finalValues.length; i++) {
                    var o = finalValues[i];
                    if (o.name == field.name) {
                        o.value += "," + field.value;
                        repeat = true;
                    }
                }
                if (!repeat) {
                    finalValues[field.name]= field.value;
                }
            });
            opt.submit(finalValues);
        }
        return false;
    });
    $("button", div_footer).on("click", function (e) {
        $(hide_submit).click();
    });
    return modal_box;
}

/**
 * baseTree
 * @param opt
 */
$.fn.baseTree = function(opt){
    opt = $.extend({},{
        index:"",
        tree_self_key:"id",
        tree_parent_key:"pid",
        tree_children_name:"childrens",
        columns:[],
        buttons:null,
        sort_by:null,
        datas:null
    },opt);
    var $this = $(this);
    $this.addClass("table tree table-hover ");
    $this.empty();
    if(opt.datas){
        renderTree($this,opt,opt.datas);
    }else{
        ajaxQuery({
            data: $.extend({},{
                index: opt.index,
                needTreeList: true,
                tree_self_key: opt.tree_self_key,
                tree_parent_key: opt.tree_parent_key,
                tree_children_name: opt.tree_children_name
            },opt.data),
            success: function (r) {
                opt.datas = r;
                renderTree($this,opt,r);
            }
        });
    }
    $this.reload=function(datas){
        $this.empty();
        opt.datas = datas;
        return $this.baseTree(opt);
    }
    $this.getData=function(){
        return opt.datas;
    }
    return $this;
}
function renderTree(treeGrid,opt,datas){
    var head = $.parseHTML("<thead></thead>");
    var tr = $.parseHTML("<tr></tr>");
    $(opt.columns).each(function () {
        if(this['title']){
            $(tr).append("<th>" + this['title'] + "</th>");
        }
    });
    if(opt.buttons){
        $(tr).append("<th>操作</th>");
    }
    if($(tr).children().length != 0){
        $(head).append(tr);
    }
    treeGrid.append(head);
    //sort
    if(datas && opt.sort_by){
        sortByKey(datas,opt.sort_by);
        var tbody = $("<tbody></tbody>");
        $(datas).each(function (index) {
            tbody = loopChildrens(this, tbody, null, {
                self_key: opt.tree_self_key,
                children_name: opt.tree_children_name,
                columns:opt.columns,
                buttons:opt.buttons,
                sort_by:opt.sort_by
            },index,datas.length);
            treeGrid.append(tbody);
            resetHeight();
        });
        treeGrid.treegrid();
    }else{
        treeGrid.append("<tr><td colspan='"+opt.columns.length+"'>暂无数据</td></tr>");
    }
}
function sortByKey(array, key) {
    return array.sort(function(a, b) {
        var x = a[key]; var y = b[key];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
}
function loopChildrens(data, html, parent_id, opt,rowIndex,sumCount) {
    opt = $.extend({
        self_key: "id",
        children_name: "childrens",
        columns: {},
        buttons:[],
        sort_by:null
    }, opt);
    var tr = $.parseHTML("<tr></tr>")
    $(tr).addClass("treegrid-" + data[opt.self_key]);
    if (typeof parent_id != "undefined" && parent_id != null) {
        $(tr).addClass("treegrid-parent-" + parent_id);
    }
    $(opt.columns).each(function () {
        var value = data[this['data']];
        if (this.render) {
            value = this.render(value,data,rowIndex,sumCount);
        } else if (typeof value === "undefined" || value == null) {
            value = "";
        }
        $(tr).append($("<td></td>").append(value));
    });
    if(opt.buttons){
        var btnTD = $.parseHTML("<td></td>");
        $(tr).append(btnTD);
        $(opt.buttons).each(function () {
            var _btnGroup = $.parseHTML('<div class="btn-group" style="margin-right:10px;"></div>');
            $(btnTD).append(_btnGroup);
            $(this).each(function () {
                var css;
                if (typeof this.css === "undefined") {
                    css = "btn-default";
                } else {
                    css = this.css;
                }
                var _btn = $.parseHTML('<button type="button" class="btn btn-xs"></button>');
                $(_btn).text(" " + this.text).addClass(css);
                if (this.icon) {
                    var span = $.parseHTML('<span class="' + this.icon + '"></span>');
                    $(_btn).prepend(span)
                }
                var method = this.method;
                //点击按钮,将当前选中数据当做参数传回
                $(_btn).on("click", function () {
                    var data = $(this).parents("tr").data();
                    method(new Array(data));
                });
                $(_btnGroup).append(_btn);
                $(btnTD).append(_btnGroup);
            });

        });
    }
    $(tr).data(data);
    $(html).append(tr);

    if (!data[opt.children_name]) {
        return html;
    }
    //sort
    if(data[opt.children_name] && opt.sort_by){
        sortByKey(data[opt.children_name],opt.sort_by);
    }
    $(data[opt.children_name]).each(function (index) {
        $(html).parent().append(loopChildrens(this, html, data[opt.self_key], opt,index,data[opt.children_name].length));
    });
    return html;
}
//baseTree End

var getFileComplateUrl = function(key){
    return getContextPath()+"/file/downloadFile.do?key="+key;
}
/**
 * 上传组件
 * @param opt
 * @param resetHeight
 */
$.fn.baseUpload = function(opt,resetHeight){
    var $this = $(this);
    opt = $.extend({},{
        maxFileSize : 2000000,//2MB
        onlyImg : false,
        multiple:false,
        separator:",",
        onuploaded:function(key){
            if(opt.multiple){
                if($this.val()==''){
                    $this.val(key);
                }else{
                    $this.val($this.val()+","+key);
                }
            }else{
                $this.val(key);
            }
        },
        ondeleted:function(key){
            if(opt.multiple){
                var imgArr = $this.val().split(opt.separator);
                imgArr = $.grep(imgArr,function(value){
                    return value != key;
                });
                $this.val(imgArr.join(opt.separator));
            }else{
                $this.val("");
            }
        }
    },opt);
    var imageFileTypes = /^image\/(gif|jpe?g|png)$/i;

    var generateFileDiv = function(key,readOnly){
        var div = $('<div>').addClass("col-md-4");
        var delBtn = $('<button type="button" class="btn btn-xs btn-danger">' +
            '<span class="glyphicon glyphicon-remove-circle"></span> 删除' +
            '</button>');
        if(opt.onlyImg){
            $(div).addClass("btn-group-vertical");
            $(delBtn).addClass("btn-block");
        }else{
            $(div).addClass("btn-group");
        }
        if(readOnly){
            $(delBtn).attr("disabled","disabled");
        }else{
            $(delBtn).click(function(){
                    tipConfirm("此操作不可恢复,确认删除么?",function(){
                        ajaxUpdate({
                            url:getContextPath()+"/file/deleteFile.do",
                            data:{"key":key},
                            success:function(r){
                                if(r.status != 1){
                                    tipAlert({
                                        text: r.message,
                                        type:'warning'
                                    });
                                }
                                $(div).remove();
                                opt.ondeleted(key);
                            }
                        });
                    });
                }
            );
        }
        if(opt.onlyImg){
            var img = $('<img width="100%" height="80%">').attr("src",getFileComplateUrl(key))
                .on("load error",function(){
                    $(div).append(delBtn);
                    if(resetHeight){
                        setTimeout(resetHeight(),500);
                    }
                }
            );
            $(div).append(img);
        }else{
            var downloadBtn = $('<a type="button" class="btn btn-xs btn-success">' +
                '<span class="glyphicon glyphicon-download"></span> 下载查看' +
                '</a>');
            $(downloadBtn).attr("href",getFileComplateUrl(key)).attr("target","_blank");
            $(div).append(downloadBtn);
            $(div).append(delBtn);
        }
        return div;
    }

    var row1= $.parseHTML('<div class="row"></div>');
    var row2= $.parseHTML('<div class="row"></div>');
    var fileupload = $.parseHTML('<input id="fileupload" type="file" class="hide" name="file" >');
    if(opt.multiple){
        $(fileupload).attr("multiple","multiple");
    }
    $(fileupload).wrap('<div class="col-sm-2"></div>');
    var progress = $.parseHTML('<div id="progress" class="progress hide">'
        +'<div class="progress-bar progress-bar-striped" style="width: 0%;"></div>'
        +'</div>');
    $(progress).wrap('<div class="col-sm-10"></div>');
    $(row1).append($(fileupload).parent());
    $(row1).append($(progress).parent());
    $(row2).append('<div class="col-sm-12 uploaded-container"></div>');
    $(this).after(row1)
    $(row1).after(row2);

    var uploadBtn = $.parseHTML("<button type='button' class='btn btn-success btn-xs'>" +
        "<i class='glyphicon glyphicon-cloud-upload'></i> 上传" +
        "</button>");
    $(fileupload).attr("data-url",getContextPath()+"/file/uploadFile.do");
    var  container= $(row2).find(".uploaded-container");
    $(uploadBtn).on('click',function(){
        if(! opt.multiple && $(container).children().length !=0){
            if(opt.onlyImg){
                tipAlert({text:"当前已有图片,请删除后再上传",type:"warning"});
            }else{
                tipAlert({text:"当前已有文件,请删除后再上传",type:"warning"});
            }
            return;
        }
        $($this).next().find("#fileupload").click();
    });
    $(fileupload).before(uploadBtn);
    $(fileupload).fileupload({
        //dataType: 'json',
        add: function(e, data) {
            var uploadErrors = [];
            if(opt.onlyImg){
                if(data.originalFiles[0]['type'] =="" || !imageFileTypes.test(data.originalFiles[0]['type'])) {
                    uploadErrors.push('只允许上传图片文件.');
                }
            }
            if(opt.maxFileSize){
                if(data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > opt.maxFileSize) {
                    uploadErrors.push('文件大小超出限制.');
                }
            }
            if(uploadErrors.length > 0) {
                tipAlert({text:uploadErrors.join("<br>"),type:"warning"});
            } else {
                data.submit();
            }
        },
        done: function (e, data) {
            $(progress).addClass("hide");
            $(progress).find('.progress-bar').css('width','0%').text("");
            var success=true;
            $.each($.parseJSON(data.result), function (index, file) {
                if(file['errMsg']){
                    tipAlert(file['errMsg']);
                    success = false;
                }else{
                    var div = generateFileDiv(file.key);
                    container.append(div);
                    opt.onuploaded(file.key);
                }
            });
            if(success){
                tipMsg({text:"上传成功",layout:"bottomCenter",type:"success"});
            }
            if(resetHeight){
                resetHeight();
            }
        },
        progressall: function (e, data) {
            $(progress).removeClass("hide");
            var pInt = parseInt(data.loaded / data.total * 100, 10);
            $(progress).find('.progress-bar').css(
                'width',
                pInt + '%'
            ).text(pInt + '%');
            if(pInt == 100){
                $(progress).find('.progress-bar').text("上传完成,等待服务器处理,请稍后...")
            }
        }
    });
    var imgPlugin = $.extend({}, $this, {
        clear: function () {
            $(container).empty();
            $(row1).find("button").removeAttr("disabled");
        },
        reload: function (loadOpt) {
            loadOpt = $.extend({},{
                readOnly:false
            },loadOpt);
            this.clear();
            var imgPath = $this.val();
            if(!imgPath){
                return;
            }
            if (opt.multiple) {
                var imgPathArr = imgPath.split(opt.separator);
                $(imgPathArr).each(function(){
                    var div = generateFileDiv(this,loadOpt.readOnly);
                    container.append(div);
                });
            } else {
                var div = generateFileDiv(imgPath,loadOpt.readOnly);
                container.append(div);
            }
            if(loadOpt.readOnly){
                $(row1).find("button").attr("disabled","disabled");
            }else{
                $(row1).find("button").removeAttr("disabled");
            }
        }
    });

    return imgPlugin;
}
//baseUpload end