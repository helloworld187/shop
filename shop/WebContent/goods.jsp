<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<base href="${pageContext.request.contextPath}/"/>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>商品详细页面</title>
	<link rel="stylesheet" href="css/base.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_header.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_list.css" type="text/css" />
    <link rel="stylesheet" href="css/shop_goods.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.js" ></script>
    <script type="text/javascript" src="js/topNav.js" ></script>
    <script type="text/javascript" src="js/shop_goods.js" ></script>
    <script type="text/javascript">
    $(function(){
		var gid = getQueryString("goodsid");
		$.ajax({
			url:"comment/findAll",
			type:"post",
			data:{goodsid:gid},
			success:function(result){
				console.log(result);
				$.each(result,function(index,comment){
					$(".shop_goods_bd_xiangqing_content").append(
						'<div class="comment_list">'+
						'<div class="avatar"><img src="images/user.gif"'+
						'<span>'+comment.userid+'</span></div>'+
						'<div class="comment_list_content">'+
						'<div class="comment_list_content_l">'+
						'<p class="tit">'+
						'<span class="time">'+comment.ccreattime+'</span>'+
						'<span class="star"><i class="cur"></i>'+
						'<i></i><i></i><i></i><i></i></span></p><p class="con">'+
						comment.content+'</p></div><div class="comment_list_content_r">'+
						'<a href="javascript:">有用 (<i>1</i>)</a>'+
						'<a href="javascript:">没用 (<i>2</i>)</a></div></div></div>');
				});
			},
			error:function(){
				alert("失败");
			}
		});
	});

	function add(){
		$.ajax({
			url:"shopcart/addShopcart",
			type:"post",
			data:{goodsid:${GoodsList.goodsid},userid:${user.userid}},
			success:function(result){
				if(result == "添加成功！"){
					alert(result);	
				}else if(result == "您已添加该商品"){
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

	//截取地址栏中url的参数值
	function getQueryString(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	    var r = window.location.search.substr(1).match(reg);
	    if (r != null)
	        return unescape(r[2]);
	    return null;
	}
	function reply(){
		var gid = getQueryString("goodsid"); 
		var contents = $(".replys").val();
		if(contents == ""){
			alert("评论不能为空");
		}else{
			$.ajax({
			url:"comment/postComment",
			type:"post",
			data:{goodsid:gid,userid:${user.userid},content:contents},
			success:function(result){
				if(result[0] == "发表成功！"){
					alert(result[0]);
					var creattime = result[1];
					var uname = result[2];
					$(".shop_goods_bd_xiangqing_content").append(
						'<div class="comment_list">'+
						'<div class="avatar"><img src="images/user.gif"'+
						'<span>'+uname+'</span></div>'+
						'<div class="comment_list_content">'+
						'<div class="comment_list_content_l">'+
						'<p class="tit">'+
						'<span class="time">'+creattime+'</span>'+
						'<span class="star"><i class="cur"></i>'+
						'<i></i><i></i><i></i><i></i></span></p><p class="con">'+
						contents+'</p></div><div class="comment_list_content_r">'+
						'<a href="javascript:">有用 (<i>1</i>)</a>'+
						'<a href="javascript:">没用 (<i>2</i>)</a></div></div></div>');	
					$
					
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
			<a href="">商品分类</a>&nbsp;›&nbsp;
			<a href="">男装女装</a>&nbsp;›&nbsp;
			<a href="">男装</a>
		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->
	
	<!-- Goods Body -->
	<div class="shop_goods_bd clear">

		<!-- 商品展示 -->
		<div class="shop_goods_show">
			<div class="shop_goods_show_left">
				<!-- 京东商品展示 -->
				<link rel="stylesheet" href="css/shop_goodPic.css" type="text/css" />
				<script type="text/javascript" src="js/shop_goodPic_base.js"></script>
				<script type="text/javascript" src="js/lib.js"></script>
				<script type="text/javascript" src="js/163css.js"></script>
				<div id="preview">
					<div class=jqzoom id="spec-n1" onClick="window.open('/')"><IMG height="350" src="images/img04.jpg" jqimg="images/img04.jpg" width="350">
						</div>
						<div id="spec-n5">
							<div class=control id="spec-left">
								<img src="images/left.gif" />
							</div>
							<div id="spec-list">
								<ul class="list-h">
									<c:forEach items ="${Pictures}" var="pic">
										<li><img src="${pic.path}"/> </li>
									</c:forEach>
									<!--
									<li><img src="images/img01.jpg"> </li>
									<li><img src="images/img02.jpg"> </li>
									<li><img src="images/img03.jpg"> </li>
									<li><img src="images/img04.jpg"> </li>
									<li><img src="images/img01.jpg"> </li>
									<li><img src="images/img02.jpg"> </li>
									<li><img src="images/img03.jpg"> </li>
									<li><img src="images/img04.jpg"> </li>
									<li><img src="images/img01.jpg"> </li>
									<li><img src="images/img02.jpg"> </li>
									<li><img src="images/img03.jpg"> </li>
									<li><img src="images/img04.jpg"> </li>
								-->
								</ul>
							</div>
							<div class=control id="spec-right">
								<img src="images/right.gif" />
							</div>
							
					    </div>
					</div>

					<SCRIPT type=text/javascript>
						$(function(){			
						   $(".jqzoom").jqueryzoom({
								xzoom:400,
								yzoom:400,
								offset:10,
								position:"right",
								preload:1,
								lens:1
							});
							$("#spec-list").jdMarquee({
								deriction:"left",
								width:350,
								height:56,
								step:2,
								speed:4,
								delay:10,
								control:true,
								_front:"#spec-right",
								_back:"#spec-left"
							});
							$("#spec-list img").bind("mouseover",function(){
								var src=$(this).attr("src");
								$("#spec-n1 img").eq(0).attr({
									src:src.replace("\/n5\/","\/n1\/"),
									jqimg:src.replace("\/n5\/","\/n0\/")
								});
								$(this).css({
									"border":"2px solid #ff6600",
									"padding":"1px"
								});
							}).bind("mouseout",function(){
								$(this).css({
									"border":"1px solid #ccc",
									"padding":"2px"
								});
							});				
						})
						</SCRIPT>
					<!-- 京东商品展示 End -->

			</div>
			<div class="shop_goods_show_right">
				<ul>
					<li>
						<strong style="font-size:14px; font-weight:bold;">${GoodsList.gdescription}</strong>
					</li>
					<li>
						<label>价格：</label>
						<span><strong>${GoodsList.gprice}</strong>元</span>
					</li>
					<li>
						<label>运费：</label>
						<span>卖家承担运费</span>
					</li>
					<li>
						<label>累计售出：</label>
						<span>99件</span>
					</li>
					<li>
						<label>评价：</label>
						<span>0条评论</span>
					</li>
					<li class="goods_num">
						<label>购买数量：</label>
						<span><a class="good_num_jian" id="good_num_jian" href="javascript:void(0);"></a><input type="text" value="1" id="good_nums" class="good_nums" /><a href="javascript:void(0);" id="good_num_jia" class="good_num_jia"></a>(当前库存0件)</span>
					</li>
                    <li class="goods_num">
						<label>商品总价：</label>
						&yen;<span id="good_count"></span>
					</li>
					<li style="padding:20px 0;">
						<label>&nbsp;</label>
						<span><a href="javascript:;" class="goods_sub goods_sub_gou" id="shopcart" onclick="add()" >加入购物车</a></span>
					</li>
				</ul>
			</div>
		</div>
		<!-- 商品展示 End -->

		<div class="clear mt15"></div>
		<!-- Goods Left -->
		<div class="shop_bd_list_left clearfix">
			<!-- 左边商品分类 -->
			
			<!-- 左边商品分类 End -->

			<!-- 热卖推荐商品 -->
			
			<!-- 热卖推荐商品 -->
			
			<!-- 浏览过的商品 -->
			<div class="shop_bd_list_bk clearfix">
				<div class="title">热卖推荐商品</div>
				<div class="contents clearfix">
					<ul class="clearfix">			
						<li class="clearfix">
							<div class="goods_name"><a href="">冬季棉衣女长款过膝工装外套大毛领宽松收腰加厚羽绒</a></div>
							<div class="goods_pic"><span class="goods_price">¥ 279.00 </span><a href=""><img src="images/lleft.jpg" style="width: 170px;height: 170px;" /></a></div>
							<div class="goods_xiaoliang">
								<span class="goods_xiaoliang_link"><a href="">去看看</a></span>
								<span class="goods_xiaoliang_nums">已销售<strong>99</strong>笔</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="shop_bd_list_bk clearfix">
				<div class="title">热卖推荐商品</div>
				<div class="contents clearfix">
					<ul class="clearfix">			
						<li class="clearfix">
							<div class="goods_name"><a href="">女装韩版立领夹棉加厚棉衣中长款宽松过膝棉服棉袄</a></div>
							<div class="goods_pic"><span class="goods_price">¥ 259.00 </span><a href=""><img src="images/lleft2.jpg" /></a></div>
							<div class="goods_xiaoliang">
								<span class="goods_xiaoliang_link"><a href="">去看看</a></span>
								<span class="goods_xiaoliang_nums">已销售<strong>99</strong>笔</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- 浏览过的商品 -->

		</div>
		<!-- Goods Left End -->

		<!-- 商品详情 -->
		<script type="text/javascript" src="js/shop_goods_tab.js"></script>
		<div class="shop_goods_bd_xiangqing clearfix">
			<div class="shop_goods_bd_xiangqing_tab">
				<ul>
					<li id="xiangqing_tab_1" onmouseover="shop_goods_easytabs('1', '1');" onfocus="shop_goods_easytabs('1', '1');" onclick="return false;"><a href=""><span>商品评论</span></a></li>
					<!-- <li id="xiangqing_tab_2" onmouseover="shop_goods_easytabs('1', '2');" onfocus="shop_goods_easytabs('1', '2');" onclick="return false;"><a href=""><span>评论列表</span></a></li>
					<li id="xiangqing_tab_3" onmouseover="shop_goods_easytabs('1', '3');" onfocus="shop_goods_easytabs('1', '3');" onclick="return false;"><a href=""><span>商品咨询</span></a></li> -->
				</ul>
			</div>
			<style type="text/css">
				.comment_list{width: 100%;height: auto;clear: both;margin-bottom: 20px;float: left;border-bottom: 1px dotted #cccccc;padding-bottom: 10px;}
				.comment_list .avatar{width: 50px;height: auto;margin-right: 10px;float: left;}
				.comment_list .avatar img{width: 50px;height: 50px;overflow: hidden;}
				.comment_list .avatar span{height: 24px;line-height: 24px;display: inline-block;}
				.comment_list_content{width: 700px;height: auto;float: right;}
				.comment_list_content .comment_list_content_l{width: 500px;float: left;}
				.comment_list_content_l p.tit{width: 100%;height: 24px;line-height: 24px;}
				.comment_list_content_l p.tit span{margin-right: 10px;}
				.comment_list_content_l .star i{width: 13px;height: 13px;display: inline-block;background: url(images/star0.jpg);}
				.comment_list_content_l .star i.cur{background: url(images/star1.jpg);}
				.comment_list_content_l p.con{line-height: 150%;}
				.comment_list_content .comment_list_content_r{width: 200px;float: right;text-align: right;}
				.comment_list_content_r a{height: 24px;line-height: 24px;padding: 0 8px;display: inline-block;border: 1px solid #dfdfdf;border-radius: 3px;margin-top: 30px;color: #333333;}
				.comment_list_content_r a:hover{color: #cc0000;text-decoration: none;}
				.comment_list_content_r a i{font-style: normal;padding: 0 5px;color: #cc0000;font-weight: bold;}
				.replys:hover{					
					border:1px solid #FE8502;
				}
			</style>

			<div style="margin:10px;width: 750px;height: 100px;" >
				<textarea class="replys" rows="6" cols="104"></textarea>
			</div>
				<div>
					<input type="button" name="submit" value="发表" onclick="reply()" style="width: 100px;height: 30px;border: none;float:right;margin-right: 20px;color:white;background:#FE8502;border-radius: 5px;" />
				</div>
			<div class="shop_goods_bd_xiangqing_content clearfix" style="margin-top: 60px;">
				<!-- <div class="comment_list">
					<div class="avatar">
						<img src="images/user.gif">
						<span>zhang***</span>
					</div>
					<div class="comment_list_content">
						<div class="comment_list_content_l">
							<p class="tit">
								<span class="time">2015-07-24</span>
								<span class="star">
									<i class="cur"></i>
									<i></i>
									<i></i>
									<i></i>
									<i></i>
								</span>
							</p>
							<p class="con">
								裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
								裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
								裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
								裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
							</p>
						</div>
						<div class="comment_list_content_r">
							<a href="javascript:">有用 (<i>1</i>)</a>
							<a href="javascript:">没用 (<i>2</i>)</a>
						</div>
					</div>
				</div> -->
					<!--一条评论 结束-->

					
				</div>

				<!-- <div id="xiangqing_content_3" class="xiangqing_contents clearfix">
					<p>商品自诩3333</p>
				</div> -->
			</div>
		</div>
		<!-- 商品详情 End -->

	</div>
	<!-- Goods Body End -->

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
                <p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
            </div>
        </div>
	<!-- Footer End -->

</body>
</html>