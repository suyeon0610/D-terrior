<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입(전문가회원)</title>
<link rel="shortcut icon" href="../img/home-icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#fff),
		to(#fff));
	background: -webkit-linear-gradient(bottom left, #fff 0%, #fffc 100%);
	background: -moz-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: -o-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: linear-gradient(to top right, #fff 0%, #fff 100%);
}
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.invalid-checkbox {
	border: #000 solid 1px;
	border-radius: 10px;
	background-color: #fff;
	width: 50%;
}
.code {
	margin-top: 32px;
}
.checkcss {
	margin: 5px;
}
.ka-api {
	margin: 5px;
}
.code2 {
	margin: 0 0 20px 20px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입(전문가회원)</h4>
				<span>(*)는 필수값입니다</span>
				<form action="<c:url value='/user/userJoin' />" method="post"
					class="validation-form" novalidate enctype="multipart/form-data"
					onsubmit="return formcheck()" name="fc">
					<div class="mb-3">
						<label for="email">이메일(*)</label> <input type="email"
							class="form-control" id="email" placeholder="you@example.com"
							required name="id"> <span id="msgId"></span>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="emailCode">인증코드(*)</label> <input type="text"
								class="form-control" id="emailCode" placeholder="" value=""
								required name="emailCode"> <span id="msgCodeChk"></span>
						</div>

						<div class="col-md-6 mb-3">
							<button class="btn btn-outline-success code" type="button" id="codeChk"
								style="display: none">확인</button>
						</div>
						<button class="btn btn-outline-success code2" type="button" id="sendCode">이메일
							인증코드 발송하기</button>
					</div>



					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임(*)</label> <input type="text"
								class="form-control" id="nickName" placeholder="(2~15자)"
								value="" required name="nickName"> <span id="msgNickChk"></span>
							<span id="msgNick"></span>
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						</div>
						<div class="col-md-6 md-3">
							<button class="btn btn-outline-success code" type="button" id="nickChk">중복확인</button>
						</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호(*)</label> <input type="password"
							class="form-control" id="pw" placeholder="비밀번호를 적어주세요" required
							name="pw"> <span id="msgPw"></span>
						<div class="invalid-feedback">비밀번호.</div>
						<div class="mb-3">
							<label for="passwordCH">비밀번호확인(*)</label> <input type="password"
								class="form-control" id="pwChk" placeholder="비밀번호를 다시 한번 적어주세요"
								required name="pwChk"> <span id="msgPwChk"></span>
							<div class="invalid-feedback">비밀번호 확인해주세요.</div>
							<div class="mb-3">
								<label for="phoene">전화번호</label> <br> <select id="phone1"
									name="phone1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>- <input id="phone2" name="phone2" type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=""
									size="2" maxlength="4" autocomplete="off">- <input
									id="phone3" name="phone3" type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=""
									size="2" maxlength="4" autocomplete="off">
							</div>

							<input class="ka-api" type="text" id="sample6_postcode"
								placeholder="우편번호" name="zipNum"> <input class="ka-api btn btn-outline-success"
								type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기"><br> <input class="ka-api"
								type="text" id="sample6_address" placeholder="주소"
								name="addrBasic"><br> <input class="ka-api"
								type="text" id="sample6_detailAddress" placeholder="상세주소"
								name="addrDetail"> <input class="ka-api" type="text"
								id="sample6_extraAddress" placeholder="참고항목" readonly>

							<div class="row">
								<div class="col-md-8 mb-3">
									<label for="Attention">전문분야(*)</label>
									<div class=invalid-checkbox>
		                                <input type="radio" name="major" value="도배"> 도배
		                                <input type="radio" name="major" value="장판"> 장판 <br>
		                                <input type="radio" name="major" value="조명"> 조명
		                                <input type="radio" name="major" value="타일"> 타일 <br>
		                                <input type="radio" name="major" value="페인트"> 페인트 
		                                <input type="radio" name="major" value="필름시트"> 필름시트<br>
		                                <input type="radio" name="major" value="상품"> 인테리어 상품
		                                <input type="radio" name="major" value="기타"> 기타
                                    </div>
                                    <div class="col-md-8 mb-3"><label>증빙서류</label>
                                        <input id="file" type="file" name="file" multiple>
                                    </div>
								<button class="btn btn-outline-success btn-lg btn-block" type="submit">가입하기</button>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>



</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* submit formcheck */

function formcheck(){
	/*1.공백체크*/
	  if(fc.id.value === '') {
		  alert("이메일을 입력해주세요.");
	      fc.id.focus();
	      return false;
	  } else if(fc.emailCode.value === '') {
		  alert("이메일 인증코드를 확인해주세요");
		  fc.emailCode.focus();
		  return false;
	  } else if(fc.nickName.value === '') {
		  alert("닉네임을 입력해주세요");
		  fc.nickName.focus();
		  return false;
	  } else if(fc.pw.value === '') {
		  alert("비밀번호를 입력해주세요");
		  fc.pw.focus();
		  return false;
	  } else if(fc.pwChk.value === '') {
		  alert("비밀번호를 입력해주세요");
		  fc.pwChk.focus();
		  return false;
	  } else if(fc.file.value === '') {
		  alert("증빙서류를 등록해주세요");
		  return false;
	  } else if(!$("input:checked[name='major']").is(":checked")) {
		  alert("전문분야는 필수선택입니다");
		  return false; 
	/*2.올바르지않은입력값*/
	  } else if(document.getElementById("sendCode").innerHTML != "인증되었습니다") {
		  alert("이메일 인증을 진행해주세요")
		  fc.emailCode.focus();
		  return false;
	  } else if(fc.pw.value != fc.pwChk.value){
		  alert("비밀번호가 일치하지 않습니다")
		  fc.pw.focus();
		  return false;
	  } else if(document.getElementById("nickName").style.borderColor != "green"){
		  alert("닉네임 중복확인을 해주세요")
		  fc.id.focus();
		  return false;
	  } else {
		  alert('회원가입이 완료되었습니다. 로그인창으로 이동합니다');
		  return true;
	  }
}
/*체크박수 갯수 제한*/	




/*닉네임 중복확인*/
$('#nickChk').click(function(){
	if($('#nickName').val() === ''){
		alert('닉네임을 입력해주세요');
		return;
	}
	const nickName = $('#nickName').val();
	$.ajax({
		type: "post",
		url: "<c:url value='/user/nickCheck' />",
		data: nickName,
		headers: {
			"Content-type" : "application/json"
		},		
		success: function(data){
			if(data === 'exist') {
				alert('이미 존재하는 닉네임입니다');
				document.getElementById("nickName").style.borderColor = "red";
				document.getElementById('msgNick').innerHTML = '이미 존재하는 닉네임입니다';
			} else if(data === 'ok') {
				alert('사용가능한 닉네임입니다');
				document.getElementById("nickName").style.borderColor = "green";
				document.getElementById('msgNick').innerHTML = '사용가능한 닉네임입니다';
			} 
		}
	});
});
/*이메일 인증코드 발송*/
var code = "";
$('#sendCode').click(function() {
	if($('#email').val() === '') {
		alert('아이디(이메일)을 입력해주세요.');
		return;
	} 
	$("#sendCode").attr('disabled', true);
	const id = $('#email').val();
	$.ajax({
		type: "post",
		url: "<c:url value='/user/idCheck' />",
		data: id,
		headers: {
			"Content-type" : "application/json"
		},
		success: function(data) {
			if(data === 'send'){
				$.ajax({
					type: "post",
					url: "<c:url value='/user/mailCheck' />",
					data: id,
					headers: {
						"Content-type" : "application/json"
					},
					success: function(data) {
						if(data != 'notvalid'){
							$('#codeChk').show();
							code = data;
							alert('인증번호가 발송되었습니다 이메일을 확인해주세요');
							document.getElementById("sendCode").innerHTML = "인증번호가 발송되었습니다";
							document.getElementById("sendCode").style.backgroundColor = "gray";
						} else {
							alert('유효하지 않은 이메일입니다');
							$("#sendCode").attr('disabled', false);
						}
					},
					error: function() {
						alert('서버에러 입니다. 관리자에게 문의하세요.');
					}
				});	
			} else if(data === 'exist') {
				alert('이미 가입된 이메일입니다');
				$("#sendCode").attr('disabled', false);
			}
			
		},
		error: function() {
			alert('서버에러 입니다. 관리자에게 문의하세요.');
		}
	});	
});
/* 인증번호 확인 */
var inputCode = document.getElementById("emailCode");
$('#codeChk').click(function(){
	if( code === document.getElementById("emailCode").value ){
		$('#email').attr('readonly', true);
		$('#emailCode').attr('readonly', true);
		$('#codeChk').hide();
		document.getElementById("sendCode").innerHTML = "인증되었습니다";
	} else {
		alert('인증번호가 일치하지 않습니다 이메일을 확인해주세요');
		$('#emailCode').focus();
	}
});
/*아이디 형식(이메일) 검사 스크립트*/
var id = document.getElementById("email");
id.onkeyup = function() {
    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(regex.test(document.getElementById("email").value )) {
        document.getElementById("email").style.borderColor = "green";
        document.getElementById("msgId").innerHTML = "사용가능한 이메일입니다."; 
    } else {
        document.getElementById("email").style.borderColor = "red";
        document.getElementById("msgId").innerHTML = "형식에 맞지 않는 이메일입니다";
    }
}
/*비밀번호 형식 검사 스크립트*/
var pw = document.getElementById("pw");
pw.onkeyup = function(){
    var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
     if(regex.test(document.getElementById("pw").value )) {
        document.getElementById("pw").style.borderColor = "green";
        document.getElementById("msgPw").innerHTML = "사용가능합니다";
    } else {
        document.getElementById("pw").style.borderColor = "red";
        document.getElementById("msgPw").innerHTML = "비밀번호는 영문, 숫자, 특수문자를 혼합하여 8~20자리 이내여야 합니다(사용가능 특수문자 !@#$%^&*)";
    }
}
/*비밀번호 확인검사*/
var pwConfirm = document.getElementById("pwChk");
pwConfirm.onkeyup = function() {
    var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
    if(document.getElementById("pwChk").value == document.getElementById("pw").value ) {
        document.getElementById("pwChk").style.borderColor = "green";
        document.getElementById("msgPwChk").innerHTML = "비밀번호가 일치합니다";
    } else {
        document.getElementById("pwChk").style.borderColor = "red";
        document.getElementById("msgPwChk").innerHTML = "비밀번호가 일치하지 않습니다.";
    }
}
/*닉네임 형식검사*/
var nform = document.getElementById("nickName");
nform.onkeyup = function() {
	var regex = /^.{2,15}$/;
	if(!regex.test(document.getElementById("nickName").value )){
		document.getElementById("nickChk").setAttribute("disabled", "disabled");
		document.getElementById("nickName").style.borderColor = "red";
		document.getElementById("msgNick").innerHTML = "닉네임은 2~15자 이내여야합니다";
	} else {
		document.getElementById("nickName").style.borderColor = "#008001";
		document.getElementById("msgNick").innerHTML = "";
		document.getElementById('nickChk').removeAttribute("disabled");
	}
	
}
/* 주소찾기 */
  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수
        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }
        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }
          // 조합된 참고항목을 해당 필드에 넣는다.
          document.getElementById("sample6_extraAddress").value = extraAddr;
        } else {
          document.getElementById("sample6_extraAddress").value = '';
        }
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
</script>

</html>