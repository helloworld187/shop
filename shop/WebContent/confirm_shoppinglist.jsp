<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<base href="${pageContext.request.contextPath}/"/>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>确认收货人资料页面</title>
	<link rel="stylesheet" href="css/base.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_header.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_gouwuche.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.js" ></script>
    <script type="text/javascript" src="js/topNav.js" ></script>
    <script type="text/javascript" src="js/jquery.goodnums.js" ></script>
    <script type="text/javascript" src="js/shop_gouwuche.js" ></script>
    <script type="text/javascript">
	$(function(){
		var total = 0.0;
		$('.pic1').each(function(){
			console.log($(this).children('.gwc_list_danjia').children('span').children('#danjia_001').text());
			console.log($(this).children('.gwc_list_shuliang').children('span').children('.good_nums').val());
			total = total + parseFloat($(this).children('.gwc_list_danjia').children('span').children('#danjia_001').text()) * parseFloat($(this).children('.gwc_list_shuliang').children('span').children('.good_nums').val());
		});
		$('#good_zongjia').text(parseFloat(total));
	});

	//$('#confirmed').click(function(){
		//var total = parseFloat($(this).children('.gwc_list_danjia').children('span').children('#danjia_001').text()) * parseFloat($(this).children('.gwc_list_shuliang').children('span').children('.good_nums').val());
		// var price = $('#good_zongjia').text();
		// alert(price);
		// var address = $(".xiangxi").val();
		// // alert(address);

		//  $.ajax({
		// 	url:"order/addOrder",
		// 	type:"post",
		// 	data:{totalPrice:total,addressinfo:address},
		// 	success:function(result){
		// 		if(result=="付款成功！"){
		// 			parent.location.href = 'order-success.jsp';	
		// 		}else{
		// 			alert(result);
		// 		}
				
		// 	},
		// 	error:function() {
		// 		alert("失败");
		// 	}
			
		// });
	//});
	function add(){
		var name = $(".name").val();
		var address = $(".xiangxi").val();
		var code = $(".youbian").val();
		var tel = $(".dianhua").val();
		$.ajax({
			url:"address/addAddress",
			type:"post",
			data:{name:name,addressinfo:address,zipcode:code,telephone:tel},
			success:function(result){
				if(result == "地址添加成功！"){	
					$("#address").append(
							'<li><label>寄送至：<span><input type="radio" /></span></label><em>'+address+'</em><em>邮编：'+code+'</em><em>'+name+'(收)</em><em>'+tel+'</em></li>');
					jQuery("#new_add_shdz_contents").hide(500);
					alert(result);
				}else{
					alert(result);
				}
				
			},
			error:function() {
				alert("失败");
			}
			
		});
	}

	function do1(){
		//var total = parseFloat($(this).children('.gwc_list_danjia').children('span').children('#danjia_001').text()) * parseFloat($(this).children('.gwc_list_shuliang').children('span').children('.good_nums').val());
		 // var address = $(".xiangxi").val();
		 // alert(total);

		 // console.log(total);
		var price = $('#good_zongjia').text();
		//alert(price);
		var address = $('input:radio:checked').val();
		if (address==undefined) {
			alert("请选择收货地址!");
		}
		else{
			// 这里面进行异步请求操作
			 $.ajax({
				url:"order/addOrder",
				type:"post",
				data:{totalPrice:price,addressid:address},
				success:function(result){
					if(result[0]=="订单提交成功！"){
						var totalmoney = result[1];
						var id = result[2];
						parent.location.href = "order-success.jsp?totalPrice="+totalmoney+"&ordersid="+id;
		 			}else{
						alert(result[0]);
					}
					
				},
				error:function() {
					alert("失败");
				}
				
			});
			}
		
	}
	</script>


    <style type="text/css">
    .shop_bd_shdz_title{width:1000px; margin-top: 10px; height:50px; line-height: 50px; overflow: hidden; background-color:#F8F8F8;}
    .shop_bd_shdz_title h3{width:120px; text-align: center; height:40px; line-height: 40px; font-size: 14px; font-weight: bold;  background:#FFF; border:1px solid #E8E8E8; border-radius:4px 4px 0 0; float: left;  position: relative; top:10px; left:10px; border-bottom: none;}
    .shop_bd_shdz_title p{float: right;}
    .shop_bd_shdz_title p a{margin:0 8px; color:#555555;}

	.shop_bd_shdz_lists{width:1000px;}
	.shop_bd_shdz_lists ul{width:1000px;}
	.shop_bd_shdz_lists ul li{width:980px; border-radius: 3px; margin:5px 0; padding-left:18px; line-height: 40px; height:40px; border:1px solid #FFE580; background-color:#FFF5CC;}
	.shop_bd_shdz_lists ul li label{color:#626A73; font-weight: bold;}
	.shop_bd_shdz_lists ul li label span{padding:10px;}
	.shop_bd_shdz_lists ul li em{margin:0 4px; color:#626A73;}

	.shop_bd_shdz{width:1000px; margin:10px auto 0;}
	.shop_bd_shdz_new{border:1px solid #ccc; width:998px;}
	.shop_bd_shdz_new div.title{width:990px; padding-left:8px; line-height:35px; height:35px; border-bottom:1px solid #ccc; background-color:#F2F2F2; font-color:#656565; font-weight: bold; font-size:14px;}
	.shdz_new_form{width:980px; padding:9px;}
	.shdz_new_form ul{width:100%;}
	.shdz_new_form ul li{clear:both; width:100%; padding:5px 0; height:25px; line-height: 25px;}
	.shdz_new_form ul li label{float:left;width:100px; text-align: right; padding-right: 10px;}
	.shdz_new_form ul li label span{color:#f00; font-weight: bold; font-size:14px; position: relative; left:-3px; top:2px;}
    </style>

	<script type="text/javascript">
	jQuery(function(){
		jQuery("#new_add_shdz_btn").toggle(function(){
			jQuery("#new_add_shdz_contents").show(500);
		},function(){
			jQuery("#new_add_shdz_contents").hide(500);
		});
	});
	</script>
</head>
<body>
		<!-- Header  -wll-2013/03/24 -->
	<div class="shop_hd">
		<!-- Header TopNav -->
		<div class="shop_hd_topNav">
			<div class="shop_hd_topNav_all">
				<!-- Header TopNav Left -->
				<div class="shop_hd_topNav_all_left">
					<p>您好，欢迎来到<b><a href="toindex.jsp">ShoopNC商城</a></b>[<font style="color:red">${user.username}</font>]</p>
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
						              <li><a title="已买到的商品" target="_top" href="#">已买到的商品</a></li>
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
						              <li><a title="收藏的商品" target="_top" href="#">收藏的商品</a></li>
						              <li><a title="收藏的店铺" target="_top" href="#">收藏的店铺</a></li>
						            </ul>
						        </div>
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="#">站内消息</a>
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
                        
			<div id="shop_hd_menu_all_category" class="shop_hd_menu_all_category"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
				<div class="shop_hd_menu_all_category_title"><h2 title="所有商品分类"><a href="javascript:void(0);">所有商品分类</a></h2><i></i></div>
				<div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
					
				</div>
			</div>
			<!-- 所有商品菜单 END -->

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
		<!-- Header Menu End -->

	</div>
	<div class="clear"></div>
	<!-- 面包屑 注意首页没有 -->
	<div class="shop_hd_breadcrumb">
		<strong>当前位置：</strong>
		<span>
			<a href="">首页</a>&nbsp;›&nbsp;
			<a href="">我的商城</a>&nbsp;›&nbsp;
			<a href="">我的购物车</a>
		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->
	
	<!-- 购物车 Body -->
	<div class="shop_gwc_bd clearfix">
		<div class="shop_gwc_bd_contents clearfix">

			<!-- 购物流程导航 -->
			<div class="shop_gwc_bd_contents_lc clearfix">
				<ul>
					<li class="step_a">确认购物清单</li>
					<li class="step_b hover_b">确认收货人资料及送货方式</li>
					<li class="step_c">购买完成</li>
				</ul>
			</div>
			<!-- 购物流程导航 End -->
			<div class="clear"></div>
			<!-- 收货地址 title -->
			<div class="shop_bd_shdz_title">
				<h3>收货人地址</h3>
				<p><a href="javasrcipt:void(0);" id="new_add_shdz_btn">新增收货地址</a><a href="address/selectAllAddress?skip=2">管理收货地址</a></p>
			</div>
			<div class="clear"></div>
			<!-- 收货人地址 Title End -->
			<div class="shop_bd_shdz clearfix">
				<div class="shop_bd_shdz_lists clearfix">
					<ul id="address">
						<c:forEach items="${Address}" var="address">
							<li><label>寄送至：<span><input type="radio" name="addr" class="selected" value="${address.addressid}" /></span></label><em>${address.addressinfo}</em><em>邮编：${address.zipcode}</em><em>${address.name}(收)</em><em>${address.telephone}</em></li>
						</c:forEach>
						
					</ul>
				</div>
				<!-- 新增收货地址 -->
				<div id="new_add_shdz_contents" style="display:none;" class="shop_bd_shdz_new clearfix">
					<div class="title">新增收货地址</div>
					<div class="shdz_new_form">
						<form>
							<ul>
								<li><label for=""><span>*</span>收货人姓名：</label>
									<input type="text" class="name" name="name"/></li>		
								<li><label for=""><span>*</span>详细地址：</label>
									<input type="text" class="xiangxi" name="addressinfo"/></li>
								<li><label for=""><span></span>邮政编码：</label>
									<input type="text" class="youbian" name="zipcode"/></li>
								<li><label for=""><span></span>联系电话：</label>
									<input type="text" class="dianhua" name="telephone" /></li>
								<li><label for="">&nbsp;</label>
									<input type="button" value="增加收货地址" onclick="add()"/></li>
							</ul>
						</from>
					</div>
				</div>
				<!-- 新增收货地址 End -->
			</div>
			<div class="clear"></div>
			<!-- 购物车列表 -->
			<div class="shop_bd_shdz_title">
				<h3>确认购物清单</h3>
			</div>
			<div class="clear"></div>
			<table>
				<thead>
					<tr>
						<th colspan="2"><span>商品</span></th>
						<th><span>单价(元)</span></th>
						<th><span>数量</span></th>
						<th><span>小计</span></th>
						<th><span>操作</span></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items ="${GoodsList}" var="goods">											
						<tr class="pic1">
							<td style="display: none;" class="gwc_list_id">${goods.goodsid}</td>
							<td class="gwc_list_pic"><a href=""><img src="${goods.photo}" width="39px" height="60px" /></a></td>
							<td class="gwc_list_title"><a href="">${goods.gdescription}</a></td>
							<td class="gwc_list_danjia"><span>￥<strong id="danjia_001">${goods.gprice}</strong></span></td>
							<td class="gwc_list_shuliang"><span><a class="good_num_jian this_good_nums" did="danjia_001" xid="xiaoji_001" ty="-" valId="goods_001" href="javascript:void(0);">-</a><input type="text" value="1" id="goods_001" class="good_nums" /><a href="javascript:void(0);" did="danjia_001" xid="xiaoji_001" ty="+" class="good_num_jia this_good_nums" valId="goods_001">+</a></span></td>				
							<td class="gwc_list_xiaoji"><span>￥<strong id="xiaoji_001" class="good_xiaojis">${goods.gprice}</strong></span></td>
							<td class="gwc_list_caozuo"><a href="javascript:;" class="shop_good_add">收藏</a><a href="javascript:;" class="shop_good_delete">删除</a></td>
						</tr>
					</c:forEach>	
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="gwc_foot_zongjia">商品总价(不含运费)<span>￥<strong id="good_zongjia">0.00</strong></span></div>
							<div class="clear"></div>
							<div class="gwc_foot_links">
								<a href="shopcart/findGoodsid?skip=2" class="go">返回上一步</a>
								<!--<a class="op" id="confirmed">确认收货地址</a>-->
								<input type="button" name="confirmed" id="confirmed" onclick="do1()" value="确认收货地址" style="width:100px;height:35px;margin-left:100px;border:none;font-size:15px;color:white;background:#FE8502;border-radius: 5px;text-decoration:none;border: none;"/>								
								<input name="skip" style="display: none;" value="1" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<!-- 购物车列表 End -->

		</div>
	</div>
	<!-- 购物车 Body End -->

	<!-- Footer - wll - 2013/3/24 -->
	<div class="clear"></div>
	<div class="shop_footer">
            <div class="shop_footer_link">
                <p>
                    <a href="">首页</a>|
                    <a href="">招聘英才</a>|
                    <a href="">广告合作</a>|
                    <a href="">关于ShopCZ</a>|
                    <a href="">关于我们</a>
                </p>
            </div>
            <div class="shop_footer_copy">
                <p>Copyright 2007-2013 ShopCZ Inc.,All rights reserved.<br />d by ShopCZ 2.4 </p>
            </div>
        </div>
	<!-- Footer End -->

</body>
<script type="text/javascript">
		$('.shop_good_add').click(function(){
			 var goodsid = $(this).parent().parent().children('.gwc_list_id').text();
			 $.ajax({
				url:"favorite/addfavorite",
				type:"post",
				data:{goodsid:goodsid,userid:${user.userid}},
				success:function(result){
					if(result == "收藏成功！"){
						alert(result);	
					}else if(result == "您已收藏该商品！"){
						alert(result);
					}else{
						alert(result);
					}
					
				},
				error:function() {
					alert("失败");
				}
				
			});
		});
		$('.shop_good_delete').click(function(){
			 var $tr = $(this).parent().parent();
			 var goodid = $tr.children('.gwc_list_id').text();
			 console.log(goodid);
			 $.ajax({
				url:"shopcart/deleteGoods",
				type:"post",
				data:{goodsid:goodid},
				success:function(result){
					if(result == "删除成功！"){
						console.log(result);	
						$tr.remove();
						alert(result)
						
					}else{
						alert(result);
					}
					
				},
				error:function() {
					alert("失败");
				}
				
			});
		});

</script>
</html>