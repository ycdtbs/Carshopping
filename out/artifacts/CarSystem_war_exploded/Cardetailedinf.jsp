<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/24
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>插件页面_漂亮的响应式Bootstrap后台管理系统模板MatAdmin - JS代码网</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
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
        <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎Admin</span><b class="caret"></b></a>
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
<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-th"></i></a>
    <ul>

        <li class="active"><a href="ShowServlet"><i class="icon icon-th"></i> <span>员工管理</span></a></li>
        <li><a href="showCarbrandServlet"><i class="icon icon-th"></i> <span>汽车品牌管理</span></a></li>
        <li><a href="showcarinfServlet"><i class="icon icon-tint"></i> <span>车辆信息查询</span></a></li>
        <li><a href="showcustomerServlet"><i class="icon icon-pencil"></i> <span>顾客信息管理</span></a></li>


    </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Widgets</a> </div>
        <h1>车辆详细信息</h1>
    </div>
    <div class="container-fluid" align="center">
        <hr>

        <c:forEach items="${carlist}" var="carlist" varStatus="str">
            <img src="${carlist.Carpage}" width="1000px" height="900px">

            <form action="updatecarmoneyServlet" method="post" enctype="">
            <table width="1000" border="0" cellspacing="5px" >
                <tbody>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">车辆名称</font></td>
                    <td >${carlist.Carname}</td>
                </tr>
                <hr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">车牌号</font></td>
                    <td>${carlist.Caridcard}</td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">品牌</font></td>
                    <td>${carlist.Carbrand}</td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">价格</font></td>
                    <td>
                        ${carlist.money}元/天
                        <input type="text" placeholder="请输入价格" value="${carlist.money}" name="money">
                    </td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">颜色</font></td>
                    <td>${color}<input type="text" value="${color}" name="color"></td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">载客人数</font></td>
                    <td>${zaikerenshu}<input type="text" value="${zaikerenshu}" placeholder="" name="zaikerenshu"></td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">百公里油耗</font></td>
                    <td>${baigongliyouhao}<input type="text" value="${baigongliyouhao}" name="baigongliyouhao"></td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">排量</font></td>
                    <td>${pailiang}<input type="text" value="${pailiang}" name="pailiang"></td>
                </tr>
                <tr>
                    <td height="100px"><font size="20" color="#1e90ff">是否购置保险</font></td>
                    <td>${baoxian}<input type="text" value="${baoxian}" name="baoxian"></td>

                </tr>
                </tbody>
            </table>


            <div>
                <input type="text" style="display: none" value="${carlist.Carnumber}" name="carid">
<%--                这里有个name未text的东西被我删了23 --%>
                <input type="submit" value="提交" class="btn" size="1100px">
            </div>
            </form>
        <hr>
        </c:forEach>


        </div>
    </div>
</div>
<!--main-container-part-->

<!--Footer-part-->
<div class="row-fluid">
    <div id="footer" class="span12"> 2013 &copy; MatAdmin </div>
</div>
<!--end-Footer-part-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/matrix.js"></script>
</body>
</html>
