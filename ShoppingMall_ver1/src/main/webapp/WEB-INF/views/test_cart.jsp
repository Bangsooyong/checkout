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
tr td{
  border: 1px solid gray;
}

</style>

</head>
<body>

	<table>
		<tr>
			<th><input type="checkbox" class="checkall" onclick="allChk(this);"></th>
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
				<td><input type="checkbox" value="${vo.c_no}" name="RowCheck" class="checkbox"></td>
				<td><img src="http://i.imgur.com/wB73OvB.jpg" style="width: 50px"/></td>
				<td>${vo.p_name }</td>
				<td>${vo.o_cont }</td>
				<td>${vo.p_price }</td>
				<td>${vo.buy_cnt }</td>
				<td>${vo.p_price * vo.buy_cnt }</td>
			</tr>
		<!--http://idevsigner.tistory.com/6  -->
		</c:forEach>
	</table>
	
	<div>총 구매 가격 : <span id="total"></span></div>
	<input type="button" value="삭제" class="deleteall">
	

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script>
		
// 체크박스 올체크
function allChk(obj){
	      var chkObj = document.getElementsByName("RowCheck");
	      var rowCnt = chkObj.length - 1;
	      var check = obj.checked;
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true; 
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false; 
	           }
	          }
	      }
	  } 
	  
// 삭제 이벤트
$('.deleteall').on("click", function(event){

    var tb = $(this).attr('title');
    var sel = false;
    var ch = $('input[name="RowCheck"]:checked');
    var c_no = $('input[name="RowCheck"]:checked').val();
    var c = confirm('정말로 삭제하시겠어요?');
    if(c) {
      ch.each(function(){
         var $this = $(this);
            if($this.is(':checked')) {
                    sel = true; //set to true if there is/are selected row
///////////////////////////////////////////////////////////////////////////
                    $.ajax({
			type: 'post',
			url: 'deleteCart',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'POST'
			},
			/* JSON.stringify({}): JavaScript 객체를 JSON 문자열로 변환 */
			data: JSON.stringify({
				c_no: ch
			}),
			success: function(result) {
				if (result == 1) {
					alert('장바구니 삭제 성공');
				}

				
			} 
		});
        /////////////////////////////////////////////////////////            
                    
                $this.parents('tr').fadeOut(function(){
                $this.remove(); //remove row when animation is finished
                });
            }
      });
          if(!sel) alert('체크박스를 선택하세요');
    }
    return false;
});


	
	
	
	</script>
	
	
</body>
</html>