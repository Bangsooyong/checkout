
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Bootstrap E-commerce Templates</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">      
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- 추가 -->
		<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>	
		<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="themes/js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="#">My Account</a></li>
							<li><a href="cart.html">Your Cart</a></li>
							<li><a href="checkout.html">Checkout</a></li>					
							<li><a href="register.html">Login</a></li>			
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.html" class="logo pull-left"><img src="<c:url value='/resources/themes/images/logo.png" class="site_logo' />" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">Woman</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">Man</a></li>			
							<li><a href="./products.html">Sport</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">Hangbag</a></li>
							<li><a href="./products.html">Best Seller</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav>
				</div>
			</section>				
			<section class="header_text sub">
			<img class="pageBanner" src="<c:url value='/resources/themes/images/pageBanner.png' />" alt="New products" >
				<h4><span>Shopping Cart</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
						
						
					<!------------------------ *** 장바구니 공사 !!! *** ------------------------->
						
						
						
						<table class="table table-striped"> 
				<!-- 
						<thead>태그는 표의 머리글 역할을 하며, <th>태그를 이용한다.
						<tfoot>태그는 표의 바닥글 역할을 한다.
						<tbody>태그는 본문이 들어가는 행의 묶음이다.
							THEAD, TFOOT, TBODY 태그들은 기술순서를 지켜야한다.
				-->
							<thead><!-- 표의 머리글 역할 -->
								<tr>
									<!-- <th>Remove</th> -->
									<th><input type="checkbox" class="checkall" 
										onclick="allChk(this);" checked="checked"></th>
									<th>Image</th>
									<th>Product Name</th>
									<th>Option</th>
									<th>Unit Price</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							
							
							<tbody><!-- 본문이 들어가는 행의 묶음-->
								<c:forEach var="vo" items="${cartList}">
									<tr>
										<td><input type="checkbox" value="${vo.c_no}" name="RowCheck"
												class="checkbox" checked="checked"></td>
										<td><img src="http://i.imgur.com/wB73OvB.jpg" style="width: 50px" /></td><!-- ** TODO: url값을 받아와야 한다. -->
										<td>${vo.p_name }</td>
										<td>${vo.o_cont }</td>
										<td>${vo.p_price }</td>
										<td><form action="updateCartBuyCnt" method="get">
												<input style="width: 20px;" value="${vo.buy_cnt }" name="buy_cnt">
												<input type="hidden" value="${vo.c_no}" name="c_no">
												<span><input type="submit" value="수정"></span>
											</form></td>
										<td>${vo.p_price * vo.buy_cnt }<input type="hidden" value=${vo.p_price * vo.buy_cnt } class="CartTotal"></td>
									</tr>
									<!--http://idevsigner.tistory.com/6  -->
								</c:forEach>
							
							
							<%-- 	
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/9.jpg' />"></a></td>
									<td>Fusce id molestie massa</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$2,350.00</td>
									<td>$2,350.00</td>
								</tr>	
										  
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/1.jpg' />"></a></td>
									<td>Luctus quam ultrices rutrum</td>
									<td><input type="text" placeholder="2" class="input-mini"></td>
									<td>$1,150.00</td>
									<td>$2,450.00</td>
								</tr>
								
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/3.jpg' />"></a></td>
									<td>Wuam ultrices rutrum</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$1,210.00</td>
									<td>$1,123.00</td>
								</tr>
								 --%>
								
								<tr>
									<td>&nbsp;</td><!-- 공백(스페이스 한 칸)  -->
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong>$400,000</strong></td>
									
								</tr>		  
							</tbody>
						</table>
						<div>
		총 구매 가격 :
		<!-- 총 가격 -->
		<input id="price" value="0" readonly="readonly">
	</div>
	<input type="button" value="장바구니에서 삭제" class="deleteall">

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
						
						
						
					<!------------------------ *** 장바구니 공사 !!! *** ------------------------->
						
						
						
						
						
						<h4>What would you like to do next?</h4>
						<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
							Use Coupon Code
						</label>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							Estimate Shipping &amp; Taxes
						</label>
						<hr>
						<p class="cart-total right">
							<strong>Sub-Total</strong>:	$100.00<br>
							<strong>Eco Tax (-2.00)</strong>: $2.00<br>
							<strong>VAT (17.5%)</strong>: $17.50<br>
							<strong>Total</strong>: $119.50<br>
						</p>
						<hr/>
						<p class="buttons center">				
							<button class="btn" type="button">Update</button>
							<button class="btn" type="button">Continue</button>
							<button class="btn btn-inverse" type="submit" id="checkout">Checkout</button>
						</p>					
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">SUB CATEGORIES</li>
								<li><a href="products.html">Nullam semper elementum</a></li>
								<li class="active"><a href="products.html">Phasellus ultricies</a></li>
								<li><a href="products.html">Donec laoreet dui</a></li>
								<li><a href="products.html">Nullam semper elementum</a></li>
								<li><a href="products.html">Phasellus ultricies</a></li>
								<li><a href="products.html">Donec laoreet dui</a></li>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">MANUFACTURES</li>
								<li><a href="products.html">Adidas</a></li>
								<li><a href="products.html">Nike</a></li>
								<li><a href="products.html">Dunlop</a></li>
								<li><a href="products.html">Yamaha</a></li>
							</ul>
						</div>
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
													<a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/2.jpg' />"></a><br/>
													<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
													<a href="#" class="category">Suspendisse aliquet</a>
													<p class="price">$261</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/4.jpg'/>"></a><br/>
													<a href="product_detail.html" class="title">Tempor sem sodales</a><br/>
													<a href="#" class="category">Urna nec lectus mollis</a>
													<p class="price">$134</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>						
					</div>
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="./index.html">Homepage</a></li>  
							<li><a href="./about.html">About Us</a></li>
							<li><a href="./contact.html">Contac Us</a></li>
							<li><a href="./cart.html">Your Cart</a></li>
							<li><a href="./register.html">Login</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="<c:url value='/resources/themes/images/logo.png" class="site_logo' />" alt=""></p>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="resources/themes/js/common.js"></script>
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.html";
				})
			});
		</script>	
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var finalCartPrice = 0; // 최종가격 변수
		price();
		function price() {
			finalCartPrice = 0; // 최대값 구할때 처럼 미리 변수를 설정해 놓는다.
			var chkObj = document.getElementsByName("RowCheck"); // 장바구니에 체크된 전체 리스트의 목록을 배열로 받는다.

			var rowCnt = chkObj.length - 1;
			for (var i = 0; i <= rowCnt; i++) {
				//console.logchkObj[i].parentNode.parentNode();
				var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// String 에서 숫자로 변환
				finalCartPrice += text1;
			}
			$("#price").val(finalCartPrice);
		}

		var $inputs = $('input[type="checkbox"]')

		$inputs
				.change(function() {
					finalCartPrice = 0;
					var chkObj = document.getElementsByName("RowCheck");

					var rowCnt = chkObj.length;
					var totalval = 0;
					for (var i = 0; i < rowCnt; i++) {
						if (chkObj[i].checked == true) {
							var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// String 에서 숫자로 변환
							finalCartPrice += text1;
							$("#price").val(finalCartPrice)
						} else {
							totalval += 1;
							$("#checkall").prop('checked', false);
						}
					}
					if (totalval == rowCnt) {
						$("#price").val(0)
					}

				});

		/////////////////////////////////////////////////////////
		// 체크박스 올체크
		function allChk(obj) {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length - 1;
			var check = obj.checked;
			if (check) {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox")
						chkObj[i].checked = true;
				}
			} else {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox") {
						chkObj[i].checked = false;
						$("#price").val(0)
					}
				}
			}
		}

		// 장바구니 삭제 이벤트
		$('.deleteall')
				.on(
						"click",
						function(event) {
							var tb = $(this).attr('title');
							var sel = false;
							var ch = $('input[name="RowCheck"]:checked');
							var c = confirm('정말로 삭제하시겠어요?');
							if (c) {
								ch.each(function() {
											var $this = $(this);
											if ($this.is(':checked')) {
												sel = true; //set to true if there is/are selected row
												$this.parents('tr').fadeOut(function() {
																	$.ajax({
																				type : 'post',
																				url : 'deleteCart',
																				headers : {
																					'Accept' : 'application/json',
																					'Content-Type' : 'application/json'
																				},
																				data : $(
																						'input[name="RowCheck"]:checked').val(),
																				success : function(result) {
																					if (result == 1) {
																						$("#price").val(0)
																					} else {

																					}
																				}
																			});
																	$this
																			.remove(); //remove row when animation is finished
																});
											}
										});
								if (!sel)
									alert('체크박스를 선택하세요');
							}
							return false;
						});

		// 주문 및 총 계산 이벤트
	</script>
		
			
    </body>
</html>