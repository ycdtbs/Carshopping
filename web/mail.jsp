<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/27
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Blog</title>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript">
        var $1 = $(function(){
            var a=$("#customername").val().toString();
           if(a==null||a==""){
               window.location.href="shoppage.jsp"
           }
        });

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

    <!---webfonts---->
    <!---calender-style---->
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <!---//calender-style---->
    <!---images-hover-effects--->
    <link rel="stylesheet" href="css/zalki_hover_img.css" type="text/css" media="screen">
    <script src="js/jquery.zalki_hover_img.min-0.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function(){
            $('.main_box').ZalkiHoverImg(
            );
        });
    </script>
    <script type="text/javascript">
        //全表模糊查询
        function searchbutton(search) {
            //search=search.id.toString();
            var val = $("#"+search.id).val();
            window.location.href="shoppingsearchServlet?search="+val+"";
        }
    </script>

    <!---//images-hover-effects--->
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
            <div class="search-box">
                <div id="sb-search" class="sb-search">
                    <form action="shoppingsearchServlet" method="post">
                        <input class="sb-search-input" placeholder="请输入您要查询的..." type="search" name="search" id="search">
                        <input class="sb-search-submit" type="submit" value="">
                        <span class="sb-icon-search"> </span>
                    </form>
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
<!---start-Blog---->
<div>
    <c:if test="${carbrand==null}">
        <a href="ShowcarmailServlet"><input type="button" class="btn" value="返回"></a>
    </c:if>
<c:forEach items="${carbrand}" var="carbrandlist" varStatus="str">
    <input type="button" value="${carbrandlist.Carbrand}" class="btn" id="pm${carbrandlist.Brandkey}" onclick="searchbutton(pm${carbrandlist.Brandkey})">
    <c:if test="${((str.index+1)/3)%1==0&&str.index>=1}">
        <br>
    </c:if>
</c:forEach>
    <br>
    <c:forEach items="${address}" var="addresslist" varStatus="str">
        <input type="button" value="${addresslist.Adress}" class="btn" id="zp${addresslist.Brandkey}" onclick="searchbutton(zp${addresslist.Brandkey})">
        <c:if test="${((str.index+1)/3)%1==0&&str.index>=1}">
            <br>
        </c:if>
    </c:forEach>

</div>
<div class="blog">


    <div class="blog-grids">

        <div class="wrap">
            <div class="blog-grids-head">
                <h3></h3>

            </div>
            <div class="blog-grids-box">

                <c:forEach items="${carlist}" var="carlist" varStatus="str">
                    <div class="blog-grid">
                        <div class="blog-poast-head">
                            <div class="blog-art-pic">
                                <a class="post-pic" href="#"> <img src="${carlist.Carpage}" title="poast-name" width="861.42px" height="350px" /></a>
                            </div>
                            <div class="blog-poast-info">
                                <ul>
                                    <li><a class="admin" href="#"><span> </span> ${carlist.Carbrand} </a></li>
                                    <li><a class="p-date" href="#"><span> </span>${carlist.Carname} </a></li>
                                    <div class="clear"> </div>
                                </ul>
                            </div>
                        </div>
                        <form method="post" action="">
                        <div class="blog-info">
                            <a class="btn" href="CardetailedinfServlet?flag=cutomer&carid=${carlist.Carnumber}">查看车辆</a>
                        </div>
                        </form>
                    </div>
                </c:forEach>
                <div class="clear"> </div>
            </div>

        </div>
    </div>
</div>
<!----//End-Blog---->
<!----//End-footer---->
<!---start-subfooter---->
<div class="subfooter">
    <div class="wrap">
        <ul>
            <li><a href="index.html">我的订单</a><span>::</span></li>
            <li><a href="destinations.html">Destinations</a><span>::</span></li>
            <li><a href="criuses.html">Criuses</a><span>::</span></li>
            <li><a href="destinations.html">Specils</a><span>::</span></li>
            <li><a href="destinations.html">Holidays</a><span>::</span></li>
            <li><a href="blog.html">Blog</a><span>::</span></li>
            <li><a href="contact.html">Contact Us</a></li>
            <div class="clear"> </div>
        </ul>
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
                <td><input type="text" class="controls" id="cuatomername" value=""></td>
            </tr>
            <tr>
                <td>请输入密码</td>
                <td><input type="text" class="controls" id="cuatomerpassword" value=""><font id="flag"></font></td>
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

