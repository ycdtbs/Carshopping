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
</head>
<body>
<div id="loginbox">
    <form id="loginform" class="form-vertical" action="loginServlet" onsubmit="return login()">
        <div class="control-group normal_text"> <h3>优租车员工后台系统</h3></div>
        <div class="control-group">
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" placeholder="用户名"  id="username" name="username"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" placeholder="密码" id="password" name="password"/>
                    <font color="white" id="flag" size="1px"></font>
                </div>
            </div>
        </div>
        <div class="form-actions">

            <span class="pull-right"><input type="button" class="btn btn-success" value="登陆" onclick="login()"></span>
        </div>
    </form>
    <form id="recoverform" action="#" class="form-vertical">
        <p class="normal_text">请输入正确的用户名密码</p>

        <div class="controls">
            <div class="main_input_box">
                <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
            </div>
        </div>

        <div class="form-actions">
            <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; 返回登录</a></span>
            <span class="pull-right"><a class="btn btn-info"/></a></span>
        </div>
    </form>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/matrix.login.js"></script>
</body>

</html>
