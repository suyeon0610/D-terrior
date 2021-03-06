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
                  href="#"><big><strong>????????????</strong></big> </a></li>
            </ul>
         </div>
         <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">
               <li class="nav-item active " id="id2"><a class="nav-link font-siz"
                  href="${pageContext.request.contextPath}/store/storeList?category1=new"><big><strong>?????????</strong></big></a></li>

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
         <!-- ????????? ????????? ?????? -->
         <c:if test="${sessionScope.user == null}">
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto ">
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/userLoginPage"><strong>?????????</strong>
                  </a></li>
                  <li class="nav-item active popup"><a class="nav-link popup"
                     href=""><strong>????????????</strong></a></li>
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/qna"><strong>????????????</strong></a></li>
               </ul>
            </div>
            <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
            <div class="collapse navbar-collapse " id="navbarSupportedContent"></div>
         </c:if>
          <!-- ????????? ?????? ?????? -->
         <c:if test="${sessionScope.user != null}">
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto ">
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/logout"><strong>????????????</strong> </a></li>
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/mypage"><strong>mypage</strong></a>
                  </li>
                  <li class="nav-item active"><a class="nav-link"
                     href="${pageContext.request.contextPath}/user/qna"><strong>????????????</strong></a></li>

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
                  href="${pageContext.request.contextPath}/myhome/homeList"><strong>???????????????</strong></a>
               </li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                  href="${pageContext.request.contextPath}/quiz/quizList"><strong>???????????????</strong></a>
               </li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                href='<c:url value="/store/event" />'><strong>?????????</strong></a>
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
                href="${pageContext.request.contextPath}/store/storeList?category1=best"><strong>?????????</strong></a>
               </li>
               <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/comp/compList"
                  id="grab"><strong>????????? ????????????</strong></a></li>
               <li class="nav-item active"><a class="nav-link"style="padding-left:11px;"
                href="#"
                  id="header-category"><strong>????????????</strong></a></li>



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
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=??????"/>'
                  style="color: black;"> <i class="fas fa-couch fa-2x"></i><br>??????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=?????????"/>'
                  style="color: black;"> <i class="fas fa-bed fa-2x"></i><br>?????????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=??????"/>'
                  style="color: black;"> <i class="fas fa-tv fa-2x"></i><br>??????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=????????????"/>'
                  style="color: black;"> <i class="fas fa-sink fa-2x"></i><br>????????????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=????????????"/>'
                  style="color: black;"> <i class="fas fa-laptop-house fa-2x"></i><br>????????????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=??????"/>'
                  style="color: black;"> <i class="fas fa-box fa-2x"></i><br>??????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=????????????"/>'
                  style="color: black;"> <i class="fas fa-hiking fa-2x"></i><br>????????????
               </a></li>
               <li class="category-item col-lg-auto"><a href='<c:url value="/store/storeList?category1=????????????"/>'
                  style="color: black;"> <i class="fas fa-dog fa-2x"></i><br>????????????
               </a></li>
            </ul>
         </div>

      </nav>

   </nav>
   <!--?????????-->
   <div class="modal">
      <div class="modal_body block">
         <strong>????????????</strong><br>

         <div class="container">
            <div class="row">
               <div>
                  <img class="modal-img"
                     src="${pageContext.request.contextPath}/resources/img/logo2.jpg"
                     alt="????????????">
               </div>
               <div class="btn-group mobtn">
                  <button  type="button" class="btn btn-outline-success btn-lg"
                     style="font-size: 19px;" onclick = "location.href ='${pageContext.request.contextPath}/user/normalJoinPage'" >????????????</button>
                  <button type="button" class="btn btn-outline-success btn-lg"
                     style="font-size: 19px;" onclick = "location.href ='${pageContext.request.contextPath}/user/proJoinPage'" >????????????</button>


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

    }); //???????????? ????????? ?????????   
    $('#id2').mouseover(function () {
      $('#community').removeClass('acup');
      $('#store').addClass('acup');
    }); //????????? ????????? ????????? 
    $("#total-nav").mouseleave(function () {
      $('#community').removeClass('acup');
      $('#store').removeClass('acup');
      $('#header-cate').removeClass('acup');
    }); //????????? ???????????????


    $('#header-category').mouseover(function () {
      $('#header-cate').addClass('acup')
    });
    //?????????????????? ????????? ?????????
    $('#first-nav').mouseover(function () {
      $('#header-cate').removeClass('acup')
    });   
    //????????? ????????? ?????????????????? ???????????? dis:none
    $('#grab').mouseover(function () {
        $('#header-cate').removeClass('acup')
    });   
    //????????? ???????????? ??????????????? ??????????????? ???????????? ?????? 
    

    $('#header-cate').mouseleave(function () {
      $('#header-cate').removeClass('acup')
    });
    //???????????? ???????????????
	$(document).ready(function () {
	      $('.inimg').hover(function () {
	          $('.ico').toggle();
	      }); 
	  
	      $('.ico').mousemove(function () {
	          $('.Exp').toggle();
	      });
		});
    
  }); //end jquery

 //??????
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