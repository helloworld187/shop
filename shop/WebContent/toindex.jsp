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
       
        
</head>
<body>
	<!-- Header  -wll-2013/03/24 -->
	<div class="shop_hd">
		<!-- Header TopNav -->
		<div class="shop_hd_topNav">
			<div class="shop_hd_topNav_all">
				<!-- Header TopNav Left -->
				<div class="shop_hd_topNav_all_left">
					<p>您好，欢迎来到<b><a href="toindex.jsp">ShopCZ商城</a></b>[<font style="color:red">${user.username}</font>]&nbsp;&nbsp;&nbsp;&nbsp;余额：<font style="color:red">${user.money}</font>元</p>
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
						              <li><a title="我的订单" target="_top" href="order/findAllOrders">我的订单</a>
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
						              <li><a href="uploadgoods.jsp" title="上传商品" target="_top">上传商品</a></li>
						              <li><a title="销售中的商品" target="_top" href="#">销售中的商品</a></li>
						            </ul>
						        </div>
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="shopcart/findGoodsid" class="topNavHover">购物车</a>
								<!--<div class="topNav_menu_bd" style="display:none;">
									
						            <ul>
						              <li><a title="已售出的商品" target="_top" href="#">已售出的商品</a></li>
						              <li><a title="销售中的商品" target="_top" href="#">销售中的商品</a></li>
						            </ul>
						        	
						            <p>还没有商品，赶快去挑选！</p>

						        </div>
						        -->
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="favorite/findFavoriteGoods" class="topNavHover">我的收藏</a>
								<!-- <div class="topNav_menu_bd" style="display:none;">
						            <ul>
						              <li><a title="收藏的商品" target="_top" href="favorite/findFavoriteGoods">收藏的商品</a></li>
						              <li><a title="收藏的店铺" target="_top" href="#">收藏的店铺</a></li>
						            </ul>
						        </div> -->
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="#" class="topNavHover">个人中心<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
						            <ul>
                                      <li><a title="上传头像" target="_top" href="uploadAvator.jsp">上传头像</a></li>
						              <li><a title="修改个人信息" target="_top" href="user/findUser">修改个人信息</a></li>
						            </ul>
						        </div>
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
				<div class="shop_hd_menu_all_category_title"><h2 title="所有商品分类"><a href="javascript:void(0);">所有商品分类</a></h2><i></i></div>
				<div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
					<ul class="shop_hd_menu_all_category_hd_menu clearfix" id="menu">	
					</ul>
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
	<!-- Header End -->
	

	<!-- Body -wll-2013/03/24 -->
	<div class="shop_bd clearfix">
            <!-- 第一块区域  -->
            <div class="shop_bd_top clearfix">
                <div class="shop_bd_top_left"></div>
                <div class="shop_bd_top_center">
                    <!-- 图片切换  begin  -->
                    <div class="xifan_sub_box">
                      <div id="p-select" class="sub_nav"><div class="sub_no" id="xifan_bd1lfsj"> <ul></ul></div></div>
                      <div id="xifan_bd1lfimg">
                        <div>
                          <dl class=""></dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/e2dfe57add8fff66ed0964b1effd39b9.jpg" alt="2011城市主题公园亲子游"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">2011城市主题公园亲子游</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/e50b5d398e3b890f08e14defbc71a94d.jpg" alt="潜入城市周边清幽之地"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">潜入城市周边清幽之地</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/196b173f15685a2019ab3396cd1851a4.jpg" alt="盘点中国最美雪山"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">盘点中国最美雪山</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/e81345cbc3d8a7e11f9a0e09df68221d.jpg" alt="2011西安世园会攻略"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">2011西安世园会攻略</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/65662b58848da87812ba371c7ff6c1ad.jpg" alt="五月乐享懒人天堂塞班岛"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">五月乐享懒人天堂塞班岛</a></h2></dd>
                          </dl>

                                  <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/e50b5d398e3b890f08e14defbc71a94d.jpg" alt="潜入城市周边清幽之地"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">潜入城市周边清幽之地</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/196b173f15685a2019ab3396cd1851a4.jpg" alt="盘点中国最美雪山"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">盘点中国最美雪山</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/e81345cbc3d8a7e11f9a0e09df68221d.jpg" alt="2011西安世园会攻略"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">2011西安世园会攻略</a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="images/65662b58848da87812ba371c7ff6c1ad.jpg" alt="五月乐享懒人天堂塞班岛"></a></dt>
                            <dd><h2><a href="http://www.zztuku.com" target="_blank">五月乐享懒人天堂塞班岛</a></h2></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                    <script type="text/javascript">movec();</script> 
                    <!-- 图片切换  end --> 
                    <div class="clear"></div>
                    <div class="shop_bd_top_center_hot"><img src="images/index.guanggao.png" /></div>
                </div>
                
                <!-- 右侧 -->
                <div class="shop_bd_top_right clearfix">
                    <div class="shop_bd_top_right_quickLink">
                        <a href="goods/touploadgoods" class="login" title="我要开店"><i></i>我要开店</a>
                        <a href="register.jsp" class="register" title="免费注册"><i></i>免费注册</a>
                        <a href="news.jsp" class="join" title="公告提示" ><i></i>公告提示</a>
                    </div>
                    
                    <div class="shop_bd_top_right-style1 nc-home-news">
                        <ul class="tabs-nav">
                            <li><a href="javascript:void(0);" class="hover">商城广告</a></li>
                            <li><a href="javascript:void(0);">关于我们</a></li>
                        </ul>
                        <div class="clear"></div>
                        <div class="tabs-panel">
                            <ul class="list-style01">
                                <li><a title="如何申请开店" href="article-15.html">如何申请开店</a><span>(2011-01-11)</span></li>
                                <li><a title="商城商品推荐" href="article-14.html">商城商品推荐</a><span>(2011-01-11)</span></li>
                                <li><a title="如何发货" href="article-13.html">如何发货</a><span>(2011-01-11)</span></li>
                                <li><a title="查看售出商品" href="article-12.html">查看售出商品</a><span>(2011-01-11)</span></li>
                                <li><a title="如何管理店铺" href="article-11.html">如何管理店铺</a><span>(2011-01-11)</span></li>
                                <li><a title="如何申请开店" href="article-15.html">如何申请开店</a><span>(2011-01-11)</span></li>
                                <li><a title="商城商品推荐" href="article-14.html">商城商品推荐</a><span>(2011-01-11)</span></li>
                                <li><a title="如何发货" href="article-13.html">如何发货</a><span>(2011-01-11)</span></li>
                                <li><a title="查看售出商品" href="article-12.html">查看售出商品</a><span>(2011-01-11)</span></li>
                                <li><a title="如何管理店铺" href="article-11.html">如何管理店铺</a><span>(2011-01-11)</span></li>
                                
                                
                            </ul>
                        </div>
                    </div>
                    
                    
                </div>
                <!-- 右侧 End -->
            </div>
            <div class="clear"></div>
            <!-- 第一块区域 End -->
            
            <!-- 第二块区域 -->
            <div class="shop_bd_2 clearfix">
                <!-- 特别推荐 -->
                <div class="shop_bd_tuijian">
                    <ul class="tuijian_tabs">
                        <li class="hover"  onmouseover="easytabs('1', '1');" onfocus="easytabs('1', '1');" onclick="return false;" id="tuijian_content_btn_1"><a href="javascript:void(0);">特别推荐</a></li>
                        <li onmouseover="easytabs('1', '2');" onfocus="easytabs('1', '2');" onclick="return false;" id="tuijian_content_btn_2" ><a href="javascript:void(0);">热门商品</a></li>
                        <li onmouseover="easytabs('1', '3');" onfocus="easytabs('1', '3');" onclick="return false;" id="tuijian_content_btn_3"><a href="javascript:void(0);">新品上架</a></li>
                    </ul>
                    <div class="tuijian_content">
                        <div id="tuijian_content_1" class="tuijian_shangpin" style="display: block;">
                            <ul>
                                <li>
                                    <dl>
                                        <dt><img src="images/yifu.jpg" width="160" height="121" /></dt>
                                        <dd>东大门过膝棉服女冬季中长款棉袄棉衣外套潮</dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><img src="images/clo.jpg" width="160" height="121"/></dt><dd>夹棉加厚面包服棉衣中长款宽松过膝棉服棉袄外套</dd>
                                        <dd> 商城价：<em>234.00</em>元</dd>
                                    </dl>
                                </li>
                                
                                <li>
                                    <dl>
                                        <dt><img src="images/red.jpg" width="160" height="121"/></dt>
                                        <dd>圣诞红色大毛领长款工装厚外套东大门过膝棉服大衣女显瘦</dd>
                                        <dd> 商城价：<em>378.00</em>元</dd>
                                    </dl>
                                </li>
                                
                                <li>
                                    <dl>
                                        <dt><img src="images/pink.jpg" width="160" height="121"/></dt>
                                        <dd>格子棉服女中长款新款潮ins面包服棉袄外套加厚</dd>
                                        <dd> 商城价：<em>119.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><img src="images/22.jpg" width="160" height="121"/></dt>
                                        <dd>喵吉复古棉袄外套中长款宽松棉服毛毛领红色棉衣女冬加厚</dd>
                                        <dd> 商城价：<em>289.00</em>元</dd>
                                    </dl>
                                </li>
                                
                            </ul>
                        </div>
                        
                        <div id="tuijian_content_2" class="tuijian_shangpin">
                            <ul>
                                <li>
                                    <dl>
                                        <dt><img src="images/hh.jpg" width="160" height="121"/></dt>
                                        <dd>面包服短款2018新款羽绒棉服oversize棉衣ins外套女冬港风</dd>
                                        <dd> 商城价：<em>296.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><img src="images/yy.jpg" width="160" height="121"/></dt>
                                        <dd>面包服短款2018新款羽绒棉服oversize棉衣ins外套女冬港风</dd>
                                        <dd> 商城价：<em>326.00</em>元</dd>
                                    </dl>
                                </li>
                                
                                <li>
                                    <dl>
                                        <dt><img src="images/ss.jpg" width="160" height="121"/></dt>
                                        <dd>面包服短款2018新款羽绒棉服oversize棉衣ins外套女冬港风</dd>
                                        <dd> 商城价：<em>196.00</em>元</dd>
                                    </dl>
                                </li>
                                
                                <li>
                                    <dl>
                                        <dt><img src="images/hh.jpg" width="160" height="121"/></dt>
                                        <dd>面包服短款2018新款羽绒棉服oversize棉衣ins外套女冬港风</dd>
                                        <dd> 商城价：<em>296.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><img src="images/pp.jpg" width="160" height="121"/></dt>
                                        <dd>面包服短款2018新款羽绒棉服oversize棉衣ins外套女冬港风</dd>
                                        <dd> 商城价：<em>223.00</em>元</dd>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                        <div id="tuijian_content_3" class="tuijian_shangpin tuijian_content">
                            <ul>
                                <li>
                                    <dl>
                                        <dt><img src="images/ba.jpg" width="160" height="121"/></dt>
                                        <dd>秋冬季气质韩版棉服马甲+卫衣+灯芯绒裤直筒时尚套装两件套女</dd>
                                        <dd> 商城价：<em>156.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><img src="images/xx.jpg" width="160" height="121"/></dt>
                                        <dd>秋冬季气质韩版棉服马甲+卫衣+灯芯绒裤直筒时尚套装两件套女</dd>
                                        <dd> 商城价：<em>156.00</em>元</dd>
                                    </dl>
                                </li>
                                
                                <li>
                                    <dl>
                                        <dt><img src="images/22.jpg" width="160" height="121"/></dt>
                                        <dd>秋冬季气质韩版棉服马甲+卫衣+灯芯绒裤直筒时尚套装两件套女</dd>
                                        <dd> 商城价：<em>199.00</em>元</dd>
                                    </dl>
                                </li>
                                
                                <li>
                                    <dl>
                                        <dt><img src="images/77.jpg" width="160" height="121"/></dt>
                                        <dd>秋冬季气质韩版棉服马甲+卫衣+灯芯绒裤直筒时尚套装两件套女</dd>
                                        <dd> 商城价：<em>257.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><img src="images/33.jpg" width="160" height="121"/></dt>
                                        <dd>秋冬季气质韩版棉服马甲+卫衣+灯芯绒裤直筒时尚套装两件套女</dd>
                                        <dd> 商城价：<em>156.00</em>元</dd>
                                    </dl>
                                </li>
                                
                            </ul>
                        </div>
                        
                    </div>

                </div>
                <!-- 特别推荐 End -->
                
                
                
            </div>
            
            <!-- 第三块区域 End -->
          
            <div class="faq">
                <dl>
                    <dt>帮助中心</dt>
                    <dd><a href=""><span>积分兑换说明</span></a></dd>
                    <dd><a href=""><span>积分明细</span></a></dd>
                    <dd><a href=""><span>查看已购买商</span></a></dd>
                    <dd><a href=""><span>我要买</span></a></dd>
                    <dd><a href=""><span>忘记密码</span></a></dd>
                </dl>
                
                <dl>
                    <dt>店主之家</dt>
                    <dd><a href=""><span>如何申请开店</span></a></dd>
                    <dd><a href=""><span>商城商品推荐</span></a></dd>
                    <dd><a href=""><span>如何发货</span></a></dd>
                    <dd><a href=""><span>查看已售商品</span></a></dd>
                    <dd><a href=""><span>如何管理店铺</span></a></dd>
                </dl>
                
                <dl>
                    <dt>支付方式</dt>
                    <dd><a href=""><span>公司转账</span></a></dd>
                    <dd><a href=""><span>邮局汇款</span></a></dd>
                    <dd><a href=""><span>分期付款</span></a></dd>
                    <dd><a href=""><span>在线支付</span></a></dd>
                    <dd><a href=""><span>如何注册支付</span></a></dd>
                </dl>
                
                <dl>
                    <dt>售后服务</dt>
                    <dd><a href=""><span>退款申请</span></a></dd>
                    <dd><a href=""><span>返修/退换货</span></a></dd>
                    <dd><a href=""><span>退换货流程</span></a></dd>
                    <dd><a href=""><span>退换货政策</span></a></dd>
                    <dd><a href=""><span>联系卖家</span></a></dd>
                </dl>
                
                <dl>
                    <dt>客服中心</dt>
                    <dd><a href=""><span>修改收货地址</span></a></dd>
                    <dd><a href=""><span>商品发布</span></a></dd>
                    <dd><a href=""><span>会员修改个人</span></a></dd>
                    <dd><a href=""><span>会员修改密码</span></a></dd>
                    
                </dl>
                
                <dl>
                    <dt>关于我们</dt>
                    <dd><a href=""><span>合作及洽谈</span></a></dd>
                    <dd><a href=""><span>招聘英才</span></a></dd>
                    <dd><a href=""><span>联系我们</span></a></dd>
                    <dd><a href=""><span>关于Shop</span></a></dd>
                </dl>
                
                
            </div>
            <div class="clear"></div>
	</div>
	<!-- Body End -->

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
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"category/find",
			type:"post",
			dataType:"json",
			success:function(list){
				//qList = JSON.stringify(list);
				//qList = JSON.parse(qList);
				//console.log(qList);
				$.each(list, function(index, category) {
					$("#menu").append('<li id="cat_1" class=""><h3><a href="goods/findbycategoryid?categoryid='+category.categoryid+'" title="'+category.categoryname+'">'+
							category.categoryname+'</a></h3></li>');
				});
				$("#menu").append('<li class="more"><a href="">查看更多分类</a></li>');
				//for(var i=1;i<8;i++){
					//$("#menu").prepend('<li id="cat_1" class=""><h3><a href="" title="'+qList[i].categoryname+'">'+
					//qList[i].categoryname+'</a></h3></li>');

				//}
			},
			error:function() {
				alert("失败");
			}
		});
	});
</script>
</html>