<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>Cart</title>
</head>
<body>


	<h1>
		<span>Shopping Cart</span>
	</h1>

	<section class="main-content">
		<div class="row">
			<div class="span9">
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th>작품</th>
							<th>상품코드</th>
							<th>작품명</th>
							<th>마일리지</th>
							<th>판매가</th>
							<th>수량</th>
							<th>주문금액</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" value="option1"></td>
							<td><a href="product_detail.jsp"><img alt=""
									src="themes/images/ladies/9.jpg"></a></td>
							<td>Fusce id molestie massa</td>
							<td><input type="text" placeholder="1" class="input-mini"></td>
							<td>$2,350.00</td>
							<td>$2,350.00</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="option1"></td>
							<td><a href="product_detail.jsp"><img alt=""
									src="http://image.thefingers.co.kr/diyitem/webimage/small/00/S000007854.jpg"></a></td>

							<td>고양이와 생선팔찌</td>
							<td><input type="text" placeholder="2" class="input-mini"></td>
							<td>$1,150.00</td>
							<td>$2,450.00</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="option1"></td>
							<td><a href="product_detail.jsp"><img alt=""
									src="themes/images/ladies/3.jpg"></a></td>
							<td>Wuam ultrices rutrum</td>
							<td><input type="text" placeholder="1" class="input-mini"></td>
							<td>$1,210.00</td>
							<td>$1,123.00</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><strong>$3,600.00</strong></td>
						</tr>
					</tbody>
				</table>

				<hr>
				<p class="cart-total right">
					<strong>총 주문금액</strong>: $100.00<br>
					<!-- <strong>, <b> : 일부 텍스트를 진하게 표시하는 태그 -->
					<strong>주문작품수</strong>: 3개<br> <strong>마일리지 적립</strong>:
					$119.50<br> <strong>총 배송비</strong>: $119.50<br> <strong>작품
						총금액</strong>: $17.50<br>

				</p>
				<hr />
				<p class="buttons center">
					<button class="btn" type="button">Update</button>
					<button class="btn" type="button">Continue</button>
					<button class="btn btn-inverse" type="submit" id="checkout">Checkout</button>
				</p>
			</div>
	</section>
	<!--  /////////////////////////////////////  -->
<body>

	<div id="wrap" class="pngFix">
		<div class="container">
			<hr>
			<div id="contentWrap">
				<div class="titleWap noTitle2">
					<h1>장바구니</h1>
				</div>

				<div class="innerContent fullRange">
					<div class="contents">



						<!-- 장바구니 담겨있을때 -->
						<form name="baguniFrm" method="post"
							action="/lecpay/DIYShopBag_process.asp" onsubmit="return false">
							<input type="hidden" name="mode" value=""> <input
								type="hidden" name="jumundiv" value="1">


							<table class="boardType listStyle01">

								<thead>
									<tr>
										<th><input type="checkbox" class="check" name="chk_item3"
											onclick="fnCheckAll(this);"></th>
										<th>작품</th>
										<th>작품코드</th>
										<th>작품명 [옵션]</th>
										<th>마일리지</th>
										<th>판매가</th>
										<th>수량</th>
										<th>주문금액</th>
										<th>선택</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td colspan="9"><span>조건배송 작품 합계 금액 <strong>8,000</strong>
												원 + 배송비 <strong>2,400</strong> 원 = 총합계 <strong>10,400원</strong></span></td>
									</tr>
								</tfoot>
								<tbody>

									<input type="hidden" name="itemkey" value="7854_Z120">
									<input type="hidden" name="itemid" value="7854">
									<input type="hidden" name="itemoption" value="Z120">
									<input type="hidden" name="soldoutflag" value="N">
									<input type="hidden" name="limitordernoflag" value="500">
									<input type="hidden" name="foreignflag" value="N">
									<input type="hidden" name="dtypflag" value="3">

									<input type="hidden" name="mtypflag" value="">

									<input type="hidden" name="nophothofileflag" value="0">

									<tr>
										<td><input type="checkbox" class="check" name="chk_item"
											id="3" value="0"></td>
										<td><span><a
												href="javascript:TnGotoProduct('7854');"><img
													src="http://image.thefingers.co.kr/diyitem/webimage/small/00/S000007854.jpg"
													alt="고양이와 생선팔찌&nbsp;(<font color='#CC3333'>팔찌,파랑</font>)"
													style="width: 60px; height: 40px;"></a></span></td>
										<!-- for dev msg : 2016 the fingers renewal : 썸네일 이미지 사이즈 변경(style 속성 추가) / 해당 강좌명 alt 값 속성으로 넣어주세요.  // -->
										<td><span>7854</span></td>
										<td class="lt"><span><a
												href="javascript:TnGotoProduct('7854');">고양이와
													생선팔찌&nbsp;(<font color="#CC3333">팔찌,파랑</font>)
											</a> </span></td>
										<td><span>80 Point</span></td>
										<td><span> 8,000 원 </span></td>
										<td>

											<p>
												<span><input name="itemea" type="text"
													class="txtBasic ct" style="width: 28px" value="1"
													autocomplete="off"></span>
											</p>
											<p>
												<span><a href="javascript:EditItem('0');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/edit4.gif"
														alt="수정"></a></span>
											</p> <input type="hidden" name="chkolditemea" value="1">
										</td>
										<td><span> 8,000 원 </span></td>
										<td>

											<p>
												<span><a href="javascript:DirectOrder('0');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/now_order.gif"
														alt="바로 주문"></a></span>
											</p>

											<p>
												<span><a href="javascript:TnAddFavorite('7854');"><img
														src="http://image.thefingers.co.kr/2016/common/btn/interest_diy2.gif"
														alt="관심 작품 등록"></a></span>
											</p>

											<p>
												<span><a href="javascript:DelItem('0');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/delete3.gif"
														alt="삭제"></a></span>
											</p>
										</td>
									</tr>

								</tbody>
							</table>


							<table class="boardType listStyle01">

								<colgroup>
									<col width="40px">
									<col width="80px">
									<col width="70px">
									<col width="">
									<col width="75px">
									<col width="75px">
									<col width="75px">
									<col width="75px">
									<col width="90px">
									<!-- for dev msg : 2016 the fingers renewal : 두번째 col 사이즈 변경 //-->
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" class="check" name="chk_item4"
											onclick="fnCheckAll(this);"></th>
										<th>작품</th>
										<th>작품코드</th>
										<th>작품명 [옵션]</th>
										<th>마일리지</th>
										<th>판매가</th>
										<th>수량</th>
										<th>주문금액</th>
										<th>선택</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td colspan="9"><span>조건배송 작품 합계 금액 <strong>8,000</strong>
												원 + 배송비 <strong>2,500</strong> 원 = 총합계 <strong>10,500원</strong></span></td>
									</tr>
								</tfoot>
								<tbody>

									<input type="hidden" name="itemkey" value="7961_0000">
									<input type="hidden" name="itemid" value="7961">
									<input type="hidden" name="itemoption" value="0000">
									<input type="hidden" name="soldoutflag" value="N">
									<input type="hidden" name="limitordernoflag" value="5">
									<input type="hidden" name="foreignflag" value="N">
									<input type="hidden" name="dtypflag" value="3">

									<input type="hidden" name="mtypflag" value="">

									<input type="hidden" name="nophothofileflag" value="0">

									<tr>
										<td><input type="checkbox" class="check" name="chk_item"
											id="4" value="1"></td>
										<td><span><a
												href="javascript:TnGotoProduct('7961');"><img
													src="http://image.thefingers.co.kr/diyitem/webimage/small/00/S000007961.jpg"
													alt="갤럭시 요정 반지걸이&nbsp;" style="width: 60px; height: 40px;"></a></span></td>
										<!-- for dev msg : 2016 the fingers renewal : 썸네일 이미지 사이즈 변경(style 속성 추가) / 해당 강좌명 alt 값 속성으로 넣어주세요.  // -->
										<td><span>7961</span></td>
										<td class="lt"><span><a
												href="javascript:TnGotoProduct('7961');">갤럭시 요정
													반지걸이&nbsp;</a> </span></td>
										<td><span>80 Point</span></td>
										<td><span> 8,000 원 </span></td>
										<td>

											<p>
												<span><input name="itemea" type="text"
													class="txtBasic ct" style="width: 28px" value="1"
													autocomplete="off"></span>
											</p>
											<p>
												<span><a href="javascript:EditItem('1');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/edit4.gif"
														alt="수정"></a></span>
											</p> <input type="hidden" name="chkolditemea" value="1">
										</td>
										<td><span> 8,000 원 </span></td>
										<td>

											<p>
												<span><a href="javascript:DirectOrder('1');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/now_order.gif"
														alt="바로 주문"></a></span>
											</p>

											<p>
												<span><a href="javascript:TnAddFavorite('7961');"><img
														src="http://image.thefingers.co.kr/2016/common/btn/interest_diy2.gif"
														alt="관심 작품 등록"></a></span>
											</p>

											<p>
												<span><a href="javascript:DelItem('1');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/delete3.gif"
														alt="삭제"></a></span>
											</p>
										</td>
									</tr>

								</tbody>
							</table>

							<div class="subtitleWap tMar40">
								<h3 class="fs15 colorBk ftLt">조건배송 작품</h3>
								<p class="ftLt lMar10 tPad02">
									<a
										href="/corner/corner_good_detail.asp?lecturer_id=knittinggale">*
										knittinggale (니팅게일) 제품으로만 <strong>200,000 원 이상</strong> 구매시
										무료배송됩니다. (배송비 4,000 원)
									</a>
								</p>
							</div>
							<table class="boardType listStyle01">
								<caption>업체 조건배송 작품 목록</caption>
								<colgroup>
									<col width="40px">
									<col width="80px">
									<col width="70px">
									<col width="">
									<col width="75px">
									<col width="75px">
									<col width="75px">
									<col width="75px">
									<col width="90px">
									<!-- for dev msg : 2016 the fingers renewal : 두번째 col 사이즈 변경 //-->
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" class="check" name="chk_item5"
											onclick="fnCheckAll(this);"></th>
										<th>작품</th>
										<th>작품코드</th>
										<th>작품명 [옵션]</th>
										<th>마일리지</th>
										<th>판매가</th>
										<th>수량</th>
										<th>주문금액</th>
										<th>선택</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td colspan="9"><span>조건배송 작품 합계 금액 <strong>33,000</strong>
												원 + 배송비 <strong>4,000</strong> 원 = 총합계 <strong>37,000원</strong></span></td>
									</tr>
								</tfoot>
								<tbody>

									<input type="hidden" name="itemkey" value="7935_0011">
									<input type="hidden" name="itemid" value="7935">
									<input type="hidden" name="itemoption" value="0011">
									<input type="hidden" name="soldoutflag" value="N">
									<input type="hidden" name="limitordernoflag" value="200">
									<input type="hidden" name="foreignflag" value="N">
									<input type="hidden" name="dtypflag" value="3">

									<input type="hidden" name="mtypflag" value="">

									<input type="hidden" name="nophothofileflag" value="0">

									<tr>
										<td><input type="checkbox" class="check" name="chk_item"
											id="5" value="2"></td>
										<td><span><a
												href="javascript:TnGotoProduct('7935');"><img
													src="http://image.thefingers.co.kr/diyitem/webimage/small/00/S000007935-1.jpg"
													alt="자이언트 빅 얀&nbsp;(<font color='#CC3333'>601.linen</font>)"
													style="width: 60px; height: 40px;"></a></span></td>
										<!-- for dev msg : 2016 the fingers renewal : 썸네일 이미지 사이즈 변경(style 속성 추가) / 해당 강좌명 alt 값 속성으로 넣어주세요.  // -->
										<td><span>7935</span></td>
										<td class="lt"><span><a
												href="javascript:TnGotoProduct('7935');">자이언트 빅 얀&nbsp;(<font
													color="#CC3333">601.linen</font>)
											</a> </span></td>
										<td><span>330 Point</span></td>
										<td><span> 33,000 원 </span></td>
										<td>

											<p>
												<span><input name="itemea" type="text"
													class="txtBasic ct" style="width: 28px" value="1"
													autocomplete="off"></span>
											</p>
											<p>
												<span><a href="javascript:EditItem('2');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/edit4.gif"
														alt="수정"></a></span>
											</p> <input type="hidden" name="chkolditemea" value="1">
										</td>
										<td><span> 33,000 원 </span></td>
										<td>

											<p>
												<span><a href="javascript:DirectOrder('2');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/now_order.gif"
														alt="바로 주문"></a></span>
											</p>

											<p>
												<span><a href="javascript:TnAddFavorite('7935');"><img
														src="http://image.thefingers.co.kr/2016/common/btn/interest_diy2.gif"
														alt="관심 작품 등록"></a></span>
											</p>

											<p>
												<span><a href="javascript:DelItem('2');"><img
														src="http://image.thefingers.co.kr/academy2012/common/btn/delete3.gif"
														alt="삭제"></a></span>
											</p>
										</td>
									</tr>

								</tbody>
							</table>




							<div class="contBox4 tMar40">
								<dl class="registConfirmBox">
									<dt>
										<img
											src="http://image.thefingers.co.kr/academy2012/common/title/subtit_all_order_price.gif"
											alt="총 주문 금액">
									</dt>
									<dd>
										<div>
											<p class="rt">
												<span>주문작품수 <strong>3</strong>종 (<strong>3</strong>개)
												</span> <span>마일리지 적립 <strong>490</strong> Point
												</span> <span>총 배송비 <strong>8,900</strong> 원
												</span> <span>작품 총금액 <strong>49,000</strong> 원
												</span>
											</p>
										</div>
										<p class="rt">

											<span class="colorBk">총 합계 금액 <strong class="colorRe">57,900</strong>원
											</span>
										</p>
									</dd>
								</dl>
							</div>


							<div class="btnWrap tMar30">
								<p class="ct">
									<a href="javascript:GoShopping();"><img
										src="http://image.thefingers.co.kr/academy2012/common/btn/cart_continue2.gif"
										alt="계속 쇼핑하기"></a> <a href="javascript:PayNextSelected(1);"><img
										src="http://image.thefingers.co.kr/2016/common/btn/select_order.gif"
										alt="선택 작품 주문하기"></a> <a
										href="javascript:PayNext(baguniFrm,1,'');"><img
										src="http://image.thefingers.co.kr/2016/common/btn/all_order.gif"
										alt="전체 작품 주문하기"></a>
								</p>
							</div>
							<!-- //장바구니 담겨있을때 -->

						</form>

						<form name="reloadFrm" method="post"
							action="/lecpay/DIYShopBag_process.asp" onsubmit="return false;">
							<input type="hidden" name="mode" value=""> <input
								type="hidden" name="sitename" value="10x10"> <input
								type="hidden" name="itemid" value=""> <input
								type="hidden" name="itemoption" value=""> <input
								type="hidden" name="itemea" value="">
						</form>

						<form name="NextFrm" method="post"
							action="https://www.thefingers.co.kr/lecpay/DIYPayInfo.asp">
							<input type="hidden" name="sitename" value="10x10"> <input
								type="hidden" name="jumundiv" value="1"> <input
								type="hidden" name="subtotalprice" value="57900"> <input
								type="hidden" name="itemsubtotal" value="49000"> <input
								type="hidden" name="mileshopitemprice" value="0">
						</form>

						<form name="frmConfirm" method="post"
							action="/lecpay/DIYShopBag_process.asp">
							<input type="hidden" name="mode" value="add"> <input
								type="hidden" name="tp" value=""> <input type="hidden"
								name="fc" value="on"> <input type="hidden" name="itemid"
								value=""> <input type="hidden" name="itemoption"
								value=""> <input type="hidden" name="itemea" value="">
							<input type="hidden" name="requiredetail" value="">
						</form>


					</div>
				</div>
				<!--// for dev msg : 2016 the fingers renewal:문구 수정(상품, D.I.Y->작품/이미지 경로 변경(2016), alt값 수정) -->
			</div>
			<hr>
			<script>
				//더블클릭시 상하 스크롤 이동
				$(document).dblclick(
						function(e) {
							var evtTagNm = e.target.tagName;
							var evtClsNm = e.target.className;

							// 입력박스와 스피너에선 이동금지
							if ((evtTagNm != 'SELECT') && (evtTagNm != 'INPUT')
									&& (evtTagNm != 'TEXTAREA')
									&& (evtClsNm != "up")
									&& (evtClsNm != "down")) {
								//$(document).scrollTop(0); //상단으로 이동
								$('html, body').animate({
									scrollTop : 0
								}, 'slow');
							}
						});
			</script>
			
			<div id="lyrModalArea"></div>
			<div id="lyrModalMask" class="maskV16">
				<div>

					<!-- Google -->
					<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-16971867-3', 'auto');
  ga('require','displayfeatures');
  ga('require', 'linkid', 'linkid.js');
  

  ga('send', 'pageview');

</script>

				</div>
			</div>


		</div>
	</div>
</body>




</body>

</html>


