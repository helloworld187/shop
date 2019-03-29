<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户注册</title>
	<base href="${pageContext.request.contextPath}/"/>
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/global.css" />
	<link rel="stylesheet" href="css/login-register.css" />
	<script type="text/javascript" src="plugins/jquery-3.3.1.min.js"></script>	
	<script type="text/javascript">
	//校验用户名
	function check_name() {
		var uname = $("#username").val();
		var tip = $("#tip");
		if(uname.length<3||uname.length>14){
			tip.text("用户名只能是3--14位");
			return false;
			
		}else{
			var usernameisable = $("#checkname");
			$.ajax({
				url:"user/checkusername",
				type:"post",
				data:{username:uname},
				success:function(result){
					usernameisable.val(result);
					if(result=="该用户名已存在"){
						tip.text(result);	
					}else{
						tip.text(result);
					}
				},
				error:function() {
					alert("失败");
				}
				
			});
			if(usernameisable.val() == "该用户名可以用"){
				return true;
			}
			else {
				return false;
			}
		}
				
	}
	//校验密码
	function check_pwd() {
		var password = $("#password").val();
		var tip = $("#tip");
		if(password.length<6||password.length>14){
			tip.text("密码只能是6--14位");
			return false;
		}else{
			tip.text("");
			return true;
		}
	}
	//校验重复密码
	function recheck_pwd() {
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		var tip = $("#tip");
		if (password === repassword) {
			tip.text("");
			return true;
		} else {
			tip.text("两次密码输入不一致");
			return false;
		}
	}
	//校验邮箱
	function check_email() {
		var email = $("#email").val();
		var reg = new RegExp("\^[A-Za-z0-9]+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}");
		var tip = $("#tip");
		if (reg.test(email)) {
			tip.text("");
			return true;
		} else {
			tip.text("邮箱格式不对");
			return false;
		}

	}
	function doSubmit() {
		var form1 = $("#form1");
		console.log(check_name());	
		console.log(check_pwd());
		console.log(recheck_pwd());
		console.log(check_email());
		if(check_name() && check_pwd() && recheck_pwd() && check_email()) {
			var uname = $("#username").val();
			var pwd = $("#password").val();
			var repwd = $("#repassword").val();
			var email = $("#email").val();
			var tip = $("#tip");
			$.ajax({
				url:"user/register",
				type:"post",
				data:{username:uname,password:pwd,email:email},
				success:function(result){
					if(result == "注册成功！"){
						parent.location.href = 'login.jsp';
						
					}else{
						tip.text(result);
					}
					
				},
				error:function() {
					alert("失败");
				}
				
			});
		}
	}
	
	</script>
</head>
<body>
	<div class="header wrap1000">
		<a href=""><img src="images/logo.png" alt="" /></a>
	</div>
	
	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户注册</h3>
			</div>
			<div class="form-bd">
				<p id="tip" style="color:red;margin-left:200px;widrh:20px;height:20px;"></p>
				<form action="user/register" method="post" id="form1">
					<dl>
						<dt>用户名</dt>
						<dd><input type="text" id="username" onblur="check_name()" name="username" class="text" /></dd>
						<dd><input type="text" id="checkname" style="display:none;" /></dd>
					</dl>
					<dl>
						<dt>密码</dt>
						<dd><input type="password" id="password" onblur="check_pwd()" name="password" class="text"/></dd>
					</dl>
					<dl>
						<dt>确认密码</dt>
						<dd><input type="password" id="repassword" onblur="recheck_pwd()" name="repassword" class="text"/></dd>
					</dl>
					<dl>
						<dt>邮箱</dt>
						<dd><input type="text" id="email" onblur="check_email()" name="email" class="text"/></dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd><input type="text" name="code" class="text" size="10" style="width:58px;"> <img src="images/code.png" alt="" align="absmiddle" style="position:relative;top:-2px;"/> <a href="" style="color:#999;">看不清，换一张</a></dd>
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd><input type="button" id="register" onclick="doSubmit()" value="立即注册" class="submit"/> <input type= "checkbox" checked="checked"/>阅读并同意<a href="" class="forget">服务协议</a></dd>
					</dl>
				</form>
				
			</div>
			<div class="form-ft">
			
			</div>		
		</div>
		
		<div class="login-form-left fl">
			<dl class="func clearfix">
				<dt>注册之后您可以</dt>
				<dd class="ico05"><i></i>购买商品支付订单</dd>
				<dd class="ico01"><i></i>申请开店销售商品</dd>
				<dd class="ico03"><i></i>空间好友推送分享</dd>
				<dd class="ico02"><i></i>收藏商品关注店铺</dd>
				<dd class="ico06"><i></i>商品资讯服务评价</dd>
				<dd class="ico04"><i></i>安全交易诚信无忧</dd>
			</dl>
			
			<div class="if">
				<h2>如果您是本站用户</h2>
				<p>我已经注册过账号，立即 <a href="login.jsp" class="register">登录</a> 或是 <a href="" class="findpwd">找回密码？</a></p>
			</div>
		</div>
	</div>
	
	<div class="footer clear wrap1000">
		<p> <a href="">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a href="">关于ShopCZ</a> | <a href="">联系我们</a></p>
		<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
	</div>



</body>
</html>
