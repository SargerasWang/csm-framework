<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Icons</title>
    <jsp:include page="../import.jsp" flush="true"/>
    <style>
        #glyphiconIconDiv div i, #faIconDiv div i{
            font-size: 26px;
        }
    </style>
</head>

<body>

<!-- content starts -->
<div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Home</a>
        </li>
        <li>
            <a href="#"> Icons</a>
        </li>
    </ul>
</div>

<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-picture"></i> Icons</h2>

                <div class="box-icon">
                    <a href="#" class="btn btn-setting btn-round btn-default"><i
                            class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>
            <div class="box-content">
                <section id="icons1">

                    <div class="row">

                        <div class="col-md-6">
                            <h3>How to use</h3>

                            <p>Bootstrap uses an <code>&lt;i&gt;</code> tag for all icons, but they have no case
                                class—only a shared
                                prefix. To use, place the following code just about anywhere:</p>
                            <pre class="prettyprint linenums">&lt;i class="glyphicon glyphicon-search"&gt;&lt;/i&gt;</pre>


                            <p>
                                <span class="label-info label label-default">Heads up!</span>
                                When using beside strings of text, as in buttons or nav links, be sure to leave a
                                space after the
                                <code>&lt;i&gt;</code> tag for proper spacing.
                            </p>
                        </div>
                        <div class="col-md-6">
                            <h3>Use cases</h3>

                            <p>Icons are great, but where would one use them? Here are a few ideas:</p>
                            <ul>
                                <li>As visuals for your sidebar navigation</li>
                                <li>For a purely icon-driven navigation</li>
                                <li>For buttons to help convey the meaning of an action</li>
                                <li>With links to share context on a user's destination</li>
                            </ul>
                            <p>Essentially, anywhere you can put an <code>&lt;i&gt;</code> tag, you can put an icon.
                            </p>
                        </div>
                    </div>

                    <h3>Examples</h3>

                    <p>Use them in buttons, button groups for a toolbar, navigation, or prepended form inputs.</p>

                    <div class="row">
                        <div class="col-md-4">
                            <div style="font-size: 50px">
                                <h5>Big-Color Icons</h5>
                                <span><i class="glyphicon glyphicon-tint"></i></span>
                                <span><i class="glyphicon glyphicon-star yellow"></i></span>
                                <span><i class="glyphicon glyphicon-calendar red"></i></span>
                                <span><i class="glyphicon glyphicon-bell blue"></i></span>
                                <span><i class="glyphicon glyphicon-camera green"></i></span>
                            </div>

                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <a class="btn btn-default" href="#"><i
                                            class="glyphicon glyphicon-align-left"></i></a>
                                    <a class="btn btn-default" href="#"><i
                                            class="glyphicon glyphicon-align-center"></i></a>
                                    <a class="btn btn-default" href="#"><i
                                            class="glyphicon glyphicon-align-right"></i></a>
                                    <a class="btn btn-default" href="#"><i
                                            class="glyphicon glyphicon-align-justify"></i></a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-primary" href="#"><i
                                            class="glyphicon glyphicon-user icon-white"></i> User</a>
                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span
                                            class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><i class="glyphicon glyphicon-pencil"></i> Edit</a></li>
                                        <li><a href="#"><i class="glyphicon glyphicon-trash"></i> Delete</a></li>
                                        <li><a href="#"><i class="glyphicon glyphicon-ban-circle"></i> Ban</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="i"></i> Make admin</a></li>
                                    </ul>

                                </div>
                            </div>

                            <br>

                            <p>
                                <a class="btn btn-default" href="#"><i class="glyphicon glyphicon-refresh"></i>
                                    Refresh</a>
                                <a class="btn btn-success" href="#"><i
                                        class="glyphicon glyphicon-shopping-cart"></i>
                                    Checkout</a>
                                <a class="btn btn-danger" href="#"><i class="glyphicon glyphicon-trash"></i> Delete</a>
                            </p>

                            <p>
                                <a class="btn btn-default btn-lg" href="#"><i
                                        class="glyphicon glyphicon-comment"></i> Comment</a>
                                <a class="btn btn-default btn-sm" href="#"><i class="glyphicon glyphicon-cog"></i>
                                    Settings</a>
                                <a class="btn btn-info btn-sm" href="#"><i
                                        class="glyphicon glyphicon-info-sign"></i> More
                                    Info</a>
                            </p>
                        </div>
                        <div class="col-md-4">
                            <div class="well">
                                <ul class="nav nav-list">
                                    <li class="active"><a href="#"><i class="glyphicon glyphicon-home"></i> Home</a>
                                    </li>
                                    <li><a href="#"><i class="glyphicon glyphicon-book"></i> Library</a></li>
                                    <li><a href="#"><i class="glyphicon glyphicon-pencil"></i> Applications</a></li>
                                    <li><a href="#"><i class="i"></i> Misc</a></li>
                                </ul>
                            </div>
                            <!-- /well -->
                        </div>
                        <div class="col-md-4">
                            <form>
                                <div class="form-group">
                                    <label class="control-label" for="inputIcon">Email address</label>

                                    <div class="input-group input-group-lg">
                                            <span class="input-group-addon"><i
                                                    class="glyphicon glyphicon-envelope red"></i></span>
                                        <input id="inputIcon" type="text" class="form-control"
                                               placeholder="Username">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="page-header">
                        <h1>Icons</h1>
                    </div>
                    <div class="row" id="glyphiconIconDiv">
                    </div>
                    <hr/>
                    <div class="row" id="faIconDiv">
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!--/span-->

</div>
<!--/row-->

<jsp:include page="../externalJS.jsp" flush="true"/>
<script src="<c:url value='/js/icon-list.js'/>"></script>
<script>
    $(document).ready(function() {
        var faIconList = getFaIconList();
        $(faIconList).each(function(){
            $("#faIconDiv").append('<div class="col-md-4 col-sm-6 col-lg-3"><i class="'+this+'" style="width:30px;"></i> '+this+'</div>');
        })
        var glyphiconIconList = getGlyphiconIconList();
        $(glyphiconIconList).each(function(){
            $("#glyphiconIconDiv").append('<div class="col-md-4 col-sm-6 col-lg-3"><i class="'+this+'"></i> '+this+'</div>');
        })
    });
</script>
</body>
</html>
