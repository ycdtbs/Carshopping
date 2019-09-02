
<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/28
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <script type="text/javascript">
        var $1 = $(function(){
            var a=$("#customerid").val().toString();
            if(a==null||a==""){
                window.location.href="shoppage.jsp"
            }
        });

    </script>
    <script type="text/javascript">
        var $1 = $(function(){
            var a=$("#customername").val().toString();
            alert(3)
            if(a==null||a==""){
                alert(2)
                window.location.href="shoppage.jsp"
            }
        });
    </script>
    <title>Criuses</title>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <script src="js/jquery.min.js">

    </script>
    <!---smoth-scrlling---->
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
        function zhifuwancheng() {
            var money=$("#money").html();//需要传递的一天多少钱
            var carid = $("#caiid").val();//需要传递的汽车id
            var startime = $("#starttime").val();//需要传递开始时间
            var endtime = $("#endtime").val();//需要传递的还车时间
            var day1 = new Date(startime);
            var day2 = new Date(endtime);
            var daynumber=(day2 - day1) / (1000 * 60 * 60 * 24);//租车天数
            var yujimoney=daynumber*money;
            var yajin=yujimoney*1.5;//需要传递的押金
            var customerid=$("#customerid").val();//需要传递的用户id
            alert(customerid+"customerid是");
            window.location.href="addorderServlet?money="+money+"&carid="+carid+"&startime="+startime+"&endtime="+endtime+"&yajin="+yajin+"&customerid="+customerid+""
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
        <hr>

        <c:forEach items="${carlist}" var="carlist" varStatus="str">
            <img src="${carlist.Carpage}" width="1000px" height="400px">


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
                            <font id="money">${carlist.money}</font>元/天
                        </td>
                    </tr>
                    <tr>
                        <td height="100px"><font size="20" color="#1e90ff">颜色</font></td>
                        <td>${color}</td>
                    </tr>
                    <tr>
                        <td height="100px"><font size="20" color="#1e90ff">载客人数</font></td>
                        <td>${zaikerenshu}</td>
                    </tr>
                    <tr>
                        <td height="100px"><font size="20" color="#1e90ff">百公里油耗</font></td>
                        <td>${baigongliyouhao}</td>
                    </tr>
                    <tr>
                        <td height="100px"><font size="20" color="#1e90ff">排量</font></td>
                        <td>${pailiang}</td>
                    </tr>
                    <tr>
                        <td height="100px"><font size="20" color="#1e90ff">是否购置保险</font></td>
                        <td>${baoxian}</td>

                    </tr>
                    </tbody>
                </table>


                <div>
                    <input type="hidden" value="${sessionScope.customernumber}" id="customerid">
                    <input type="text" style="display: none" value="${carlist.Carnumber}" name="carid" id="caiid">
                        <%--                这里有个name未text的东西被我删了23 --%>
                    <input type="button" value="租赁" class="btn" size="1100px" onclick="send()">
                    <input type="button" value="购买" class="btn" size="1100px">

                </div>

            <hr>
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
        <table width="60%" align="center">
            <tr>
                <td height="100px">起租日期</td>
                <td><input type="date" id="starttime"></td>
            </tr>
            <tr>
                <td>截止日期</td>
                <td><input type="date" id="endtime" onchange="money()"></td>
            </tr>
            <tr>
                <td height="50px">预估金额</td>
                <td><font id="showmoney" color="red" size="+4"></font></td>

            </tr>
            <tr>
                <td height="50px">押金</td>
                <td><font id="yajing" color="#1e90ff" size="+4"></font></td>

            </tr>
            <tr>
                <td>押金说明：将会根据租车时常的1.5倍收取押金，实际按照用车时常扣款</td>
            </tr>
            <tr>
                <td colspan="2"> <input type="button" value="确认支付" style="color: #da542e"  size="10px" onclick="pay()"></td>
            </tr>
            <tr>
                <td style="display: none" id="paypic">
                    <img src="pay.png" >
                    <input type="button" value="支付完成" onclick="zhifuwancheng()">
                </td>
            </tr>


        </table>
    </div>
    </div>
</div>
</body>
</html>


