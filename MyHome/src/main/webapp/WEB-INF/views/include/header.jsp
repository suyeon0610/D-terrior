<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>D'terrior</title>

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css" />
<link
   href="${pageContext.request.contextPath }/resources/css/header.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>


<link rel="stylesheet"
   href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<script src="https://kit.fontawesome.com/86e4aadf8c.js"
   crossorigin="anonymous"></script>


<link
   href="${pageContext.request.contextPath}/resources/css/indexcss.css"
   rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon"
   href="${pageContext.request.contextPath}/resources/img/favicon-16x160.jpg" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
   crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
   href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
   rel="stylesheet" type="text/css" />






<title>D'terrior</title>
</head>
<body>
   <nav id="total-nav">
      <nav class="navbar navbar-expand-lg navbar-light fixed-top"
         id="first-nav"
         style="background-color: white; font-family: 'Cafe24SsurroundAir';">
         <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         <a class=" navbar-brand" href="${pageContext.request.contextPath}"><img
            src="${pageContext.request.contextPath}/resources/img/logo2.jpg"></a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">
               <li class="nav-item active" id="id1"><a class="nav-link font-siz"
                  href="#"><big><strong>커뮤니티</strong></big> </a></li>
            </ul>
         </div>
         <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">
               <li class="nav-item active " id="id2"><a class="nav-link font-siz"
                  href="${pageContext.request.contextPath}/store/storeList?category1=new"><big><strong>스토어</strong></big></a></li>

            </ul>
         </div>
         <div class="collapse navbar-collapse">
            <form action='<c:url value="/myhome/allSearch" />' class="form-inline my-2 my-lg-0">
               <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Search" aria-label="Search">
               <button
                  class="btn btn-outline-success lnr lnr-magnifier my-2 my-sm-0"
                  type="submit"></button>
            </form>
         </div>
         <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         <!-- 로그인 안했을 경우 -->
         <c:if test="${sessionScope.user == null}">
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto ">
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/userLoginPage"><strong>로그인</strong>
                  </a></li>
                  <li class="nav-item active popup"><a class="nav-link popup"
                     href=""><strong>회원가입</strong></a></li>
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/qna"><strong>고객센터</strong></a></li>
               </ul>
            </div>
            <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
            <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         </c:if>
          <!-- 로그인 했을 경우 -->
         <c:if test="${sessionScope.user != null}">
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto ">
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/logout"><strong>로그아웃</strong> </a></li>
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/mypage"><strong>mypage</strong></a>
                  </li>
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/qna"><strong>고객센터</strong></a></li>

               </ul>
            </div>
 
  
         
            <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
            <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         </c:if>
      </nav>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top"
         id="community"
         style="background-color: white; font-family: 'Cafe24SsurroundAir';">
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>


         <div class="collapse navbar-collapse container"
            id="navbarNavAltMarkup">
            <ul class="navbar-nav mr-auto nav-item2 collapse navbar-collapse"
               id="navbarSupportedContent" style="position: relative; left: 17%">
               <li class="nav-item active "><a class="nav-link" href="#"><strong>Home</strong>
               </a></li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                  href="${pageContext.request.contextPath}/myhome/homeList"><strong>내집뽐내기</strong></a>
               </li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                  href="${pageContext.request.contextPath}/quiz/quizList"><strong>질문과답변</strong></a>
               </li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                href='<c:url value="/store/event" />'><strong>이벤트</strong></a>
               </li>


            </ul>
         </div>
      </nav>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top "
         id="store"
         style="background-color: white; font-family: 'Cafe24SsurroundAir';">
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse container"
            id="navbarNavAltMarkup">
            <ul class="navbar-nav mr-auto nav-item2 collapse navbar-collapse"
               id="navbarSupportedContent" style="position: relative; left: 17%">
               <li class="nav-item active "><a class="nav-link"
                  href="${pageContext.request.contextPath}/store/storeList?category1=new"><strong>Home </strong></a></li>
               <li class="nav-item active "><a class="nav-link"style="padding-left:11px;"
                href="${pageContext.request.contextPath}/store/storeList?category1=best"><strong>베스트</strong></a>
               </li>
               <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/comp/compList"
                  id="grab"><strong>완성형 인테리어</strong></a></li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                href="#"
                  id="header-category"><strong>카테고리</strong></a></li>



            </ul>
         </div>
      </nav>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top fixed-top2  "
         id="header-cate"
         style="background-color: white; font-family: 'Cafe24SsurroundAir';">
         <div class="collapse navbar-collapse container header-categorys ">
            <ul class="list-st mr-auto"
            style="font-family: 'Cafe24SsurroundAir', 'notosans'; position: relative; left: 16%;"
               id="navbarSupportedContent" >
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=가구"/>'
                  style="color: black;"> <i class="fas fa-couch fa-2x"></i><br>가구
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=패브릭"/>'
                  style="color: black;"> <i class="fas fa-bed fa-2x"></i><br>패브릭
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=가전"/>'
                  style="color: black;"> <i class="fas fa-tv fa-2x"></i><br>가전
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=주방용품"/>'
                  style="color: black;"> <i class="fas fa-sink fa-2x"></i><br>주방용품
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=생활용품"/>'
                  style="color: black;"> <i class="fas fa-laptop-house fa-2x"></i><br>생활용품
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=수납"/>'
                  style="color: black;"> <i class="fas fa-box fa-2x"></i><br>수납
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=캠핑용품"/>'
                  style="color: black;"> <i class="fas fa-hiking fa-2x"></i><br>캠핑용품
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=반려동물"/>'
                  style="color: black;"> <i class="fas fa-dog fa-2x"></i><br>반려동물
               </a></li>
            </ul>
         </div>

      </nav>

   </nav>
   <!--모달창-->
   <div class="modal">
      <div class="modal_body block">
         <strong>회원가입</strong><br>

         <div class="container">
            <div class="row">
               <div>
                  <img class="modal-img"
                     src="${pageContext.request.contextPath}/resources/img/logo2.jpg"
                     alt="로고사진">
               </div>
               <div class="btn-group mobtn">
                  <button  type="button" class="btn btn-outline-success btn-lg"
                     style="font-size: 19px;" onclick = "location.href ='${pageContext.request.contextPath}/user/normalJoinPage'" >일반회원</button>
                  <button type="button" class="btn btn-outline-success btn-lg"
                     style="font-size: 19px;" onclick = "location.href ='${pageContext.request.contextPath}/user/proJoinPage'" >전문회원</button>


               </div>
            </div>
         </div>
      </div>
   </div>



<script>
  $(document).ready(function () {
    $('#community').removeClass('acup');
    $('#store').removeClass('acup');
    $('#id1').mouseover(function () {
      $('#store').removeClass('acup');
      $('#community').addClass('acup');

    }); //커뮤니티 마우스 이벤트   
    $('#id2').mouseover(function () {
      $('#community').removeClass('acup');
      $('#store').addClass('acup');
    }); //스토어 마우스 이벤트 
    $("#total-nav").mouseleave(function () {
      $('#community').removeClass('acup');
      $('#store').removeClass('acup');
      $('#header-cate').removeClass('acup');
    }); //네비바 리브이벤트


    $('#header-category').mouseover(function () {
      $('#header-cate').addClass('acup')
    });
    //카테고리버튼 마우스 이벤트
    $('#first-nav').mouseover(function () {
      $('#header-cate').removeClass('acup')
    });   
    //첫번째 네비바 마우스오버시 카테고리 dis:none
    $('#grab').mouseover(function () {
        $('#header-cate').removeClass('acup')
    });   
    //두번째 네비바에 카테고리외 메뉴선택시 카테고리 삭제 
    

    $('#header-cate').mouseleave(function () {
      $('#header-cate').removeClass('acup')
    });
    //카테고리 리브이벤트
	$(document).ready(function () {
	      $('.inimg').hover(function () {
	          $('.ico').toggle();
	      }); 
	  
	      $('.ico').mousemove(function () {
	          $('.Exp').toggle();
	      });
		});
    
  }); //end jquery

 //모달
  const body = document.querySelector('body');
  const modal = document.querySelector('.modal');
  const btnOpenPopup = document.querySelector('.popup');
  

  btnOpenPopup.addEventListener('click', function() { 
    modal.classList.toggle('show');
    event.preventDefault();
    if (modal.classList.contains('show')) {
      body.style.overflow = 'hidden';
      event.preventDefault();
    }
  });

  modal.addEventListener('click', function() {
    if (event.target === modal) {
      modal.classList.toggle('show');
      event.preventDefault();
      if (!modal.classList.contains('show')) {
        body.style.overflow = 'auto';
        event.preventDefault();
      }
    }
  }); 
  

</script>




</html>