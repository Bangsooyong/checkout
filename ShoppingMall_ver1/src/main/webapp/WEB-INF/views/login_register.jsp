<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식...........only 틀만</title>

<style>
body {
	padding-top: 10px;
}

fieldset {
	border: thin solid #ccc;
	border-radius: 4px;
	padding: 10px;
	padding-left: 10px;
	background: #fbfbfb;
}

legend {
	color: #678;
}

.form-control {
	width: 95%;
}

label {
	vertical-align: top;
}

label small {
	color: #678 !important;
}

span.req {
	color: maroon;
	font-size: 112%;
}
</style>
<link type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-login.css"
	rel="stylesheet" />

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		
	// 아이디 중복체크 Ajax , Controller RequestMapping : /checkid
	/////////////////////////////////////////////////////

	/////////////////////////////////////////////////////
		
		$("#b_id").change(function(){
			$.ajax({
				type : 'post',
				url : 'checkid',
				data : $("#b_id").val(),
				success : function(result) {
					if(result==1) {
						$("#duplicationCheckResult").html("중복된 아이디입니다.");
						$("#duplicationCheckResult").css("color", "red");
						$("#b_id").css("color", "red");
					} else {
						$("#duplicationCheckResult").html("사용 가능한 아이디입니다.");
						$("#duplicationCheckResult").css("color", "green");
						$("#b_id").css("color", "green");
					}
				}
			});
		});
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
		

		
	});
</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form action="login_result" method="post" id="fileForm" role="form">
					<fieldset>
						<legend class="text-center">
							구매자 회원가입<span class="req">
								<!-- <small> * 표시는 필수</small> -->
							</span>
						</legend>

						<div class="form-group">
							<label>
								<!-- <span class="req">* </span>  -->이름
							</label> <input class="form-control" type="text" name="b_name" id="txt"
								required placeholder="홍길동" />
							<div id="errFirst"></div>
						</div>
						<!-- onkeyup="Validate(this)" -->
						<div class="form-group">
							<label for="b_id">아이디 &nbsp;&nbsp; <small id="duplicationCheckResult"></small>
							</label> <input class="form-control" type="text" name="b_id" id="b_id"
								 placeholder="아이디" required />
							<div id=""></div>
						</div>

						<div class="form-group">
							<label for="b_pw">비밀번호 </label> <input required
								name="b_pw" type="password" class="form-control inputpass"
								minlength="4" maxlength="16" id="pass1" placeholder="비밀번호" />
							<!-- <p> -->

							<label for="b_pw_check">비밀번호 확인 &nbsp;&nbsp;<span
							
								id="confirmMessage" class="confirmMessage"></span> </label> <input required name="b_pw_check"
								type="password" class="form-control inputpass" minlength="4"
								maxlength="16" placeholder="비밀번호 확인(위와 동일하게 입력하세요)" id="pass2"
								onkeyup="checkPass(); return false;" /> 
						</div>

						<div class="form-group">
							<label for="b_phone"> 전화번호/휴대폰번호 </label> <input required
								type="number" name="b_phone" id="phone"
								class="form-control phone" maxlength="28"
								
								placeholder="( - )은 빼고 입력하세요. ex) 01012345424" />
						</div>

						<div class="form-group">
							<label for="b_gender">성별</label> <label class="radio-inline"><input
								type="radio" name="b_gender" value="1" checked>남자</label> <label
								class="radio-inline"><input type="radio" name="b_gender"
								value="2">여자</label>
						</div>

						<div class="form-group">
							<label for="b_birth">생년월일</label><input class="form-control"
								required type="date" name="b_birth" placeholder="생년월일 ex)901214">
						</div>
						<!-- -------------------------------------------------------------- -->
						<div class="form-group">
							<label for="b_email">이메일 주소 <small> 유효한 이메일임을
									확인하기 위해서 확인메일을 보냅니다.</small>
							</label>
							<div class="input-group" id="b_email">
								<input type="email" name="b_email" class="form-control"
									placeholder="이메일주소 입력 "> <span class="input-group-btn"
									id="b_check">
									<button class="btn btn-default" type="button"
										name="btn_for_check" id="showConfirmForm">승인번호 얻기</button>
								</span>
							</div>
						</div>

						<!-- ------------------------------------------------------------------ -->

						<div class="form-group" id="confirmForm_form-group">
							<label for="b_email_input">승인번호 입력 <small> 이메일로 보낸
									승인번호를 입력해주세요.</small>
							</label>
							<div class="input-group" id="b_email_input-group">
								<input type="text" name="b_email_input" class="form-control"
									placeholder="승인번호 ex)1234 "> <span
									class="input-group-btn" id="b_email_span">
									<button class="btn btn-default" type="button"
										name="b_email_btn" id="b_email_confirm_btn">확인</button>
								</span>
							</div>
						</div>

						<!-- ----------------------------------------------------------------- -->
						<div class="form-group">
							<label for="b_zip">주소</label>
							 <input class="form-control inputpass" type="text" name="b_zip"
								id="sample6_postcode" placeholder="우편번호를 찾으려면 클릭하세요"
								onclick="sample6_execDaumPostcode()"> <br>
								 <input class="form-control inputpass" type="text" name="b_addr1"
								id="sample6_address" placeholder="지번 / 도로명주소"
								readonly="readonly"><br> 
								<input class="form-control inputpass" type="text" name="b_addr2"
								id="sample6_address2" placeholder="나머지 상세 주소">
						</div>

						<div class="form-group" style="text-align: center">
							<input class="btn btn-success" type="submit" name="submit_reg"
								value="가입하기">
						</div>
					</fieldset>
				</form>

			</div>


		</div>
	</div>

</body>

<script>
	function checkPass() {
		var pass1 = document.getElementById('pass1');
		var pass2 = document.getElementById('pass2');
		var message = document.getElementById('confirmMessage');
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		if (pass1.value == pass2.value) {
			message.style.color = goodColor;
			message.innerHTML = "일치합니다"
		} else {
			message.style.color = badColor;
			message.innerHTML = "패스워드가 일치하지 않습니다.!"
		}
	}

</script>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>


</html>