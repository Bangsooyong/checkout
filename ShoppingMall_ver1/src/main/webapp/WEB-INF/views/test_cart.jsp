<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	border-collapse: collapse;
}

tr td {
	border: 1px solid gray;
	text-align: center;
}


</style>

</head>
<body>

	<table>
		<tr>
			<th><input type="checkbox" id="checkall" onclick="allChk(this);"
				checked="checked"></th>
			<th>상품이미지</th>
			<!-- <th>상품번호</th> -->
			<th>상품이름</th>
			<th>옵션</th>
			<th>상품가격</th>
			<th>구매수량</th>
			<th>총주문금액</th>
		</tr>
		
		<c:forEach var="vo" items="${cartList}">

			<tr>
				<td><input type="checkbox" value="${vo.c_no}" name="RowCheck"
					class="checkbox" checked="checked"></td>
				<td><img src="http://i.imgur.com/wB73OvB.jpg"
					style="width: 50px" /></td>
				<td>${vo.p_name }</td>
				<!-- 이름 -->
				<td>${vo.o_cont }</td>
				<!-- 옵션내용 -->
				<td>${vo.p_price }</td>
				<!--  가격 -->
				<td><form action="updateCartBuyCnt" method="get">
						<!-- 수량 -->
						<input style="width: 20px;" value="${vo.buy_cnt }" name="buy_cnt">
						<input type="hidden" value="${vo.c_no}" name="c_no"> <span><input
							type="submit" value="수정"></span>
					</form></td>
				<td class="realFinalCartPrice">${vo.p_price * vo.buy_cnt }</td>
				<!-- 아이템당 가격 -->
			</tr>
			<!--http://idevsigner.tistory.com/6  -->
		</c:forEach>
	</table>

	<div>
		총 구매 가격 :
		<!-- 총 가격 -->
		<input id="price" value="0" readonly="readonly" type="number" step="100" style="width: 269px">
	</div>
	<input type="button" value="장바구니에서 삭제" class="deleteall">
	
	<!-- 주문하기  -->
	<input type="button" value="주문하기" id="insertOrder" />

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<script>
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

		// 주문 이벤트
			$('#insertOrder').on("click",function() {
				
				
			});
		

	</script>


</body>
</html>