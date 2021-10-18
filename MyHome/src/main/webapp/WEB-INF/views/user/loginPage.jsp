<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>  로그인  </title> 
    <link rel="shortcut icon" href="../img/home-icon.png">
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"">
    <style>
 
    </style>

  </head>


  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
   <div class="card align-middle" style="width:20rem; border-radius:20px;">
      <div class="card-title" style="margin-top:30px;">
         <h2 class="card-title text-center" style="color:#116566;">D'terrior</h2>
      </div>
      <div class="card-body">
      <form class="form-signin" action="login" method="post">
        <h5 class="form-signin-heading">이메일 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">E-mail</label>
        <input type="text" id="#" class="form-control" placeholder="E-mail" required autofocus name="id"><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="#" class="form-control" placeholder="Password" required name="pw"><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me" id="saveCheck"> 기억하기
          </label>
        </div>
 
        <button id="#" class="btn btn-lg btn-outline-success btn-block" type="submit">로 그 인</button>
      </form>
        <button id="'#" class="btn btn-lg btn-outline-success btn-block btn-open-popup" style="margin-top: 10px;" type="submit">회원가입</button>
     
      </div>
   </div>
<!--모달창-->
<div class="modal">
  <div class="modal_body block"><strong>회원가입</strong><br>

    <div class="container">
      <div class="row">
        <div>
          <img class="modal-img" src="${pageContext.request.contextPath}/resources/img/logo2.jpg" alt="로고사진">
        </div>
          <div class="btn-group">
            <button type="button" onclick = "location.href ='${pageContext.request.contextPath}/user/normalJoinPage'" class="btn btn-primary btn-lg">일반회원</button>
            <button type="button" onclick = "location.href ='${pageContext.request.contextPath}/user/proJoinPage'" class="btn btn-primary btn-lg">전문회원</button>

         
          </div>
      </div>
    </div>
  </div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  </body>
  <script>
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
      modal.classList.toggle('show');

      if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
      }
    });

    modal.addEventListener('click', (event) => {
      if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
          body.style.overflow = 'auto';
        }
      }
    });
    
    $(document).ready(function(){
    	
        var userInputId = getCookie("userInputId");
        var userInputPw = getCookie("userInputPw");
        $("input[name='id']").val(userInputId); 
        $("input[name='pw']").val(userInputPw);
        
        if($("input[name='id']").val() != "") { 
            $("#saveCheck").attr("checked", true); 
        }
         
        $("#saveCheck").change(function() {
            if($("#saveCheck").is(":checked")) { 
                var userInputId = $("input[name='id']").val();
            	var userInputPw = $("input[name='pw']").val();
                setCookie("userInputId", userInputId, 7); 
                setCookie("userInputPw", userInputPw, 7);
            } else {
                deleteCookie("userInputId");
            }
        });
         
        $("input[name='id']").keyup(function() { 
            if($("#saveCheck").is(":checked")) { 
                var userInputId = $("input[name='id']").val();
                var userInputPw = $("input[name='pw']").val();
                setCookie("userInputId", userInputId, 7); 
                setCookie("userInputPw", userInputPw, 7);
            }
        });
    });
     
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
  </script>

</html>