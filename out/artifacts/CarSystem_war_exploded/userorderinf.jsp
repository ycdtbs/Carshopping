<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/31
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>登录页面</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/matrix-login.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        function login() {
            var username= $("#username").val();
            var password=$("#password").val();
            alert(username);
            if(username==""||username==null){
                return false;
            }
            $.post("loginServlet",{"username":username,"password":password},function (date) {
                alert(date.flag);
                if(date.flag==1){
                    window.location.href="loginServlet?jump=true"
                }
                if(date.flag==0){
                    alert("我回来了");
                    $("#flag").html("账号密码错误")
                }
            },"json")
        }
    </script>
    <script type="text/javascript">
        function back() {
            window.location.href="rootshoworderServlet";

        }
    </script>
</head>
<body>
<div style="background-color: white">
<div id="loginbox">
    <c:forEach items="${inflist}" var="inf" varStatus="index">
        <table>
            <tr>
                <td>订单编号</td>
                <td>${inf.Ordernumber}</td>
            </tr>
            <tr>
                <td>订单创建时间</td>
                <td>${inf.Ordertime}</td>
            </tr>

            <tr>
                <td>订单状态</td>
                <td>
                    <c:if test="${inf.Orderstatus==1}">
                    <font color="red">正在租赁</font>
                </c:if>
                    <c:if test="${inf.Orderstatus==2}">
                        <font color="green">已归还</font>
                    </c:if>
                    <c:if test="${inf.Orderstatus==3}">
                        <font color="#1e90ff">车辆检修</font>
                    </c:if>

                        </td>
            </tr>
            <tr>
                <td>顾客身份证号</td>
                <td>${inf.Customer}</td>
            </tr>
            <tr>
                <td>车辆借出日期</td>
                <td>${inf.Orderplantsendtime}</td>
            </tr>
            <tr>
                <td>车辆归还日期</td>
                <td>${inf.Orderbacktime}</td>
            </tr>
            <tr>
                <td>车辆编号</td>
                <td>${inf.Carnumber}</td>
            </tr>
            <tr>
                <td>车辆押金</td>
                <td>${inf.Orderyajin}</td>
            </tr>
            <tr>
                <td>车辆单价</td>
                <td>${inf.onedaymoney}</td>
            </tr>
            <tr>
                <td>实际获利</td>
                <td>${inf.gemoney}</td>
            </tr>
        </table>
    </c:forEach>
    <input type="button" onclick="back()" value="返回">
</div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/matrix.login.js"></script>
</body>

</html>

