<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/30
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/28
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>

    <title>Criuses</title>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <script src="js/jquery.min.js">

    </script>
    <!---smoth-scrlling---->
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('a[href^="#"]').on('click',function (e) {
                e.preventDefault();
                var target = this.hash,
                    $target = $(target);
                $('html, body').stop().animate({
                    'scrollTop': $target.offset().top
                }, 1000, 'swing', function () {
                    window.location.hash = target;
                });
            });
        });
    </script>
    <script type="text/javascript">
        var $1 = $(function(){
            var a=$("#customername").val().toString();

            if(a==null||a==""){
                window.location.href="shoppage.jsp"
            }
        });
    </script>
    <!---//smoth-scrlling---->
    <!----start-top-nav-script---->
    <script type="text/javascript" src="js/flexy-menu.js"></script>
    <script type="text/javascript">$(document).ready(function(){$(".flexy-menu").flexymenu({speed: 400,type: "horizontal",align: "right"});});</script>
    <!----//End-top-nav-script---->
    <!---webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!---webfonts---->
    <!---calender-style---->
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <!---//calender-style---->
    <!---images-hover-effects--->
    <link rel="stylesheet" href="css/zalki_hover_img.css" type="text/css" media="screen">
    <script src="js/jquery.zalki_hover_img.min-0.2.js" type="text/javascript"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript">
        $(window).load(function(){
            $('.main_box').ZalkiHoverImg(
            );
        });
    </script>
    <!---//images-hover-effects--->
    <script type="text/javascript">
        function send(){
            layer.open({
                type: 1,
                area : ['1000px' , '1000px'],
                title: '填写订单信息',
                shadeClose: true,
                maxmin: true,
                content: $('#send'),
                cancel:function () {
                    $("#paypic").css('dispaly','none');//表示设置为禁用
                }
            });
        }

    </script>
    <script type="text/javascript">
        function money() {
            $("#paypic").css('dispaly','none');
            var money=$("#money").html();
            var starttime = $("#starttime").val();
            var endtime=$("#endtime").val();
            var day1 = new Date(starttime);
            var day2 = new Date(endtime);
            var daynumber=(day2 - day1) / (1000 * 60 * 60 * 24);
            var allmoney=daynumber*money;
            var yajin=allmoney*1.5;
            $("#yajing").html(""+yajin+"");
            $("#showmoney").html(""+allmoney+"");
        }
        function pay() {

            $("#paypic").css('display','block');//表示设置为可用


        }

    </script>
    <script type="text/javascript">
        function backcar(id,price,yanjin) {
            var year=new Date().getFullYear();
            var mouth=new Date().getMonth()+1;
           var date=new Date().getDate();
           var jiechetime=$("#hc"+id).html();
            var time=year+"-"+mouth+"-"+date;
            var day1 = new Date(jiechetime);
            var day2 = new Date(time);
            var daynumber=(day2 - day1) / (1000 * 60 * 60 * 24);//租车天数
            var actuallyday = Math.ceil(daynumber);
            var paymoney=price*actuallyday;
            if(yanjin>paymoney){
                var money=yanjin-paymoney;
                $("#tuiqian").html("需要退给您"+money+"");
            }else {
                var money=paymoney-yanjin;
                $("#tuiqian").html("需您补交"+money+"");
            }
            $("#orderid").html(""+id+"");
            $("#yajin").html(""+yanjin+"");
            $("#realmoney").html(""+paymoney+"");
            tuiqian();
            return;

            }
            function backmoney() {
                var id=$("#orderid").html();
                var shiji=$("#realmoney").html();
                var carid=$("#cadid").html();
                alert(shiji);
                alert(id);
                window.location.href="backcarServlet?orderid="+id+"&money="+shiji+"&carid="+carid+"";

            }
    </script>
    <script type="text/javascript">
        function tuiqian(){
            layer.open({
                type: 1,
                area : ['600px' , '600px'],
                title: '填写订单信息',
                shadeClose: true,
                maxmin: true,
                content: $('#send'),
                cancel:function () {
                    $("#paypic").css('dispaly','none');//表示设置为禁用
                }
            });
        }

    </script>
</head>
<body>
<!----start-wrap---->
<!----start-top-header----->
<div class="top-header" id="header">
    <div class="wrap">
        <div class="top-header-left">
            <ul>
                <li><a href="#"><span> </span> Agent Login</a></li>
                <li><a href="#"><span> </span> Agent Login</a></li>
                <li><p><span> </span>Not a Member ? </p>&nbsp;<a class="reg" href="#"> Register</a></li>
                <li><p class="contact-info">Call Us Now :815-123-4567</p></li>
                <div class="clear"> </div>
            </ul>
        </div>
        <div class="top-header-right">
            <ul>
                <li><a class="face" href="#"><span> </span></a></li>
                <li><a class="twit" href="#"><span> </span></a></li>
                <li><a class="thum" href="#"><span> </span></a></li>
                <li><a class="pin" href="#"><span> </span></a></li>
                <div class="clear"> </div>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<!----//End-top-header----->
<!---start-header---->
<div class="header">
    <div class="wrap">
        <!--- start-logo---->
        <div class="logo">
            <a href="ShowcarmailServlet"><img src="images/logo.png" title="voyage" /></a>
        </div>
        <!--- //End-logo---->
        <!--- start-top-nav---->
        <div class="top-nav">
            <ul class="flexy-menu thick orange">
                <li><a href="shoppage.jsp">主页</a></li>
                <li><a href="showpersonorderServlet">我的订单    欢迎${sessionScope.customername}</a><input type="hidden" value="${sessionScope.customername}" id="customername"></li>

                <li><a href="criuses.html">个人中心</a></li>
                <li><a href="zhuxiaoServlet">安全退出</a></li>

                <li class="active"><a href="blog.html">  </a></li>
            </ul>

            <!----search-scripts---->
            <script src="js/modernizr.custom.js"></script>
            <script src="js/classie.js"></script>
            <script src="js/uisearch.js"></script>
            <script>
                new UISearch( document.getElementById( 'sb-search' ) );
            </script>
            <!----//search-scripts---->
        </div>
        <!--- //End-top-nav---->
        <div class="clear"> </div>
    </div>
    <!---//End-header---->
</div>
<!---start-Criuses---->
<div></div>
<div class="criuses">

    <!----//End-find-place---->
    <!---start-criuse-grids----->
    <!---//End-criuse-grids----->
</div>

</div>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> </div>
        <h1><a href="ShowcarmailServlet"><input type="button" class="btn" value="返回"></a></h1>
    </div>
    <div class="container-fluid" align="center">

        <c:forEach items="${personorderlist}" var="list" varStatus="personlist">
            <table width="600" border="1" cellspacing="5px">
                <tbody>

                <tr>
                    <td><img src="${list.carpage}"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>订单编号</td>
                    <td>${list.orderid}</td>
                    <td><input type="hidden" value="${list.orderid}" id="dingdanhao"></td>
                </tr>
                <tr>
                    <td>汽车车牌</td>
                    <td id="cadid">${list.caridcard}</td>
                </tr>
                <tr>
                    <td>借车日期</td>
                    <td id="hc${list.orderid}">${list.ordersendid}</td>
                </tr>
                <tr>
                    <td>还车日期</td>
                    <td>
                        <c:if test="${list.zhuangtai==1}">
                            <input type="button" value="立刻还车" onclick="backcar(${list.orderid},${list.danjia},${list.orderyajin})">
                        </c:if>

                    </td>
                </tr>
                <tr>
                    <td>单日价格</td>
                    <td>${list.danjia}</td>
                </tr>
                <tr>
                    <td>已付押金</td>
                    <td>${list.orderyajin}</td>
                </tr>
                <tr>
                    <td>车辆状态</td>
                    <td>
                        <c:if test="${list.zhuangtai==1}">
                            <font color="red">正在租赁</font>
                        </c:if>
                        <c:if test="${list.zhuangtai==2}">
                            <font color="green">已还车</font>
                        </c:if>

                    </td>
                </tr>

                </tbody>
            </table>
    </c:forEach>


    </div>
</div>
</div>
<!---start-Criuses---->
<!----//End-footer---->
<!---start-subfooter---->
<div class="subfooter">

</div>
<!---//End-subfooter---->
<!----//End-wrap---->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
<div align="center" id="send" style="display: none" >
    <div>
        <div >
            <table>
                <tr>
                    <td>
                        您的订单号
                    </td>
                    <td><font color="red" size="15px" id="orderid"></font> </td>
                </tr>
                <tr>
                    <td>
                       您的实际消费未
                    </td>
                    <td><font color="red" size="15px" id="realmoney"></font> </td>
                </tr>
                <tr>
                    <td>
                        您的押金
                    </td>
                    <td><font color="red" size="15px" id="yajin"></font> </td>
                </tr>
                <tr>
                    <td><font color="red" size="15px" id="tuiqian"></font> </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="确认还车" onclick="backmoney()">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>
</html>


