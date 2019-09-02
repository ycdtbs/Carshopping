
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
    <title>这是员工管理的界面</title>
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
    <script type="text/javascript">
    function del(id) {
        console.log(id.id);
        var newId =id.id;//取出html对象中的id
        alert("进入了"+newId);

        $.post("delcustomerServlet",{"delid":newId},function (delresult) {

            if(delresult.delresult>0){
                $("#"+newId).remove();
            }
        },"json")

    }
</script>
    <script type="text/javascript">
        function black(id) {
            var newId =id.id;
            $.post("delcustomerServlet",{"delid":newId,"flag":"black"},function (delresult) {
                if(delresult.delresult>0){
                    alert("成功加入黑名单");
                    $("#"+newId).remove();
                }
            },"json")
        }
        function removeblack(id) {
            var newId =id.id;
            $.post("delcustomerServlet",{"delid":newId,"flag":"removeblack"},function (delresult) {
                if(delresult.delresult>0){

                    alert("成功移除黑名单");
                    $("#"+newId).remove();
                }
            },"json")
        }
    </script>
    <script type="text/javascript">
        function rebuildpassword(id) {

            var newId =id.id;
            $.post("delcustomerServlet",{"delid":newId,"flag":"repwd"},function (delresult) {
                if(delresult.delresult>0){
                    alert("成功重置密码");
                }
            },"json")
        }
    </script>
    <script type="text/javascript">

        function selectbymohu() {
            var customername = $("#selectcustomername").val();
            var customeridcard = $("#selectcustomeridcard").val();
            var customerrtel = $("#selectcustomerrtel").val();
            var email = $("#selectemail").val();
            window.location.href="showcustomerServlet?customername="+customername+"&customeridcard="+customeridcard+"&customerrtel="+customerrtel+"&email="+email+"";


        }
        function selectblack() {
            var customername = $("#selectcustomername").val();
            var customeridcard = $("#selectcustomeridcard").val();
            var customerrtel = $("#selectcustomerrtel").val();
            var email = $("#selectemail").val();
            window.location.href="showcustomerServlet?customername="+customername+"&customeridcard="+customeridcard+"&customerrtel="+customerrtel+"&email="+email+"&flag=black";


        }

    </script>


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

<!--start-top-serch-->
<div id="search">
    <input type="text" placeholder="输入搜索内容..."/>
    <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch-->

<!--sidebar-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 控制台</a>
    <ul>
        <li><a href="ShowServlet"><i class="icon icon-th"></i> <span>员工管理</span></a></li>
        <li><a href="showCarbrandServlet"><i class="icon icon-th"></i> <span>汽车品牌管理</span></a></li>
        <li><a href="showcarinfServlet"><i class="icon icon-tint"></i> <span>车辆信息管理</span></a></li>
        <li><a href="showcustomerServlet"><i class="icon icon-pencil"></i> <span>顾客信息管理</span></a></li>
        <li><a href="rootshoworderServlet"><i class="icon icon-pencil"></i> <span>订单信息管理</span></a></li>
        <li><a href="tongjiServlet"><i class="icon icon-pencil"></i> <span>统计信息</span></a></li>

    </ul>
</div>
<!--sidebar-menu-->
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">员工信息</a> </div>
        <h1>顾客信息</h1>

    </div>
    <div class="container-fluid">
        <hr>
        <div class="widget-box">
            <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
                <h5>顾客信息</h5>
                <h5 ><a class="icon-plus" onclick="addjump()"></a></h5>
                <span class="label label-info"></span> </div>


            <div class="widget-content ">
                <table class="table table-bordered table-striped with-check"  id="showtable">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"  /></th>
                        <th>顾客姓名</th>
                        <th>顾客身份证号</th>
                        <th>顾客手机号</th>
                        <th>顾客邮箱</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>查询</td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的顾客姓名" id="selectcustomername" name="showusernumber" value=""></td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的顾客身份证号" id="selectcustomeridcard" name="showusername" value=""></td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的顾客手机号" id="selectcustomerrtel" name="userselect" value=""></td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的顾客邮箱" id="selectemail" value=""></td>
                        <td><input type="button" class="btn btn-info" value="查询" onclick="selectbymohu()">
                        <input type="button" class="btn btn-info" value="查询黑名单" onclick="selectblack()"></td>
                    </tr>


                    <c:forEach items="${customerlist}" var="customer" varStatus="str">


                        <tr id="customer${customer.Customeridcardnumber}">

                            <td>1</td>
                            <td>${customer.Customerrealname}</td>
                            <td>${customer.Customeridcardnumber}</td>
                            <td>${customer.Customertel}</td>
                            <td>${customer.Customeremail}</td>

                            <td>

                                <a href="#" onclick="del(customer${customer.Customeridcardnumber})"><font color="blue">删除</font></a>
                                <a href="#" onclick="black(customer${customer.Customeridcardnumber})"><font color="blue">加入黑名单</font></a>
                                <a href="#" onclick="removeblack(customer${customer.Customeridcardnumber})"><font color="blue">移除黑名单</font></a>
                                <a href="#" onclick="rebuildpassword(customer${customer.Customeridcardnumber})"><font color="blue">重置密码</font></a>

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
                                    <label class="control-label">员工工号为</label>
                                    <div class="controls">
                                        <input type="text" class="span11"   id="changeusernumber" value="" onblur=""/><font id="tishikuang" color="red"></font>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">员工姓名为 :</label>
                                    <div class="controls">
                                        <input type="text" class="span11"  value="" id="changeusername" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">员工性别为</label>
                                    <div class="controls">
                                        <input type="text"  class="span11"  value="" id="changeusersex"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">员工联系方式为</label>
                                    <div class="controls">
                                        <input type="text" class="span11" value=""  id="changeusetel"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">员工职位为</label>
                                    <div class="controls">
                                        <input type="radio" class="span11" value="2"  name="changeuserroly" checked="checked"/>销售
                                        <input type="radio" class="span11" value="3"  name="changeuserroly"/>主管
                                        <span class="help-block"></span> </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">员工地址</label>
                                    <div class="controls">
                                        <input type="text" class="span11" value="" id="changeuseraddress" />
                                        <span class="help-block"></span> </div>
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

