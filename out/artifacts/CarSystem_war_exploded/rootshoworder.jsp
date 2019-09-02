
<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/14
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title>这是订单展示界面</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/uniform.css" />
    <link rel="stylesheet" href="css/select2.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>

</head>

<body>

<!--Header-part-->
<div id="header">
    <h1><a href="dashboard.html">MatAdmin</a></h1>
</div>
<!--close-Header-part-->
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">
        <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎${sessionScope.realname}</span><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="#"><i class="icon-user"></i> 我的资料</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="icon-check"></i> 我的任务</a></li>
                <li class="divider"></li>
                <li><a href="login.html"><i class="icon-key"></i> 退出</a></li>
            </ul>
        </li>
        <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> 新消息</a></li>
                <li class="divider"></li>
                <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> 收件箱</a></li>
                <li class="divider"></li>
                <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> 发件箱</a></li>
                <li class="divider"></li>
                <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> 发送</a></li>
            </ul>
        </li>
        <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
        <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a></li>
    </ul>
</div>
<script type="text/javascript">
    function showinf(id) {
        var id=$("#"+id).html();
        window.location.href="rootshoworderinfServlet?id="+id+"";

    }
    function selectbymohu() {
        var id=$("#orderid").val();
        var ordertime=$("#ordertime").val();
        var statement=$("#statement").val();
        window.location.href="rootshoworderServlet?id="+id+"&ordertime="+ordertime+"&statement="+statement+"";
    }
</script>

<!--start-top-serch-->
<div id="search">
    <input type="text" placeholder="输入搜索内容..."/>
    <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch-->

<!--sidebar-menu-->

<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-th"></i></a>
    <ul>

        <li class="active"><a href="ShowServlet"><i class="icon icon-th"></i> <span>员工管理</span></a></li>
        <li><a href="showCarbrandServlet"><i class="icon icon-th"></i> <span>汽车品牌管理</span></a></li>
        <li><a href="showcarinfServlet"><i class="icon icon-tint"></i> <span>车辆信息查询</span></a></li>
        <li><a href="showcustomerServlet"><i class="icon icon-pencil"></i> <span>顾客信息管理</span></a></li>
        <li><a href="rootshoworderServlet"><i class="icon icon-pencil"></i> <span>订单信息管理</span></a></li>
        <li><a href="tongjiServlet"><i class="icon icon-pencil"></i> <span>统计信息</span></a></li>

    </ul>
</div>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">员工信息</a> </div>
        <h1>品牌信息</h1>

    </div>
    <div class="container-fluid">
        <hr>
        <div class="widget-box">
            <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
                <h5>订单信息查看</h5>
                <h5 ><a class="icon-plus" onclick="addjump()"></a></h5>
                <span class="label label-info"></span> </div>


            <div class="widget-content ">
                <table class="table table-bordered table-striped with-check"  id="showtable">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"  /></th>
                        <th>订单编号</th>
                        <th>订单创建日期</th>
                        <th>订单状态</th>

                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>查询</td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的订单编号" id="orderid" name="showusernumber" value=""></td>
                        <td><input type="date" class="span3 m-wrap" placeholder="请输入要查询的订单创建日期" id="ordertime" name="showusername" value=""></td>
                        <td>
                            <select id="statement">
                                <option value="" style="display: none"></option>
                                <option value="1">正在租赁</option>
                                <option value="2">已归还</option>
                                <option value="3">正在维修</option>
                            </select>
                        </td>
                        <td><input type="button" class="btn btn-info" value="查询" onclick="selectbymohu()"></td>
                    </tr>


                    <c:forEach items="${orderlist}" var="orderrlist" varStatus="str">


                        <tr>

                            <td>1</td>
                            <td id="${orderrlist.Ordernumber}">${orderrlist.Ordernumber}</td>
                            <td>${orderrlist.Ordertime}</td>
                            <td>
                                <c:if test="${orderrlist.Orderstatus==1}">
                                    <font color="red">正在租赁</font>
                                </c:if>
                                <c:if test="${orderrlist.Orderstatus==2}">
                                    <font color="green">已归还</font>
                                </c:if>
                                <c:if test="${orderrlist.Orderstatus==3}">
                                    <font color="#1e90ff">车辆检修</font>
                                </c:if>

                            </td>
                            <td>

                                <a href="#" onclick="showinf(${orderrlist.Ordernumber})"><font color="blue">查看订单详细信息</font></a>


                            </td>

                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

        <!--Footer-part-->
        <%--        以下是弹出框框--%>
        <div id="flag" style="display: none;">
            <div class="row-fluid" align="center" >
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                            <h5>修改信息</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <form action="#" method="get" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label">编号</label>
                                    <div class="controls">
                                        <input type="text" class="span11"  value="" id="changeCarbrandkey" /><font id="tishikuang" color="red"></font>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">汽车品牌名称</label>
                                    <div class="controls">
                                        <input type="text" class="span11"   id="changeCarbrandname" value="" onblur=""/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">产地</label>
                                    <div class="controls">
                                        <input type="text" class="span11"  value="" id="changeCarbrandaddress" />
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success" onclick="" id="tanchubutton">确认修改</button><font id="tishi" color="green"></font>
                                </div>
                            </form>
                        </div>

                        <!--end-Footer-part-->
                        <!--以下是添加弹窗-->


                        <script src="js/jquery.min.js"></script>
                        <script src="js/jquery.ui.custom.js"></script>
                        <script src="js/bootstrap.min.js"></script>
                        <script src="js/jquery.uniform.js"></script>
                        <script src="js/select2.min.js"></script>
                        <script src="js/jquery.dataTables.min.js"></script>
                        <script src="js/matrix.js"></script>
                        <script src="js/matrix.tables.js"></script>
                        <script src="js/jquery.min.js"></script>
                        <script src="js/jquery.ui.custom.js"></script>
                        <script src="js/bootstrap.min.js"></script>
                        <script src="js/bootstrap-colorpicker.js"></script>
                        <script src="js/bootstrap-datepicker.js"></script>
                        <script src="js/jquery.toggle.buttons.html"></script>
                        <script src="js/masked.js"></script>
                        <script src="js/jquery.uniform.js"></script>
                        <script src="js/select2.min.js"></script>
                        <script src="js/matrix.js"></script>
                        <script src="js/matrix.form_common.js"></script>
                        <script src="js/wysihtml5-0.3.0.js"></script>
                        <script src="js/jquery.peity.min.js"></script>
                        <script src="js/bootstrap-wysihtml5.js"></script>
                        <script>
                            $('.textarea_editor').wysihtml5();
                        </script>
</body>
</html>

