<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Icons</title>
    <jsp:include page="../import.jsp" flush="true"/>
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
                    <div class="row bs-icons">
                        <div class="col-md-3">
                            <ul class="the-icons">
                                <li><i class="glyphicon glyphicon-glass"></i> glyphicon glyphicon-glass</li>
                                <li><i class="glyphicon glyphicon-music"></i> glyphicon glyphicon-music</li>
                                <li><i class="glyphicon glyphicon-search"></i> glyphicon glyphicon-search</li>
                                <li><i class="glyphicon glyphicon-envelope"></i> glyphicon glyphicon-envelope</li>
                                <li><i class="glyphicon glyphicon-heart"></i> glyphicon glyphicon-heart</li>
                                <li><i class="glyphicon glyphicon-star"></i> glyphicon glyphicon-star</li>
                                <li><i class="glyphicon glyphicon-star-empty"></i> glyphicon glyphicon-star-empty
                                </li>
                                <li><i class="glyphicon glyphicon-user"></i> glyphicon glyphicon-user</li>
                                <li><i class="glyphicon glyphicon-film"></i> glyphicon glyphicon-film</li>
                                <li><i class="glyphicon glyphicon-th-large"></i> glyphicon glyphicon-th-large</li>
                                <li><i class="glyphicon glyphicon-th"></i> glyphicon glyphicon-th</li>
                                <li><i class="glyphicon glyphicon-th-list"></i> glyphicon glyphicon-th-list</li>
                                <li><i class="glyphicon glyphicon-ok"></i> glyphicon glyphicon-ok</li>
                                <li><i class="glyphicon glyphicon-remove"></i> glyphicon glyphicon-remove</li>
                                <li><i class="glyphicon glyphicon-zoom-in"></i> glyphicon glyphicon-zoom-in</li>
                                <li><i class="glyphicon glyphicon-zoom-out"></i> glyphicon glyphicon-zoom-out</li>
                                <li><i class="glyphicon glyphicon-off"></i> glyphicon glyphicon-off</li>
                                <li><i class="glyphicon glyphicon-signal"></i> glyphicon glyphicon-signal</li>
                                <li><i class="glyphicon glyphicon-cog"></i> glyphicon glyphicon-cog</li>
                                <li><i class="glyphicon glyphicon-trash"></i> glyphicon glyphicon-trash</li>
                                <li><i class="glyphicon glyphicon-home"></i> glyphicon glyphicon-home</li>
                                <li><i class="glyphicon glyphicon-file"></i> glyphicon glyphicon-file</li>
                                <li><i class="glyphicon glyphicon-time"></i> glyphicon glyphicon-time</li>
                                <li><i class="glyphicon glyphicon-road"></i> glyphicon glyphicon-road</li>
                                <li><i class="glyphicon glyphicon-download-alt"></i> glyphicon
                                    glyphicon-download-alt
                                </li>
                                <li><i class="glyphicon glyphicon-download"></i> glyphicon glyphicon-download</li>
                                <li><i class="glyphicon glyphicon-upload"></i> glyphicon glyphicon-upload</li>
                                <li><i class="glyphicon glyphicon-inbox"></i> glyphicon glyphicon-inbox</li>
                                <li><i class="glyphicon glyphicon-play-circle"></i> glyphicon glyphicon-play-circle
                                </li>
                                <li><i class="glyphicon glyphicon-repeat"></i> glyphicon glyphicon-repeat</li>
                                <li><i class="glyphicon glyphicon-refresh"></i> glyphicon glyphicon-refresh</li>
                                <li><i class="glyphicon glyphicon-list-alt"></i> glyphicon glyphicon-list-alt</li>
                                <li><i class="glyphicon glyphicon-lock"></i> glyphicon glyphicon-lock</li>
                                <li><i class="glyphicon glyphicon-flag"></i> glyphicon glyphicon-flag</li>
                                <li><i class="glyphicon glyphicon-headphones"></i> glyphicon glyphicon-headphones
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <ul class="the-icons">
                                <li><i class="glyphicon glyphicon-volume-off"></i> glyphicon glyphicon-volume-off
                                </li>
                                <li><i class="glyphicon glyphicon-volume-down"></i> glyphicon glyphicon-volume-down
                                </li>
                                <li><i class="glyphicon glyphicon-volume-up"></i> glyphicon glyphicon-volume-up</li>
                                <li><i class="glyphicon glyphicon-qrcode"></i> glyphicon glyphicon-qrcode</li>
                                <li><i class="glyphicon glyphicon-barcode"></i> glyphicon glyphicon-barcode</li>
                                <li><i class="glyphicon glyphicon-tag"></i> glyphicon glyphicon-tag</li>
                                <li><i class="glyphicon glyphicon-tags"></i> glyphicon glyphicon-tags</li>
                                <li><i class="glyphicon glyphicon-book"></i> glyphicon glyphicon-book</li>
                                <li><i class="glyphicon glyphicon-bookmark"></i> glyphicon glyphicon-bookmark</li>
                                <li><i class="glyphicon glyphicon-print"></i> glyphicon glyphicon-print</li>
                                <li><i class="glyphicon glyphicon-camera"></i> glyphicon glyphicon-camera</li>
                                <li><i class="glyphicon glyphicon-font"></i> glyphicon glyphicon-font</li>
                                <li><i class="glyphicon glyphicon-bold"></i> glyphicon glyphicon-bold</li>
                                <li><i class="glyphicon glyphicon-italic"></i> glyphicon glyphicon-italic</li>
                                <li><i class="glyphicon glyphicon-text-height"></i> glyphicon glyphicon-text-height
                                </li>
                                <li><i class="glyphicon glyphicon-text-width"></i> glyphicon glyphicon-text-width
                                </li>
                                <li><i class="glyphicon glyphicon-align-left"></i> glyphicon glyphicon-align-left
                                </li>
                                <li><i class="glyphicon glyphicon-align-center"></i> glyphicon
                                    glyphicon-align-center
                                </li>
                                <li><i class="glyphicon glyphicon-align-right"></i> glyphicon glyphicon-align-right
                                </li>
                                <li><i class="glyphicon glyphicon-align-justify"></i> glyphicon
                                    glyphicon-align-justify
                                </li>
                                <li><i class="glyphicon glyphicon-list"></i> glyphicon glyphicon-list</li>
                                <li><i class="glyphicon glyphicon-indent-left"></i> glyphicon glyphicon-indent-left
                                </li>
                                <li><i class="glyphicon glyphicon-indent-right"></i> glyphicon
                                    glyphicon-indent-right
                                </li>
                                <li><i class="glyphicon glyphicon-facetime-video"></i> glyphicon
                                    glyphicon-facetime-video
                                </li>
                                <li><i class="glyphicon glyphicon-picture"></i> glyphicon glyphicon-picture</li>
                                <li><i class="glyphicon glyphicon-pencil"></i> glyphicon glyphicon-pencil</li>
                                <li><i class="glyphicon glyphicon-map-marker"></i> glyphicon glyphicon-map-marker
                                </li>
                                <li><i class="glyphicon glyphicon-adjust"></i> glyphicon glyphicon-adjust</li>
                                <li><i class="glyphicon glyphicon-tint"></i> glyphicon glyphicon-tint</li>
                                <li><i class="glyphicon glyphicon-edit"></i> glyphicon glyphicon-edit</li>
                                <li><i class="glyphicon glyphicon-share"></i> glyphicon glyphicon-share</li>
                                <li><i class="glyphicon glyphicon-check"></i> glyphicon glyphicon-check</li>
                                <li><i class="glyphicon glyphicon-move"></i> glyphicon glyphicon-move</li>
                                <li><i class="glyphicon glyphicon-step-backward"></i> glyphicon
                                    glyphicon-step-backward
                                </li>
                                <li><i class="glyphicon glyphicon-fast-backward"></i> glyphicon
                                    glyphicon-fast-backward
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <ul class="the-icons">
                                <li><i class="glyphicon glyphicon-backward"></i> glyphicon glyphicon-backward</li>
                                <li><i class="glyphicon glyphicon-play"></i> glyphicon glyphicon-play</li>
                                <li><i class="glyphicon glyphicon-pause"></i> glyphicon glyphicon-pause</li>
                                <li><i class="glyphicon glyphicon-stop"></i> glyphicon glyphicon-stop</li>
                                <li><i class="glyphicon glyphicon-forward"></i> glyphicon glyphicon-forward</li>
                                <li><i class="glyphicon glyphicon-fast-forward"></i> glyphicon
                                    glyphicon-fast-forward
                                </li>
                                <li><i class="glyphicon glyphicon-step-forward"></i> glyphicon
                                    glyphicon-step-forward
                                </li>
                                <li><i class="glyphicon glyphicon-eject"></i> glyphicon glyphicon-eject</li>
                                <li><i class="glyphicon glyphicon-chevron-left"></i> glyphicon
                                    glyphicon-chevron-left
                                </li>
                                <li><i class="glyphicon glyphicon-chevron-right"></i> glyphicon
                                    glyphicon-chevron-right
                                </li>
                                <li><i class="glyphicon glyphicon-plus-sign"></i> glyphicon glyphicon-plus-sign</li>
                                <li><i class="glyphicon glyphicon-minus-sign"></i> glyphicon glyphicon-minus-sign
                                </li>
                                <li><i class="glyphicon glyphicon-remove-sign"></i> glyphicon glyphicon-remove-sign
                                </li>
                                <li><i class="glyphicon glyphicon-ok-sign"></i> glyphicon glyphicon-ok-sign</li>
                                <li><i class="glyphicon glyphicon-question-sign"></i> glyphicon
                                    glyphicon-question-sign
                                </li>
                                <li><i class="glyphicon glyphicon-info-sign"></i> glyphicon glyphicon-info-sign</li>
                                <li><i class="glyphicon glyphicon-screenshot"></i> glyphicon glyphicon-screenshot
                                </li>
                                <li><i class="glyphicon glyphicon-remove-circle"></i> glyphicon
                                    glyphicon-remove-circle
                                </li>
                                <li><i class="glyphicon glyphicon-ok-circle"></i> glyphicon glyphicon-ok-circle</li>
                                <li><i class="glyphicon glyphicon-ban-circle"></i> glyphicon glyphicon-ban-circle
                                </li>
                                <li><i class="glyphicon glyphicon-arrow-left"></i> glyphicon glyphicon-arrow-left
                                </li>
                                <li><i class="glyphicon glyphicon-arrow-right"></i> glyphicon glyphicon-arrow-right
                                </li>
                                <li><i class="glyphicon glyphicon-arrow-up"></i> glyphicon glyphicon-arrow-up</li>
                                <li><i class="glyphicon glyphicon-arrow-down"></i> glyphicon glyphicon-arrow-down
                                </li>
                                <li><i class="glyphicon glyphicon-share-alt"></i> glyphicon glyphicon-share-alt</li>
                                <li><i class="glyphicon glyphicon-resize-full"></i> glyphicon glyphicon-resize-full
                                </li>
                                <li><i class="glyphicon glyphicon-resize-small"></i> glyphicon
                                    glyphicon-resize-small
                                </li>
                                <li><i class="glyphicon glyphicon-plus"></i> glyphicon glyphicon-plus</li>
                                <li><i class="glyphicon glyphicon-minus"></i> glyphicon glyphicon-minus</li>
                                <li><i class="glyphicon glyphicon-asterisk"></i> glyphicon glyphicon-asterisk</li>
                                <li><i class="glyphicon glyphicon-exclamation-sign"></i> glyphicon
                                    glyphicon-exclamation-sign
                                </li>
                                <li><i class="glyphicon glyphicon-gift"></i> glyphicon glyphicon-gift</li>
                                <li><i class="glyphicon glyphicon-leaf"></i> glyphicon glyphicon-leaf</li>
                                <li><i class="glyphicon glyphicon-fire"></i> glyphicon glyphicon-fire</li>
                                <li><i class="glyphicon glyphicon-eye-open"></i> glyphicon glyphicon-eye-open</li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <ul class="the-icons">
                                <li><i class="glyphicon glyphicon-eye-close"></i> glyphicon glyphicon-eye-close</li>
                                <li><i class="glyphicon glyphicon-warning-sign"></i> glyphicon
                                    glyphicon-warning-sign
                                </li>
                                <li><i class="glyphicon glyphicon-plane"></i> glyphicon glyphicon-plane</li>
                                <li><i class="glyphicon glyphicon-calendar"></i> glyphicon glyphicon-calendar</li>
                                <li><i class="glyphicon glyphicon-random"></i> glyphicon glyphicon-random</li>
                                <li><i class="glyphicon glyphicon-comment"></i> glyphicon glyphicon-comment</li>
                                <li><i class="glyphicon glyphicon-magnet"></i> glyphicon glyphicon-magnet</li>
                                <li><i class="glyphicon glyphicon-chevron-up"></i> glyphicon glyphicon-chevron-up
                                </li>
                                <li><i class="glyphicon glyphicon-chevron-down"></i> glyphicon
                                    glyphicon-chevron-down
                                </li>
                                <li><i class="glyphicon glyphicon-retweet"></i> glyphicon glyphicon-retweet</li>
                                <li><i class="glyphicon glyphicon-shopping-cart"></i> glyphicon
                                    glyphicon-shopping-cart
                                </li>
                                <li><i class="glyphicon glyphicon-folder-close"></i> glyphicon
                                    glyphicon-folder-close
                                </li>
                                <li><i class="glyphicon glyphicon-folder-open"></i> glyphicon glyphicon-folder-open
                                </li>
                                <li><i class="glyphicon glyphicon-resize-vertical"></i> glyphicon
                                    glyphicon-resize-vertical
                                </li>
                                <li><i class="glyphicon glyphicon-resize-horizontal"></i> glyphicon
                                    glyphicon-resize-horizontal
                                </li>
                                <li><i class="glyphicon glyphicon-hdd"></i> glyphicon glyphicon-hdd</li>
                                <li><i class="glyphicon glyphicon-bullhorn"></i> glyphicon glyphicon-bullhorn</li>
                                <li><i class="glyphicon glyphicon-bell"></i> glyphicon glyphicon-bell</li>
                                <li><i class="glyphicon glyphicon-certificate"></i> glyphicon glyphicon-certificate
                                </li>
                                <li><i class="glyphicon glyphicon-thumbs-up"></i> glyphicon glyphicon-thumbs-up</li>
                                <li><i class="glyphicon glyphicon-thumbs-down"></i> glyphicon glyphicon-thumbs-down
                                </li>
                                <li><i class="glyphicon glyphicon-hand-right"></i> glyphicon glyphicon-hand-right
                                </li>
                                <li><i class="glyphicon glyphicon-hand-left"></i> glyphicon glyphicon-hand-left</li>
                                <li><i class="glyphicon glyphicon-hand-up"></i> glyphicon glyphicon-hand-up</li>
                                <li><i class="glyphicon glyphicon-hand-down"></i> glyphicon glyphicon-hand-down</li>
                                <li><i class="glyphicon glyphicon-circle-arrow-right"></i> glyphicon
                                    glyphicon-circle-arrow-right
                                </li>
                                <li><i class="a icon-circle-arrow-left s s"></i> glyphicon
                                    glyphicon-circle-arrow-left
                                </li>
                                <li><i class="glyphicon glyphicon-circle-arrow-up"></i> glyphicon
                                    glyphicon-circle-arrow-up
                                </li>
                                <li><i class="glyphicon glyphicon-circle-arrow-down"></i> glyphicon
                                    glyphicon-circle-arrow-down
                                </li>
                                <li><i class="glyphicon glyphicon-globe"></i> glyphicon glyphicon-globe</li>
                                <li><i class="glyphicon glyphicon-wrench"></i> glyphicon glyphicon-wrench</li>
                                <li><i class="glyphicon glyphicon-tasks"></i> glyphicon glyphicon-tasks</li>
                                <li><i class="glyphicon glyphicon-filter"></i> glyphicon glyphicon-filter</li>
                                <li><i class="glyphicon glyphicon-briefcase"></i> glyphicon glyphicon-briefcase</li>
                                <li><i class="glyphicon glyphicon-fullscreen"></i> glyphicon glyphicon-fullscreen
                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf042</i>
                            fa-adjust
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf170</i>
                            fa-adn
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf037</i>
                            fa-align-center
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf039</i>
                            fa-align-justify
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf036</i>
                            fa-align-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf038</i>
                            fa-align-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f9</i>
                            fa-ambulance
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf13d</i>
                            fa-anchor
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf17b</i>
                            fa-android
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf209</i>
                            fa-angellist
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf103</i>
                            fa-angle-double-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf100</i>
                            fa-angle-double-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf101</i>
                            fa-angle-double-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf102</i>
                            fa-angle-double-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf107</i>
                            fa-angle-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf104</i>
                            fa-angle-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf105</i>
                            fa-angle-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf106</i>
                            fa-angle-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf179</i>
                            fa-apple
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf187</i>
                            fa-archive
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1fe</i>
                            fa-area-chart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ab</i>
                            fa-arrow-circle-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a8</i>
                            fa-arrow-circle-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf01a</i>
                            fa-arrow-circle-o-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf190</i>
                            fa-arrow-circle-o-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf18e</i>
                            fa-arrow-circle-o-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf01b</i>
                            fa-arrow-circle-o-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a9</i>
                            fa-arrow-circle-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0aa</i>
                            fa-arrow-circle-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf063</i>
                            fa-arrow-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf060</i>
                            fa-arrow-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf061</i>
                            fa-arrow-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf062</i>
                            fa-arrow-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf047</i>
                            fa-arrows
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0b2</i>
                            fa-arrows-alt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf07e</i>
                            fa-arrows-h
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf07d</i>
                            fa-arrows-v
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf069</i>
                            fa-asterisk
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1fa</i>
                            fa-at
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b9</i>
                            fa-automobile
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf04a</i>
                            fa-backward
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf05e</i>
                            fa-ban
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19c</i>
                            fa-bank
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf080</i>
                            fa-bar-chart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf080</i>
                            fa-bar-chart-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf02a</i>
                            fa-barcode
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c9</i>
                            fa-bars
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0fc</i>
                            fa-beer
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b4</i>
                            fa-behance
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b5</i>
                            fa-behance-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f3</i>
                            fa-bell
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a2</i>
                            fa-bell-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f6</i>
                            fa-bell-slash
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f7</i>
                            fa-bell-slash-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf206</i>
                            fa-bicycle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e5</i>
                            fa-binoculars
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1fd</i>
                            fa-birthday-cake
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf171</i>
                            fa-bitbucket
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf172</i>
                            fa-bitbucket-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf15a</i>
                            fa-bitcoin
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf032</i>
                            fa-bold
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e7</i>
                            fa-bolt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e2</i>
                            fa-bomb
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf02d</i>
                            fa-book
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf02e</i>
                            fa-bookmark
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf097</i>
                            fa-bookmark-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0b1</i>
                            fa-briefcase
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf15a</i>
                            fa-btc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf188</i>
                            fa-bug
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ad</i>
                            fa-building
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f7</i>
                            fa-building-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a1</i>
                            fa-bullhorn
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf140</i>
                            fa-bullseye
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf207</i>
                            fa-bus
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ba</i>
                            fa-cab
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ec</i>
                            fa-calculator
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf073</i>
                            fa-calendar
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf133</i>
                            fa-calendar-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf030</i>
                            fa-camera
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf083</i>
                            fa-camera-retro
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b9</i>
                            fa-car
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d7</i>
                            fa-caret-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d9</i>
                            fa-caret-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0da</i>
                            fa-caret-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf150</i>
                            fa-caret-square-o-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf191</i>
                            fa-caret-square-o-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf152</i>
                            fa-caret-square-o-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf151</i>
                            fa-caret-square-o-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d8</i>
                            fa-caret-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf20a</i>
                            fa-cc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f3</i>
                            fa-cc-amex
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f2</i>
                            fa-cc-discover
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f1</i>
                            fa-cc-mastercard
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f4</i>
                            fa-cc-paypal
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f5</i>
                            fa-cc-stripe
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f0</i>
                            fa-cc-visa
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a3</i>
                            fa-certificate
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c1</i>
                            fa-chain
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf127</i>
                            fa-chain-broken
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00c</i>
                            fa-check
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf058</i>
                            fa-check-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf05d</i>
                            fa-check-circle-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf14a</i>
                            fa-check-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf046</i>
                            fa-check-square-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf13a</i>
                            fa-chevron-circle-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf137</i>
                            fa-chevron-circle-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf138</i>
                            fa-chevron-circle-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf139</i>
                            fa-chevron-circle-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf078</i>
                            fa-chevron-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf053</i>
                            fa-chevron-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf054</i>
                            fa-chevron-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf077</i>
                            fa-chevron-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ae</i>
                            fa-child
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf111</i>
                            fa-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf10c</i>
                            fa-circle-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ce</i>
                            fa-circle-o-notch
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1db</i>
                            fa-circle-thin
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ea</i>
                            fa-clipboard
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf017</i>
                            fa-clock-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00d</i>
                            fa-close
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c2</i>
                            fa-cloud
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ed</i>
                            fa-cloud-download
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ee</i>
                            fa-cloud-upload
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf157</i>
                            fa-cny
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf121</i>
                            fa-code
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf126</i>
                            fa-code-fork
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cb</i>
                            fa-codepen
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f4</i>
                            fa-coffee
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf013</i>
                            fa-cog
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf085</i>
                            fa-cogs
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0db</i>
                            fa-columns
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf075</i>
                            fa-comment
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e5</i>
                            fa-comment-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf086</i>
                            fa-comments
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e6</i>
                            fa-comments-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf14e</i>
                            fa-compass
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf066</i>
                            fa-compress
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c5</i>
                            fa-copy
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f9</i>
                            fa-copyright
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf09d</i>
                            fa-credit-card
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf125</i>
                            fa-crop
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf05b</i>
                            fa-crosshairs
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf13c</i>
                            fa-css3
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b2</i>
                            fa-cube
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b3</i>
                            fa-cubes
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c4</i>
                            fa-cut
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f5</i>
                            fa-cutlery
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e4</i>
                            fa-dashboard
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c0</i>
                            fa-database
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03b</i>
                            fa-dedent
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a5</i>
                            fa-delicious
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf108</i>
                            fa-desktop
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1bd</i>
                            fa-deviantart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a6</i>
                            fa-digg
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf155</i>
                            fa-dollar
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf192</i>
                            fa-dot-circle-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf019</i>
                            fa-download
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf17d</i>
                            fa-dribbble
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf16b</i>
                            fa-dropbox
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a9</i>
                            fa-drupal
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf044</i>
                            fa-edit
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf052</i>
                            fa-eject
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf141</i>
                            fa-ellipsis-h
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf142</i>
                            fa-ellipsis-v
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d1</i>
                            fa-empire
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e0</i>
                            fa-envelope
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf003</i>
                            fa-envelope-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf199</i>
                            fa-envelope-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf12d</i>
                            fa-eraser
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf153</i>
                            fa-eur
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf153</i>
                            fa-euro
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ec</i>
                            fa-exchange
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf12a</i>
                            fa-exclamation
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf06a</i>
                            fa-exclamation-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf071</i>
                            fa-exclamation-triangle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf065</i>
                            fa-expand
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf08e</i>
                            fa-external-link
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf14c</i>
                            fa-external-link-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf06e</i>
                            fa-eye
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf070</i>
                            fa-eye-slash
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1fb</i>
                            fa-eyedropper
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf09a</i>
                            fa-facebook
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf082</i>
                            fa-facebook-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf049</i>
                            fa-fast-backward
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf050</i>
                            fa-fast-forward
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ac</i>
                            fa-fax
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf182</i>
                            fa-female
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0fb</i>
                            fa-fighter-jet
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf15b</i>
                            fa-file
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c6</i>
                            fa-file-archive-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c7</i>
                            fa-file-audio-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c9</i>
                            fa-file-code-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c3</i>
                            fa-file-excel-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c5</i>
                            fa-file-image-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c8</i>
                            fa-file-movie-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf016</i>
                            fa-file-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c1</i>
                            fa-file-pdf-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c5</i>
                            fa-file-photo-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c5</i>
                            fa-file-picture-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c4</i>
                            fa-file-powerpoint-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c7</i>
                            fa-file-sound-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf15c</i>
                            fa-file-text
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f6</i>
                            fa-file-text-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c8</i>
                            fa-file-video-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c2</i>
                            fa-file-word-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1c6</i>
                            fa-file-zip-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c5</i>
                            fa-files-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf008</i>
                            fa-film
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0b0</i>
                            fa-filter
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf06d</i>
                            fa-fire
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf134</i>
                            fa-fire-extinguisher
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf024</i>
                            fa-flag
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf11e</i>
                            fa-flag-checkered
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf11d</i>
                            fa-flag-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e7</i>
                            fa-flash
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c3</i>
                            fa-flask
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf16e</i>
                            fa-flickr
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c7</i>
                            fa-floppy-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf07b</i>
                            fa-folder
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf114</i>
                            fa-folder-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf07c</i>
                            fa-folder-open
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf115</i>
                            fa-folder-open-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf031</i>
                            fa-font
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf04e</i>
                            fa-forward
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf180</i>
                            fa-foursquare
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf119</i>
                            fa-frown-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e3</i>
                            fa-futbol-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf11b</i>
                            fa-gamepad
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e3</i>
                            fa-gavel
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf154</i>
                            fa-gbp
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d1</i>
                            fa-ge
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf013</i>
                            fa-gear
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf085</i>
                            fa-gears
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf06b</i>
                            fa-gift
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d3</i>
                            fa-git
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d2</i>
                            fa-git-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf09b</i>
                            fa-github
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf113</i>
                            fa-github-alt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf092</i>
                            fa-github-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf184</i>
                            fa-gittip
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf000</i>
                            fa-glass
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ac</i>
                            fa-globe
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a0</i>
                            fa-google
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d5</i>
                            fa-google-plus
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d4</i>
                            fa-google-plus-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ee</i>
                            fa-google-wallet
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19d</i>
                            fa-graduation-cap
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c0</i>
                            fa-group
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0fd</i>
                            fa-h-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d4</i>
                            fa-hacker-news
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a7</i>
                            fa-hand-o-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a5</i>
                            fa-hand-o-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a4</i>
                            fa-hand-o-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a6</i>
                            fa-hand-o-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0a0</i>
                            fa-hdd-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1dc</i>
                            fa-header
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf025</i>
                            fa-headphones
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf004</i>
                            fa-heart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf08a</i>
                            fa-heart-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1da</i>
                            fa-history
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf015</i>
                            fa-home
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f8</i>
                            fa-hospital-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf13b</i>
                            fa-html5
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf20b</i>
                            fa-ils
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03e</i>
                            fa-image
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf01c</i>
                            fa-inbox
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03c</i>
                            fa-indent
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf129</i>
                            fa-info
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf05a</i>
                            fa-info-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf156</i>
                            fa-inr
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf16d</i>
                            fa-instagram
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19c</i>
                            fa-institution
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf208</i>
                            fa-ioxhost
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf033</i>
                            fa-italic
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1aa</i>
                            fa-joomla
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf157</i>
                            fa-jpy
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cc</i>
                            fa-jsfiddle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf084</i>
                            fa-key
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf11c</i>
                            fa-keyboard-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf159</i>
                            fa-krw
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ab</i>
                            fa-language
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf109</i>
                            fa-laptop
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf202</i>
                            fa-lastfm
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf203</i>
                            fa-lastfm-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf06c</i>
                            fa-leaf
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e3</i>
                            fa-legal
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf094</i>
                            fa-lemon-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf149</i>
                            fa-level-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf148</i>
                            fa-level-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cd</i>
                            fa-life-bouy
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cd</i>
                            fa-life-buoy
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cd</i>
                            fa-life-ring
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cd</i>
                            fa-life-saver
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0eb</i>
                            fa-lightbulb-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf201</i>
                            fa-line-chart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c1</i>
                            fa-link
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e1</i>
                            fa-linkedin
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf08c</i>
                            fa-linkedin-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf17c</i>
                            fa-linux
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03a</i>
                            fa-list
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf022</i>
                            fa-list-alt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0cb</i>
                            fa-list-ol
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ca</i>
                            fa-list-ul
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf124</i>
                            fa-location-arrow
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf023</i>
                            fa-lock
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf175</i>
                            fa-long-arrow-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf177</i>
                            fa-long-arrow-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf178</i>
                            fa-long-arrow-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf176</i>
                            fa-long-arrow-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d0</i>
                            fa-magic
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf076</i>
                            fa-magnet
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf064</i>
                            fa-mail-forward
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf112</i>
                            fa-mail-reply
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf122</i>
                            fa-mail-reply-all
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf183</i>
                            fa-male
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf041</i>
                            fa-map-marker
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf136</i>
                            fa-maxcdn
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf20c</i>
                            fa-meanpath
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0fa</i>
                            fa-medkit
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf11a</i>
                            fa-meh-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf130</i>
                            fa-microphone
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf131</i>
                            fa-microphone-slash
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf068</i>
                            fa-minus
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf056</i>
                            fa-minus-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf146</i>
                            fa-minus-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf147</i>
                            fa-minus-square-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf10b</i>
                            fa-mobile
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf10b</i>
                            fa-mobile-phone
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d6</i>
                            fa-money
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf186</i>
                            fa-moon-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19d</i>
                            fa-mortar-board
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf001</i>
                            fa-music
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c9</i>
                            fa-navicon
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ea</i>
                            fa-newspaper-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19b</i>
                            fa-openid
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03b</i>
                            fa-outdent
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf18c</i>
                            fa-pagelines
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1fc</i>
                            fa-paint-brush
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d8</i>
                            fa-paper-plane
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d9</i>
                            fa-paper-plane-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c6</i>
                            fa-paperclip
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1dd</i>
                            fa-paragraph
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ea</i>
                            fa-paste
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf04c</i>
                            fa-pause
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b0</i>
                            fa-paw
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ed</i>
                            fa-paypal
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf040</i>
                            fa-pencil
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf14b</i>
                            fa-pencil-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf044</i>
                            fa-pencil-square-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf095</i>
                            fa-phone
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf098</i>
                            fa-phone-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03e</i>
                            fa-photo
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03e</i>
                            fa-picture-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf200</i>
                            fa-pie-chart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a7</i>
                            fa-pied-piper
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a8</i>
                            fa-pied-piper-alt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d2</i>
                            fa-pinterest
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d3</i>
                            fa-pinterest-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf072</i>
                            fa-plane
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf04b</i>
                            fa-play
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf144</i>
                            fa-play-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf01d</i>
                            fa-play-circle-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e6</i>
                            fa-plug
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf067</i>
                            fa-plus
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf055</i>
                            fa-plus-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0fe</i>
                            fa-plus-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf196</i>
                            fa-plus-square-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf011</i>
                            fa-power-off
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf02f</i>
                            fa-print
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf12e</i>
                            fa-puzzle-piece
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d6</i>
                            fa-qq
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf029</i>
                            fa-qrcode
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf128</i>
                            fa-question
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf059</i>
                            fa-question-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf10d</i>
                            fa-quote-left
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf10e</i>
                            fa-quote-right
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d0</i>
                            fa-ra
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf074</i>
                            fa-random
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d0</i>
                            fa-rebel
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b8</i>
                            fa-recycle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a1</i>
                            fa-reddit
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a2</i>
                            fa-reddit-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf021</i>
                            fa-refresh
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00d</i>
                            fa-remove
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf18b</i>
                            fa-renren
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c9</i>
                            fa-reorder
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf01e</i>
                            fa-repeat
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf112</i>
                            fa-reply
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf122</i>
                            fa-reply-all
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf079</i>
                            fa-retweet
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf157</i>
                            fa-rmb
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf018</i>
                            fa-road
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf135</i>
                            fa-rocket
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e2</i>
                            fa-rotate-left
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf01e</i>
                            fa-rotate-right
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf158</i>
                            fa-rouble
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf09e</i>
                            fa-rss
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf143</i>
                            fa-rss-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf158</i>
                            fa-rub
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf158</i>
                            fa-ruble
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf156</i>
                            fa-rupee
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c7</i>
                            fa-save
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c4</i>
                            fa-scissors
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf002</i>
                            fa-search
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf010</i>
                            fa-search-minus
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00e</i>
                            fa-search-plus
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d8</i>
                            fa-send
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d9</i>
                            fa-send-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf064</i>
                            fa-share
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e0</i>
                            fa-share-alt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e1</i>
                            fa-share-alt-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf14d</i>
                            fa-share-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf045</i>
                            fa-share-square-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf20b</i>
                            fa-shekel
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf20b</i>
                            fa-sheqel
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf132</i>
                            fa-shield
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf07a</i>
                            fa-shopping-cart
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf090</i>
                            fa-sign-in
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf08b</i>
                            fa-sign-out
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf012</i>
                            fa-signal
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e8</i>
                            fa-sitemap
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf17e</i>
                            fa-skype
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf198</i>
                            fa-slack
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1de</i>
                            fa-sliders
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e7</i>
                            fa-slideshare
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf118</i>
                            fa-smile-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e3</i>
                            fa-soccer-ball-o
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0dc</i>
                            fa-sort
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf15d</i>
                            fa-sort-alpha-asc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf15e</i>
                            fa-sort-alpha-desc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf160</i>
                            fa-sort-amount-asc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf161</i>
                            fa-sort-amount-desc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0de</i>
                            fa-sort-asc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0dd</i>
                            fa-sort-desc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0dd</i>
                            fa-sort-down
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf162</i>
                            fa-sort-numeric-asc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf163</i>
                            fa-sort-numeric-desc
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0de</i>
                            fa-sort-up
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1be</i>
                            fa-soundcloud
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf197</i>
                            fa-space-shuttle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf110</i>
                            fa-spinner
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b1</i>
                            fa-spoon
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1bc</i>
                            fa-spotify
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c8</i>
                            fa-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf096</i>
                            fa-square-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf18d</i>
                            fa-stack-exchange
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf16c</i>
                            fa-stack-overflow
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf005</i>
                            fa-star
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf089</i>
                            fa-star-half
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf123</i>
                            fa-star-half-empty
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf123</i>
                            fa-star-half-full
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf123</i>
                            fa-star-half-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf006</i>
                            fa-star-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b6</i>
                            fa-steam
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1b7</i>
                            fa-steam-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf048</i>
                            fa-step-backward
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf051</i>
                            fa-step-forward
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f1</i>
                            fa-stethoscope
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf04d</i>
                            fa-stop
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0cc</i>
                            fa-strikethrough
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a4</i>
                            fa-stumbleupon
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1a3</i>
                            fa-stumbleupon-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf12c</i>
                            fa-subscript
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f2</i>
                            fa-suitcase
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf185</i>
                            fa-sun-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf12b</i>
                            fa-superscript
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1cd</i>
                            fa-support
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ce</i>
                            fa-table
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf10a</i>
                            fa-tablet
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e4</i>
                            fa-tachometer
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf02b</i>
                            fa-tag
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf02c</i>
                            fa-tags
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ae</i>
                            fa-tasks
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ba</i>
                            fa-taxi
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d5</i>
                            fa-tencent-weibo
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf120</i>
                            fa-terminal
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf034</i>
                            fa-text-height
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf035</i>
                            fa-text-width
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00a</i>
                            fa-th
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf009</i>
                            fa-th-large
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00b</i>
                            fa-th-list
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf08d</i>
                            fa-thumb-tack
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf165</i>
                            fa-thumbs-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf088</i>
                            fa-thumbs-o-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf087</i>
                            fa-thumbs-o-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf164</i>
                            fa-thumbs-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf145</i>
                            fa-ticket
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf00d</i>
                            fa-times
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf057</i>
                            fa-times-circle
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf05c</i>
                            fa-times-circle-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf043</i>
                            fa-tint
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf150</i>
                            fa-toggle-down
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf191</i>
                            fa-toggle-left
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf204</i>
                            fa-toggle-off
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf205</i>
                            fa-toggle-on
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf152</i>
                            fa-toggle-right
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf151</i>
                            fa-toggle-up
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1f8</i>
                            fa-trash
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf014</i>
                            fa-trash-o
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1bb</i>
                            fa-tree
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf181</i>
                            fa-trello
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf091</i>
                            fa-trophy
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0d1</i>
                            fa-truck
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf195</i>
                            fa-try
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e4</i>
                            fa-tty
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf173</i>
                            fa-tumblr
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf174</i>
                            fa-tumblr-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf195</i>
                            fa-turkish-lira
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e8</i>
                            fa-twitch
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf099</i>
                            fa-twitter
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf081</i>
                            fa-twitter-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e9</i>
                            fa-umbrella
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0cd</i>
                            fa-underline
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0e2</i>
                            fa-undo
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19c</i>
                            fa-university
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf127</i>
                            fa-unlink
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf09c</i>
                            fa-unlock
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf13e</i>
                            fa-unlock-alt
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0dc</i>
                            fa-unsorted
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf093</i>
                            fa-upload
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf155</i>
                            fa-usd
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf007</i>
                            fa-user
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0f0</i>
                            fa-user-md
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0c0</i>
                            fa-users
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf03d</i>
                            fa-video-camera
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf194</i>
                            fa-vimeo-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1ca</i>
                            fa-vine
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf189</i>
                            fa-vk
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf027</i>
                            fa-volume-down
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf026</i>
                            fa-volume-off
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf028</i>
                            fa-volume-up
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf071</i>
                            fa-warning
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d7</i>
                            fa-wechat
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf18a</i>
                            fa-weibo
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1d7</i>
                            fa-weixin
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf193</i>
                            fa-wheelchair
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1eb</i>
                            fa-wifi
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf17a</i>
                            fa-windows
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf159</i>
                            fa-won
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19a</i>
                            fa-wordpress
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf0ad</i>
                            fa-wrench
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf168</i>
                            fa-xing
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf169</i>
                            fa-xing-square
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf19e</i>
                            fa-yahoo
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf1e9</i>
                            fa-yelp
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf157</i>
                            fa-yen
                            <span class="text-muted">(alias)</span>
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf167</i>
                            fa-youtube
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf16a</i>
                            fa-youtube-play
                        </div>

                        <div class="col-md-3 col-sm-6 col-lg-3">
                            <i class="fa fa-fw">&#xf166</i>
                            fa-youtube-square
                        </div>

                    </div>
                </section>

            </div>
        </div>
    </div>
    <!--/span-->

</div>
<!--/row-->

<jsp:include page="../externalJS.jsp" flush="true"/>
</body>
</html>
