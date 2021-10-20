<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file = "../include/header.jsp" %> 

<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <title>  마이 페이지  </title> 
   <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">

   <meta name="description" content="Source code generated using layoutit.com">
   <meta name="author" content="LayoutIt!">


   <link href="${pageContext.request.contextPath }/resources/css/mypage2.css" rel="stylesheet">
     
    
   
   <style>
   .sections{

  margin: 100px 250px 0 250px;
}

   </style>
   
   

</head>
 
 <body style="margin-top: 130px;">
 <section class="sections">
    <div class="container-fluid">
       <div class="row">
          <div class="col-md-3">
             <div class="my_icon">
                <c:choose>
                   <c:when test="${user.profile == null}">
                      <img class="my" src='${pageContext.request.contextPath}/resources/img/mi_icon.webp'>
                   </c:when>
                   <c:otherwise>
                      <img class="my" src='<c:url value="/user/display?profile=${user.profile}"/>'>
                   </c:otherwise>
                </c:choose>
                <div class="ninkname">${user.nickName } </div>
                <div class="Attention">
                   <div class="inner">
                      <a class="scrap_url scrap-btn" href='<c:url value="/store/cart" />' style="color: black;">
                         <div class="scrap"><i class="fas fa-bookmark fa-2x"></i></div>
                         <div class="scrap_ko">
                               스크랩북
                         </div>
                         <div class="scrap_count">0</div>
                      </a>
                   </div>
                   <div class="inner">
                      <a class="koo_url" href='<c:url value="/store/coupon"/>' style="color: black;">
                         <div class="koo"><i class="fas fa-book fa-2x"></i>
                            </svg></div>
                         <div class="heart ko">쿠폰</div>
                         <div class="heart count">0</div>
                      </a>
                   </div>


                   <button id="#" onclick="location.href='<c:url value="/user/userModify" />'" class="btn btn-sm btn-outline-success btn-block btn-open-popup" type="button">개인정보 수정</button>
                   <c:choose>
                         <c:when test="${user.grade == 'admin'}">
                            <button id="#" onclick="window.open('${pageContext.request.contextPath}/chat/adminChat')" class="btn btn-sm btn-outline-success btn-block btn-open-popup'" type="button">관리자전용상담페이지</button>                      
                         </c:when>
                         <c:otherwise>                            
                         	<button id="delete" class="btn btn-sm btn-outline-success btn-block btn-open-popup btn-calc" type="button">회원 탈퇴</button>
                         </c:otherwise>
                   </c:choose>
             </div>
               

          </div>
          
       </div>

   
        <div class="col-md-9">
         <div class="board">
            
            <div class="category" style="text-align:left;">
               <ul>         
                  <li class="category-item is-active" data-filter4="" data-sort="" >
                     <button type="button" id="home-btn" class="btn btn-outline-success btn-sm" style="border: 1px solid black;">뽐내기</button>
                  </li>
               
                  <li class="category-item" data-filter4="" data-sort="rgstdtime">
                     <button type="button" id="quiz-btn" class="btn btn-outline-success btn-sm" style="border: 1px solid black;">질문과답변</button>
                  </li>
                  
                  <li class="category-item" data-filter4="" data-sort="rgstdtime">
                     <button type="button" class="btn btn-outline-success btn-sm scrap-btn" style="border: 1px solid black;">스크랩 </button>
                  </li>
                     
                     <c:choose>
                         <c:when test="${user.grade == 'admin' }">
                            <li class="category-item" data-filter4="" data-sort="rgstdtime">
                              <button type="button" id="upgrade-btn" class="btn btn-outline-success btn-sm" style="border: 1px solid black;">등급관리</button>
                           </li>
                        </c:when>
                        <c:when test="${user.grade == 'pro'}">
                           <li class="category-item" data-filter4="" data-sort="rgstdtime">
                              <button type="button" id="reco-quiz-btn" class="btn btn-outline-success btn-sm" style="border: 1px solid black;">추천질문</button>
                           </li>
                        </c:when>
                  </c:choose>
      
               </ul>
            </div>
            
            <div class="articles-wrap">
            <!--   비동기로 작성 
               <div class="col-md-3 cards">
                   <div class="card" style="width: 13rem;">
                     <img src="${pageContext.request.contextPath}/resources/img/interior10.png" class="card-img-top" alt="...">
                     <div class="card-body">
                        <h5 class="card-title">${a.title }</h5>
                        <p class="card-text">
                           글내용
                        </p>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
         
         
                           <a class="dete"><fmt:formatDate value="${a.regDate }" pattern="yyyy-MM-dd"/> </a>
                           <a class="eye"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                 <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
                                 <path
                                    d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z">
                                 </path>
                              </svg>${a.viewCnt }</a>
         
                        </div>
                     </div>
                  </div>
               </div>
               게시글이 존재하지 않습니다.
               -->
            </div>
            
            

         </div>
      </div>

   </div>

   <nav id="page-btn-wrap" class="pagination-sm"  style="position: absolute; left: 55%">
   <!--  
      <ul class="pagination">
            <li class="page-item">
               <a class="page-link" href="#">
                  ◁
               </a>
            </li>         
            <li class="page-item">
               <a class="page-link" href='<c:url value="/" />'>
                  ${i }
               </a>
            </li>
         <li class="page-item">
            <a class="page-link" href="#">
               ▷
            </a>
         </li>
      </ul>
   -->
   </nav>
</div>

 </section>
 
 <!-- 회원 탈퇴 모달 -->
 <div class="modal" id="modal">
   <div class="modal_body block"><strong>회원탈퇴</strong><br>
  
     <div class="container">
      <div class="row">
        <div>
         <img class="modal-img" src="${pageContext.request.contextPath}/resources/img/logo2.jpg" alt="로고사진">
        </div>
        <form action='<c:url value="/user/userDelete" />' method="post">
           <div class="low" style="display: inline-block;">
           <div class="col">
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." required>
            <input type="hidden" name="id" value="${userInfo.id}">
         </div>
         <div class="delbt">
              <button type="button" id="del-btn" class="btn btn-outline-success btn-sm" style="width: 205px;">확인</button>
              </div>
                </div>
          </form>
         </div>
         </div>
      </div>
     </div>
 
</body>

</html>
<%@include file = "../include/footer.jsp" %> 