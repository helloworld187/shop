<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<base href="${pageContext.request.contextPath}/"/>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>ShopCZ-首页</title>
	<link rel="stylesheet" href="css/base.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="css/shop_home.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.js" ></script>
    <script type="text/javascript" src="js/topNav.js" ></script>
    <script type="text/javascript" src="js/focus.js" ></script>
    <script type="text/javascript" src="js/shop_home_tab.js" ></script>
    <script type="text/javascript" src="plugins/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
		function view(){
			alert(document.getElementById("image").value);
		}
	</script>
	<style type="text/css">
		.inline{
			dispaly:inline-block;
		}
	</style>
</head> 
<body>
	<!-- Header  -wll-2013/03/24 -->
	<div class="shop_hd">
		<!-- Header TopNav -->
		<div class="shop_hd_topNav">
			<div class="shop_hd_topNav_all">
				<!-- Header TopNav Left -->
				<div class="shop_hd_topNav_all_left">
					<p>您好，欢迎来到<b><a href="toindex.jsp">ShopCZ商城</a></b>
					[<font style="color:red">${user.username}</font>]</p>
						<div class="topNav_menu_bd" style="display:none;" >
				            <ul>
				              <li><a title="已买到的商品" target="_top" href="member.html">已买到的商品</a>
				              </li>
				              <li><a title="个人主页" target="_top" href="#">个人主页</a></li>
				              <li><a title="我的好友" target="_top" href="#">我的好友</a></li>
				            </ul>
				        </div>
				</div>
				<!-- Header TopNav Left End -->

				<!-- Header TopNav Right -->
				<div class="shop_hd_topNav_all_right">
					<ul class="topNav_quick_menu">

						<li>
							<div class="topNav_menu">
								<a href="#" class="topNavHover">我的商城<i></i></a>
								<div class="topNav_menu_bd" style="display:none;" >
						            <ul>
						              <li><a title="已买到的商品" target="_top" href="member.html">已买到的商品</a>
						              </li>
						              <li><a title="个人主页" target="_top" href="#">个人主页</a></li>
						              <li><a title="我的好友" target="_top" href="#">我的好友</a></li>
						            </ul>
						        </div>
							</div>
						</li>
                        <li>
							<div class="topNav_menu">
								<a href="#" class="topNavHover">卖家中心<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
						            <ul>
						              <li><a title="已售出的商品" target="_top" href="#">已售出的商品</a></li>
						              <li><a title="销售中的商品" target="_top" href="#">销售中的商品</a></li>
						            </ul>
						        </div>
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="shopcart/findGoodsid" class="topNavHover">购物车<b>0</b>种商品<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
									<!--
						            <ul>
						              <li><a title="已售出的商品" target="_top" href="#">已售出的商品</a></li>
						              <li><a title="销售中的商品" target="_top" href="#">销售中的商品</a></li>
						            </ul>
						        	-->
						            <p>还没有商品，赶快去挑选！</p>
						        </div>
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="favorite/findFavoriteGoods" class="topNavHover">我的收藏<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
						            <ul>
						              <li><a title="收藏的商品" target="_top" href="favorite.html">收藏的商品</a></li>
						              <li><a title="收藏的店铺" target="_top" href="#">收藏的店铺</a></li>
						            </ul>
						        </div>
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="news.html">站内消息</a>
							</div>
						</li>

					</ul>
				</div>
				<!-- Header TopNav Right End -->
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<!-- Header TopNav End -->

		<!-- TopHeader Center -->
		<div class="shop_hd_header">
			<div class="shop_hd_header_logo"><h1 class="logo"><a href="/"><img src="images/logo.png" alt="ShopCZ" /></a><span>ShopCZ</span></h1></div>
			<div class="shop_hd_header_search">
                            <ul class="shop_hd_header_search_tab">
			        <li id="search" class="current">商品</li>
			        <li id="shop_search">店铺</li>
			    </ul>
                            <div class="clear"></div>
			    <div class="search_form">
			    	<form method="post" action="index.php">
			    		<div class="search_formstyle">
			    			<input type="text" class="search_form_text" name="search_content" value="搜索其实很简单！" />
			    			<input type="submit" class="search_form_sub" name="secrch_submit" value="" title="搜索" />
			    		</div>
			    	</form>
			    </div>
                <div class="clear"></div>
			    <div class="search_tag">
			    	<a href="">李宁</a>
			    	<a href="">耐克</a>
			    	<a href="">Kappa</a>
			    	<a href="">双肩包</a>
			    	<a href="">手提包</a>
			    </div>

			</div>
		</div>
		<div class="clear"></div>
		<!-- TopHeader Center End -->

		<!-- Header Menu -->
		<div class="shop_hd_menu">
			<!-- 所有商品菜单 -->
                        
			<div class="shop_hd_menu_all_category shop_hd_menu_hover"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
				

			<!-- 普通导航菜单 -->
			<ul class="shop_hd_menu_nav">
				<li class="current_link"><a href=""><span>首页</span></a></li>
				<li class="link"><a href=""><span>团购</span></a></li>
				<li class="link"><a href=""><span>品牌</span></a></li>
				<li class="link"><a href=""><span>优惠卷</span></a></li>
				<li class="link"><a href=""><span>积分中心</span></a></li>
				<li class="link"><a href=""><span>运动专场</span></a></li>
				<li class="link"><a href=""><span>微商城</span></a></li>
			</ul>
			<!-- 普通导航菜单 End -->
		</div>
	</div>
	<div style="width: 1000px;height: 500px;margin:0 auto;margin-top:20px;border: 2px solid #FE8502; font-size: 20px;color:grey">
		<div style="margin:40px">
			<a href="toindex.jsp"><img  align="absmiddle" class="inline" src="image/主页.png" style="width: 50px;height: 50px;"/>
			</a>
			<span class="inline" style="margin-left:250px;color:#FE8502;font-weight: bold;font-size: 30px; ">商品上架----上传图片</span>
			<hr style="height:3px;border:none;border-top:3px dotted #FE8502; " />
				<div class="grzl" style="margin-top: 30px;">
				<font>请上传商品图片:</font><br/><br/>
				<form action="goods/uploadpicture?goodsid=${Goods.goodsid}" method="post" enctype="multipart/form-data">
					<input type="file" name="image" id="image" />${message}<br/><br/>
					<img src="image/upload.png" style="width: 150px;height: 150px;"/><br/><br/>
				 	<input type="button" class="button" value="确定" style="width:50px;height: 25px" />
				 	<input type="button" class="button" value="预览"  onclick="view()" style="width:50px;height: 25px"/><br/><br/>
				 	<input type="submit" value="上传" style="width:60px;height:30px;"/>${message}
				</form>	
				</div><br/>		
				
		</div>
	</div>
	</body>
	<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"category/find",
			type:"post",
			dataType:"json",
			success:function(list){
				$.each(list, function(index, category) {
					$("#classify").append('<option value="'+
							category.categoryid+'">'+category.categoryname+'</option>');
				});
			},
			error:function() {
				alert("失败");
			}
			});
		});
	</script>	
	
	</html>