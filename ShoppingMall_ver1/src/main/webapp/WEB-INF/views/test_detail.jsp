<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.preview {
width:300px;
height:230px;
}


.thumb {
width:90px;
height:80px;
margin-right:3px;}

.normal {
border:3px solid #000000;}

.selected {
border:3px solid #ff0000;}
</style>


</head>
<body>

<img id="0" class="preview normal" src="http://i.imgur.com/wB73OvB.jpg" alt="preview" /><br />
<img id="1" class="thumb normal" src="http://i.imgur.com/vblRxAI.jpg" alt="mountains" onmouseover="preview(this)"/>
<img id="2" class="thumb normal" src="http://i.imgur.com/IxpW9YU.jpg" alt="desert" onmouseover="preview(this)"/>
<img id="3" class="thumb normal" src="http://i.imgur.com/u1kXpzS.jpg" alt="highway" onmouseover="preview(this)"/>

	<!-- productDetail -->
	<form action="insertCart" method="get">
		<div><input type="hidden" value="${productDetail.p_no }" name="p_no"></div>
		<div>
			<span>상품명 : </span>${productDetail.p_name }</div>
		<div>
			<span>가격 : </span>${productDetail.p_price }</div>
		<div>
			<span>구매 수량 : </span><input type="number" name="buy_cnt">
		</div>
		<div><span>상품 옵션 : </span>
		<select name="o_cont">
	  	<option>파란색</option>
  		<option>빨간색</option>
  		<option>초록색</option>
 		 <option>노란색</option>
		</select></div>
		<input type="submit" value="장바구니 담기">
	</form>
	

<script>

    var lastImg = 1; //Set initial thumbnail and preview
    document.getElementById(0).src = document.getElementById(lastImg).src;
    document.getElementById(lastImg).className = "thumb selected";

    function preview(img) {
        document.getElementById(lastImg).className = "thumb normal";
        img.className = "thumb selected";
        document.getElementById(0).src = img.src;
        lastImg = img.id
    }
</script>
	
</body>
</html>