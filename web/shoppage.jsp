<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/26
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

    <script src="js/jquery.min.js"></script>
    <!---script---->
    <link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css" />
    <script src="js/jquery.bxslider.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.bxslider').bxSlider({
                auto: true,
                autoControls: true,
                minSlides: 4,
                maxSlides: 4,
                slideWidth:450,
                slideMargin: 10
            });
        });
    </script>
    <!---//script---->
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
    <script type="text/javascript">$(document).ready(function () {
        $(".flexy-menu").flexymenu({speed: 400, type: "horizontal", align: "right"});
    });</script>
    <!----//End-top-nav-script---->
    <!---webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!---webfonts---->
    <!--start slider -->
    <link rel="stylesheet" href="css/fwslider.css" media="all">
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script>
    <!--end slider -->
    <!---calender-style---->
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <!---//calender-style---->
    <script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
    function login() {
        layer.open({
            type: 1,
            area : ['800px' , '500px'],
            title: '请您登陆',
            shadeClose: true,
            maxmin: true,
            content: $('#login'),
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
</script>
    <script type="text/javascript">
        function comeinmail(name) {
            if(name.length<3){
                login();
            }
            else {
                window.location.href="ShowcarmailServlet";
            }

        }
        function loginimol() {
            var customername = $("#cuatomername").val();
            var customerpassword = $("#cuatomerpassword").val();
            if(customername==null||customerpassword)
            $.post("customerloginServlet",{"customername":customername,"customerpassword":customerpassword},function (date) {
                if(date.flag==1){
                    window.location.href="customerloginServlet?jump=true"
                }
                if(date.flag==0){

                    $("#flag").html("账号密码错误")
                }
            },"json")


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
                <li><a href="login.jsp"><span> </span> 管理员登陆入口</a></li>

                <div class="clear"> </div>
            </ul>
        </div>
        <div class="top-header-right">
            <ul>
                <li>登陆</li>
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
            <a href="#"><img src="images/logo.png" title="优租车" /></a>
        </div>
        <!--- //End-logo---->
        <!--- start-top-nav---->
        <div class="top-nav">
            <ul class="flexy-menu thick orange">

            </ul>
            <div class="search-box">
                <div id="sb-search" class="sb-search">

                </div>
            </div>
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
<!----start-images-slider---->
<div class="images-slider">
    <!-- start slider -->
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide">
                <!-- Slide image -->
                <img src="images/slider-bg.jpg" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">优租车·您的一站式租车服务</h4>
                        <!-- /Text title -->
                        <!-- Text description -->
                        <p class="description">哪里有人，哪里有车</p>
                        <!-- /Text description -->
                        <div class="slide-btns description">
                            <ul>
                                <li><a class="mapbtn" onclick="comeinmail('td${sessionScope.customername}')">进入商城 </a></li>
                                <li><a class="minfo" href="#">客户服务</a></li>
                                <div class="clear"> </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Texts container -->
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
                <img src="images/slider-bg.jpg" alt=""/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">行于至善止于至美</h4>
                        <!-- /Text title -->
                        <!-- Text description -->
                        <p class="description">全国32个网点，1000+专业人士为您提供全方位的服务</p>
                        <!-- /Text description -->
                        <div class="slide-btns description">
                            <ul>
                                <li><a class="mapbtn" href="ShowcarmailServlet">进入商城 </a></li>
                                <li><a class="minfo" href="#">客户服务 </a></li>
                                <div class="clear"> </div>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--/slide -->
        </div>
        <div class="timers"> </div>
        <div class="slidePrev"><span> </span></div>
        <div class="slideNext"><span> </span></div>
    </div>
    <!--/slider -->
</div>
<!----start-find-place---->

        <!---strat-date-piker---->
        <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <script>
            $(function() {
                $( "#datepicker" ).datepicker();
            });
        </script>
        <!---/End-date-piker---->

<!----//End-find-place---->
<!----start-offers---->

                    <!----//place-caption-info---->
                </li>


                    <!----//place-caption-info---->
                </li>
            </ul>
        </div>
    </section>
    <!-- //End content_slider -->
</div>
<!----//End-offers---->
<!---start-holiday-types---->

<!---//End-holiday-types---->
<!----//End-images-slider---->
<!----start-clients---->

<!----//End-clients---->
<!----start-footer---->

<!----//End-footer---->
<!---start-subfooter---->
<div class="subfooter">
    <div class="wrap">

        <p class="copy-right">Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
        <a class="to-top" href="#header"><span> </span> </a>
    </div>
</div>
<!---//End-subfooter---->
<!----//End-wrap---->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
<div align="center" id="login" style="display: none">
<div align="center" class="widget-title">
<table>
    <tr>
        <td>请输入用户名</td>
        <td><input type="text" class="controls" id="cuatomername" value="" placeholder="请输入邮箱或手机号"></td>
    </tr>
    <tr>
        <td>请输入密码</td>
        <td><input type="password" class="controls" id="cuatomerpassword" value=""><font id="flag"></font></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" value="登陆" onclick="loginimol()"></td>
    </tr>
    <tr>
        <a href="customerlogin.jsp">点此注册</a>
    </tr>
</table>
</div>
</div>
</body>
</html>


