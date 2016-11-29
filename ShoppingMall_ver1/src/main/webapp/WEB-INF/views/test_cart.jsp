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
			<th><input type="checkbox" id="allCheck" onclick="allChk(this);"></th>
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
				<td><input type="checkbox" value="${vo.c_no}" name="RowCheck"></td>
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
	

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>

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
	 function fn_userDel(){
		  var userid = "";
		  var memberChk = document.getElementsByName("RowCheck");
		  var chked = false;
		  var indexid = false;
		  for(i=0; i < memberChk.length; i++){
		   if(memberChk[i].checked){
		    if(indexid){
		      userid = userid + '-';
		    }
		    userid = userid + memberChk[i].value;
		    indexid = true;
		   }
		  }
		  if(!indexid){
		   alert("삭제할 사용자를 체크해 주세요");
		   return;
		  }
		  document.userForm.delUserid.value = userid;       // 체크된 사용자 아이디를 '-'로 묶은 userid 를     
		                                                                               
		  
		  var agree=confirm("삭제 하시겠습니까?");
		     if (agree){
		   document.userForm.execute.value = "userDel";
		     document.userForm.submit();
		     } 
		  }﻿
		
	
	
	
	</script>
	
	
</body>
</html>