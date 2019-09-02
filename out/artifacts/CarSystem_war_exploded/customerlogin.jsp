<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/8/29
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>通用表单页面_漂亮的响应式Bootstrap后台管理系统模板MatAdmin - JS代码网</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/colorpicker.css" />
    <link rel="stylesheet" href="css/datepicker.css" />
    <link rel="stylesheet" href="css/uniform.css" />
    <link rel="stylesheet" href="css/select2.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
<script type="text/javascript">
    function panduanmima() {
        var password = $("#password").val();
        var repassword = $("#repassword").val();
        if(password!=repassword){
            $("#flag").html("两次输入的密码不一样");
        }
    }
    function panduan() {
        alert("我进入了");
        var realname = $("#realname").val();
        var password = $("#password").val();
        var email = $("#email").val();
        var idcard = $("#idcard").val();
        var telnumber = $("#telnumber").val();
        if(realname==null||realname==""){
            alert("请输入您真的真实姓名");
            return false;

        }
        if(password==null||password==""){
            alert("请输入您密码");
            return false;

        }
        if(email==null||email==""){


            alert("请输入邮箱");
            return false;
        }
        if(idcard==null|idcard==""){

            alert("请输入身份证号");
            return false;
        }if(telnumber==null||telnumber==""){

            alert("请输入您手机号");
            return false;
        }
        return true;

    }
</script>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Form elements</a> <a href="#" class="current">Common elements</a> </div>
        <h1>注册界面</h1>
    </div>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                        <h5>填写注册信息</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <form action="singinServlet" method="post" class="form-horizontal" onsubmit="return panduan()">
                            <div class="control-group">
                                <label class="control-label">真实姓名</label>
                                <div class="controls">
                                    <input type="text" class="span11" placeholder="真实姓名"  name="realname" id="realname"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">邮箱</label>
                                <div class="controls">
                                    <input type="text" class="span11" placeholder="手机号" name="telnumber" id="telnumber" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">密码</label>
                                <div class="controls">
                                    <input type="password"  class="span11" placeholder="Enter Password"  name="password" id="password"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">再次输入密码</label>
                                <div class="controls">
                                    <input type="password"  class="span11" placeholder="Enter Password" name="repassword"  id="repassword" onblur="panduanmima()"/> <font color="red" id="flag"></font>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">邮箱</label>
                                <div class="controls">
                                    <input type="text" class="span11" placeholder="Company name" name="email" id="email" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">身份证号</label>
                                <div class="controls">
                                    <input type="text" class="span11" name="idcard" id="idcard"/>
                                    <span class="help-block">实名认证专用</span> </div>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-success">确认注册</button>
                            </div>
                        </form>
                    </div>
                </div>


            </div>

        </div>

    </div></div>
<!--Footer-part-->
<div class="row-fluid">
    <div id="footer" class="span12"> 2013 &copy; MatAdmin.</div>
</div>
<!--end-Footer-part-->
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
