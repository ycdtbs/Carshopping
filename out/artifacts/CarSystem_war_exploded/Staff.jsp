
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
            // alert("进入了"+id);

            $.post("delServletServlet",{"delid":newId},function (delresult) {

            if(delresult.delresult>0){
                $("#"+newId).remove();
            }else {

            }
            },"json")

        }
    </script>
    <script type="text/javascript">
        function blur() {
            alert("123");
        }
        function updatejump(id) {
            $("#tanchubutton").attr("onclick","updateimpl()");
            update(id);
        }
        function addjump() {
            $("#tanchubutton").attr("onclick","adduserimpl()");
            $("#changeusernumber").blur(function () {
                var username=$("#changeusernumber").val();

                $.post("usernameServlet",{"username":username},function (updateresult) {
                if(updateresult.checkusername==0){
                    $("#tishikuang").html("用户名可以使用");
                }
                if(updateresult.checkusername==1){
                    $("#tishikuang").html("你不可以使用");
                    }
                },"json")
            });
            adduser();

        }
    </script>
    <script type="text/javascript">
    function update(id) {

        //var newId=id.id;
        var trlist = $("tr");
        var trcur = trlist.eq(id+2);
        var Usernumber =trcur.children().eq(1).html();//用户id
        var Username =trcur.children().eq(2).html();//用户名字
        var Usersex =trcur.children().eq(3).html();//用户性别
        var Usertel =trcur.children().eq(4).html();//用户电话
        var UserRoly =trcur.children().eq(5).html().toString();//用户职位
        var Useraddress =trcur.children().eq(6).html();//用户住址
        UserRoly = UserRoly.replace(/\s*/g,"");
        $("#changeusernumber").val(""+Usernumber);
        $("#changeusername").val(""+Username);
        $("#changeusersex").val(""+Usersex);
        $("#changeusetel").val(""+Usertel);
        $("#changeuserroly").val(""+UserRoly);
        $("#changeuseraddress").val(""+Useraddress);

        layer.open({
            type: 1,
            area : ['800px' , '600px'],
            title: '修改用户',
            shadeClose: false,
            maxmin: true,
            content: $('#flag'),
            cancel:function () {
                $("#flag")[0].style.display = 'none';
                $("#changeusernumber").val("");
                $("#changeusername").val("");
                $("#changeusersex").val("");
                $("#changeusetel").val("");
                $("#changeuserroly").val("");
                $("#changeuseraddress").val("");
            }
        });

    }
    function updateimpl() {
        var usernumber=$("#changeusernumber").val();
        var username=$("#changeusername").val();
        var usersex=$("#changeusersex").val();
        var usertel=$("#changeusetel").val();
        var userroly=$('input[name="changeuserroly"]:checked').val();
        var useraddress=$("#changeuseraddress").val();
        $.post("updateServlet",{"usernumber":usernumber,"username":username,"usersex":usersex,"usertel":usertel,"userroly":userroly,"useraddress":useraddress},function (updateresult) {
            if(updateresult.updateresult>0){

                if(userroly=2){
                    userroly="销售";
                }else {
                    userroly="主管";
                }
                $("#"+usernumber).find("td").eq(2).html(""+username+"");//设置新的username
                $("#"+usernumber).find("td").eq(3).html(""+usersex+"");//设置新的usersex
                $("#"+usernumber).find("td").eq(4).html(""+usertel+"");//设置新的usertel
                $("#"+usernumber).find("td").eq(5).html(""+userroly+"");//设置新的userroly
                $("#"+usernumber).find("td").eq(6).html(""+useraddress+"");//设置新的useraddress
                $("#tishi").html("修改成功点击右上角退出");

            }
        },"json")

    }
    function adduser() {
        layer.open({
            type: 1,
            area : ['1000px' , '600px'],
            title: '添加用户',
            shadeClose: false,
            maxmin: true,
            content: $('#flag'),
            cancel:function () {
                $("#flag")[0].style.display = 'none';
                $("#tishikuang").html("");
                $("#changeusernumber").attr("onblur","");
            }
        });

    }
    function adduserimpl() {
        var usernumber = $("#changeusernumber").val();
        var username = $("#changeusername").val();
        var usersex = $("#changeusersex").val();
        var usertel = $("#changeusetel").val();
        var userroly=$('input[name="changeuserroly"]:checked').val();
        var trlist = $("tr");
        var newlistsize=trlist.size()-2;
        alert("新的为"+newlistsize);

        var useraddress = $("#changeuseraddress").val();
        $.post("adduserServlet",{"usernumber":usernumber,"username":username,"usersex":usersex,"usertel":usertel,"userroly":userroly,"useraddress":useraddress},function (adduserresult) {
            alert("追加");
            if(userroly=2){
                userroly="销售";
            }else {
                userroly="主管";
            }
            $("#showtable").append("<tr id=\""+usernumber+"\">\n" +
                "\n" +
                "                                    <td>1</td>\n" +
                "                                    <td>"+usernumber+"</td>\n" +
                "                                    <td>"+username+"</td>\n" +
                "                                    <td>"+usersex+"</td>\n" +
                "                                    <td>"+usertel+"</td>\n" +
                "                                    <td>"+userroly+"</td>\n" +
                "                                    <td>"+useraddress+"</td>\n" +
                "\n" +
                "                                    <td>\n" +
                "\n" +
                "                                        <a href=\"#\" onclick=\"del("+usernumber+")\"><font color=\"blue\">删除</font></a>\n" +
                "                                        <a href=\"#\" onclick=\"updatejump("+newlistsize+")\"><font color=\"blue\">修改</font></a>\n" +
                "\n" +
                "                                </td>\n" +
                "                                </tr>")
        },"json")
    }
    function selectbymohu() {
        var username = $("#selectusername").val();
        var usernumber=$("#selectusernumber").val();
        var usersex=$("#selectsex").select().val();
        var userroly=$("#selectroly").select().val()
        var usertel = $("#selectusertel").val();
        var useraddress=$("#selectaddress").val();
        window.location.href="ShowServlet?username="+username+"&usernumber="+usernumber+"&usersex="+usersex+"&userroly="+userroly+"&usertel="+usertel+"&useraddress="+useraddress+"";

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
        <li><a href="showcarinfServlet"><i class="icon icon-tint"></i> <span>车辆信息查询</span></a></li>
        <li><a href="showcustomerServlet"><i class="icon icon-pencil"></i> <span>顾客信息管理</span></a></li>
        <li><a href="tongjiServlet"><i class="icon icon-pencil"></i> <span>统计信息</span></a></li>

    </ul>
</div>
<!--sidebar-menu-->
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">员工信息</a> </div>
        <h1>员工信息</h1>

    </div>
    <div class="container-fluid">
        <hr>
            <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
                        <h5>员工信息</h5>
                        <h5 ><a class="icon-plus" onclick="addjump()"></a></h5>
                        <span class="label label-info"></span> </div>


                    <div class="widget-content ">
                        <table class="table table-bordered table-striped with-check"  id="showtable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"  /></th>
                                <th>员工工号</th>
                                <th>员工姓名</th>
                                <th>员工性别</th>
                                <th>员工联系方式</th>
                                <th>员工职位</th>
                                <th>员工地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td>查询</td>
                                <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的员工号" id="selectusernumber" name="showusernumber" value=""></td>
                                <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的员工姓名" id="selectusername" name="showusername" value=""></td>
                                <td>
                                    <select id="selectsex">
                                        <option style="display: none" value=""></option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </td>
                                <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的员工手机号" id="selectusertel" name="userselect" value=""></td>
                                <td>
                                    <select id="selectroly" name="showroly">
                                        <option style="display: none" value=""></option>
                                        <option value="2">销售</option>
                                        <option value="3">主管</option>
                                    </select>
                                </td>
                                <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的员工地址" id="selectaddress" value=""></td>
                                <td><input type="button" class="btn btn-info" value="查询" onclick="selectbymohu()"></td>
                            </tr>


                            <c:forEach items="${userlist}" var="user" varStatus="str">


                                <tr id="${user.Usernumber}">

                                    <td>1</td>
                                    <td>${user.Usernumber}</td>
                                    <td>${user.Username}</td>
                                    <td>${user.Usersex}</td>
                                    <td>${user.Usertel}</td>
                                    <td>

                                        <c:if test="${(user.UserRoly)==2}">
                                            销售
                                        </c:if>
                                        <c:if test="${(user.UserRoly)==3}">
                                            主管
                                        </c:if>
                                    </td>
                                    <td>${user.Useraddress}</td>

                                    <td>

                                        <a href="#" onclick="del(${user.Usernumber.toString()})"><font color="blue">删除</font></a>
                                        <a href="#" onclick="updatejump(${str.index})"><font color="blue">修改</font></a>

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

