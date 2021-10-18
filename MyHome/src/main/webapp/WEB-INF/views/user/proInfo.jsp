<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
 <!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link href="${pageContext.request.contextPath}/resources/css/manager_info.css" rel="stylesheet">
 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
 
<style>

</style>
</head>

<body>
<div class="container">
 <div class="input-form-backgroud row">
   <div class="input-form col-md-12 mx-auto">
     <h4 class="mb-3">등업 정보</h4>
     <form action='<c:url value="/user/upgrade/${proInfo.userNum }" />' method="post" class="validation-form" novalidate>
       <div class="mb-3"> <label for="email">아이디</label> 
       <input type="email" class="form-control" id="id" value="${proInfo.id }" required readonly>
       </div>
 
             <div class="mb-3"> <label for="nickname">닉네임</label> 
             <input type="text" class="form-control" id="nickname" value="${proInfo.nickName }" required readonly>
               <div class="invalid-feedback"> 닉네임을 입력해주세요. </div>
             </div>
      
       
           <div class="mb-3"><label for="phoene">전화번호</label> <br>
            <input id="mPhone1" name="phone1" type="text" value="${proInfo.phone1 }" size="2" maxlength="4" autocomplete="off" readonly>-
             <input id="mPhone2" name="phone2" type="text" value="${proInfo.phone2 }" size="2" maxlength="4" autocomplete="off" readonly>-
             <input id="mPhone3" name="phone3" type="text" value="${proInfo.phone3 }" size="2" maxlength="4" autocomplete="off" readonly>
           </div>
           <label for="map api">주소</label><br>
           <input class="ka-api" type="text" id="sample6_postcode" value="${proInfo.zipNum }" placeholder="우편번호" readonly>
           <input class="ka-api" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" readonly><br>
           <input class="ka-api" type="text" id="sample6_address" value="${proInfo.addrBasic }" readonly><br>
           <input class="ka-api" type="text" id="sample6_detailAddress" value="${proInfo.addrDetail }" readonly>

           <div class="row">
             <div class="mb-3" style="margin-top: 10px;"> <label for="Attention">관심분야</label>
               <div class=invalid-checkbox>
                	<input type="checkbox" class="checkcss" name="major" value="도배"> 도배
	                <input type="checkbox" class="checkcss" name="major" value="장판"> 장판 <br>
	                <input type="checkbox" class="checkcss" name="major" value="조명"> 조명
	                <input type="checkbox" class="checkcss" name="major" value="타일"> 타일 <br>
	                <input type="checkbox" class="checkcss" name="major" value="페인트"> 페인트 
	                <input type="checkbox" class="checkcss" name="major" value="필름시트"> 필름시트<br>
	                <input type="checkbox" class="checkcss" name="major" value="상품"> 인테리어 상품
	                <input type="checkbox" class="checkcss" name="major" value="기타"> 기타
               </div>
               <div class="mb-3" style="margin-top: 20px;">
                   <label for="files">증빙서류</label>

                    <a href='<c:url value="/user/download?paper=${proInfo.paper }" />' >DownLoad</a>
              </div>

             </div>

             <div class="mb-4"></div> <button id="upgrade-btn" class="btn btn-info btn-lg btn-block" type="button">등업 완료</button>
             
     </form>
     </div>
    </div>
    </div>

</div>
</div>

</body>

<script>
	
	// jqiery end
	$(function() {
		
	  // 관심분야 체크 박스
	  const major = '${proInfo.major}';
	  
	  for(var j=0; j<$('.checkcss').length; j++) {
		  if(major === $('.checkcss')[j].value) {
			  $('.checkcss')[j].checked = 'true';
		  }
	  }
	  
	  $('#upgrade-btn').click(function() {
		var result = confirm('${proInfo.nickName}님의 등급을 변경하시겠습니까?');
		
		if(result) {
			$('#upgrade-btn').attr('type', 'submit');
		}
	})
		
	});

</script>

</html>