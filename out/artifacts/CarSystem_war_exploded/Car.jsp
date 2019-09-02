
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
    <title>这是车辆管理的界面</title>
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
<script type="text/javascript">
    function del(id) {
        console.log(id.id);
        var newId =id.id;//取出html对象中的id
         alert("进入了"+newId);

        $.post("delcarServlet",{"delid":newId},function (delresult) {

            if(delresult.delresult>0){
                $("#"+newId).remove();
            }else {

            }
        },"json")

    }
</script>
<script type="text/javascript">
    function updatejump(id) {
        $("#tanchubutton").attr("onclick","updateimpl()");
        update(id);
    }
    function update(id) {

        //var newId=id.id;
        var trlist = $("tr");
        var trcur = trlist.eq(id+2);
        var Carbrandkey =trcur.children().eq(1).children().children().html();//汽车编号名称
        var Carbrandname =trcur.children().eq(2).html();//汽车品牌名称
        var Carname =trcur.children().eq(3).html();//车辆名称
        var Caridcard =trcur.children().eq(4).html();//车辆牌照
        $("#changeCarbrandkey").val(""+Carbrandkey);
        $("#changeCarbrandname").val(""+Carbrandname);
        $("#changeCarbrandaddress").val(""+Carname);
        $("#changeCaridcard").val(""+Caridcard);


        layer.open({
            type: 1,
            area : ['800px' , '500px'],
            title: '修改用户',
            shadeClose: false,
            maxmin: true,
            content: $('#flag'),
            cancel:function () {
                $("#flag")[0].style.display = 'none';
                $("#changeCarbrandkey").val("");
                $("#changeCarbrandname").val("");
                $("#changeCarbrandaddress").val("");
                $("#changeCaridcard").val("");
                $("#tishi").html("");
            }
        });

    }
    function updateimpl() {
        var Carbrandkey=$("#changeCarbrandkey").val();
        var Carbrandname=$("#changeCarbrandname").val();
        var Carnames=$("#changeCarbrandaddress").val();
        var Caridcard=$("#changeCaridcard").val();
        $.post("updateCarinfServlet",{"Carbrandkey":Carbrandkey,"Carbrandname":Carbrandname,"Carname":Carnames,"Caridcard":Caridcard},function (updateresult) {
            alert(updateresult.updatecarbrandresult);
            if(updateresult.updatecarbrandresult==3){
                $("#tishi").html("修改失败，不存在该品牌");
            }
            if(updateresult.updatecarbrandresult==1){

                $("#"+Carbrandkey).find("td").eq(1).html(""+Carbrandkey+"");//设置新的品牌id 但是不可修改
                $("#"+Carbrandkey).find("td").eq(2).html(""+Carbrandname+"");//设置新的平拍民
                $("#"+Carbrandkey).find("td").eq(3).html(""+Carnames+"");//设置新的产地
                $("#"+Carbrandkey).find("td").eq(4).html(""+Caridcard+"");//设置新的产地
                $("#tishi").html("修改成功点击右上角退出");

            }
        },"json")

    }
</script>
<script type="text/javascript">
    function addjump() {
        $("#tanchubutton").attr("onclick","adduserimpl()");
        $("#changeCarbrandkey").blur(function () {
            var Carbrandkey=$("#changeCarbrandkey").val();

            $.post("CarnamekeyServlet",{"Carnamekey":Carbrandkey},function (Carbrandkeyresult) {
                if(Carbrandkeyresult.checkresult==0){
                    $("#tishikuang").html("用户名可以使用");
                }
                if(Carbrandkeyresult.checkresult>0){
                    $("#tishikuang").html("你不可以使用");
                }
            },"json")
        });
        adduser();

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
        var Carbrandkey=$("#changeCarbrandkey").val();
        var Carbrandname=$("#changeCarbrandname").val();
        var Carnames=$("#changeCarbrandaddress").val();
        var Caridcard=$("#changeCaridcard").val();
        var trlist = $("tr");
        var newlistsize=trlist.size()-2;
        alert("新的为"+newlistsize);
        $.post("addCarinfServlet",{"Carbrandkey":Carbrandkey,"Carbrandname":Carbrandname,"Carname":Carnames,"Caridcard":Caridcard},function (addcarresult) {
            alert(addcarresult.addresult);
            if(addcarresult.addresult==3){
                $("#tishi").html("添加，不存在该品牌");

            }
            if(addcarresult.addresult==1) {
                window.location.href="showcarinfServlet";
            }

        },"json")
    }
</script>
<script type="text/javascript">
    function selectbymohu() {
        var carnumber = $("#selectcarnumber").val();
        var carbrandname = $("#selectcarbrandname").val();
        var carname = $("#selectcarname").val();
        var caridcard = $("#selectcaridcard").val();
        var carstatue = $("#selectcarstatue").val();
        window.location.href="showcarinfServlet?carnumber="+carnumber+"&carbrandname="+carbrandname+"&carname="+carname+"&caridcard="+caridcard+"&carstatue="+carstatue+"";
    }
</script>
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
        <h1>车辆信息</h1>

    </div>
    <div class="container-fluid">
        <hr>
        <div class="widget-box">
            <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
                <h5>汽车品牌管理</h5>
                <h5 ><a class="icon-plus" onclick="addjump()"></a></h5>
                <span class="label label-info"></span> </div>


            <div class="widget-content ">

                <table class="table table-bordered table-striped with-check"  id="showtable">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"  /></th>
                        <th>车辆编号</th>
                        <th>车辆品牌</th>
                        <th>车辆名称</th>
                        <th>车辆牌照</th>
                        <th>车辆照片</th>
                        <th>车辆状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>查询</td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的车辆编号" id="selectcarnumber" name="showucarnumber" value=""></td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的车辆品牌" id="selectcarbrandname" name="showcarbrandname" value=""></td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的车辆名称" id="selectcarname" name="showcarname" value=""></td>
                        <td><input type="text" class="span3 m-wrap" placeholder="请输入要查询的车辆牌照" id="selectcaridcard" name="showcaridcard" value=""></td>
                        <td></td>
                        <td>
                            <select id="selectcarstatue">
                                <option style="display: none" value=""></option>
                                <option value="1">未出租</option>
                                <option value="2">已出租</option>
                                <option value="3">正在检修</option>
                                <option value="4">已出售</option>
                            </select>
                            </td>

                        <td><input type="button" class="btn btn-info" value="查询" onclick="selectbymohu()"></td>
                    </tr>



                    <c:forEach items="${carlist}" var="carlist" varStatus="str">


                        <tr id="${carlist.Carnumber}">
                            <td>1</td>
                            <td><a href="CardetailedinfServlet?carid=${carlist.Carnumber}"><font color="blue">${carlist.Carnumber}</font></a></td>

                            <td>${carlist.Carbrand}</td>
                            <td>${carlist.Carname}</td>
                            <td>${carlist.Caridcard}</td>
                            <td><img src="${carlist.Carpage}" width="600px" height="390px"></td>
                            <td>
                                <c:if test="${carlist.Carstatue==1}">
                                    未租出
                                </c:if>
                                <c:if test="${carlist.Carstatue==2}">
                                    已租出
                                </c:if>
                                <c:if test="${carlist.Carstatue==3}">
                                    检修
                                </c:if>
                                    </td>
                            <td>
                                <form  action="CarpageServlet"  method="post" enctype="multipart/form-data">
                                <a href="#" onclick="del(${carlist.Carnumber})"><font color="blue">删除</font></a>
                                <a href="#" onclick="updatejump(${str.index})"><font color="blue">修改</font></a>
                                <input type="text" name="carpagename" value="${carlist.Carnumber}" style="display:none">
                                 <input type="file" value="上传文件" name="carpage">
                                <input type="submit" value="确认上传">
                                </form>
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
                                    <label class="control-label">车辆名称</label>
                                    <div class="controls">
                                        <input type="text" class="span11"  value="" id="changeCarbrandaddress" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">牌照</label>
                                    <div class="controls">
                                        <input type="text" class="span11"  value="" id="changeCaridcard" />
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

