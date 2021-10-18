<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
 
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mypage2.css" rel="stylesheet">
 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
 <body style="margin-top: 130px;">
 <section class="sections">
    <div class="container-fluid">
       <div class="row">
        <div class="col-md-12">
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
                     <button type="button" class="btn btn-outline-success btn-sm scrap-btn" style="border: 1px solid black;">완성형 인테리어 </button>
                  </li>
                     
                  <li class="category-item" data-filter4="" data-sort="rgstdtime">
                     <button type="button" class="btn btn-outline-success btn-sm scrap-btn" style="border: 1px solid black;">스토어 </button>
                  </li>
      
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
              <button type="button" id="del-btn" class="btn btn-info btn-sm" style="width: 205px;">확인</button>
              </div>
                </div>
          </form>
         </div>
         </div>
      </div>
     </div>
 
</body>

<script>

   const msg = '${msg}';
   console.log('msg: ' + msg);
   if(msg === 'modifyFail') {
	   alert('비밀번호가 일치하지 않습니다. 다시 확인해 주세요.');
   } else if (msg === 'modifySuccess') {
	   alert('회원정보 수정이 완료되었습니다.');
   }
     
      
   
   // jquery start
   $(function() {
	   
	   var keyword = '${keyword}';
	  
	  getList('home', 1, keyword);		   
	   
      // 뽐내기 버튼 클릭
      $('#home-btn').click(function() {
         getList('home', 1, keyword);
      });
      
      // 스크랩 버튼
      $('.scrap-btn').click(function() {
         getList('scrap', 1, keyword);
      });
      
      // 질문/답변 버튼 클릭
      $('#quiz-btn').click(function() {
         getList('quiz', 1, keyword);
      });
      
      // 추천/질문 버튼
      $('#reco-quiz-btn').click(function() {
         getList('recoQuiz', 1);
      });
      
      // 등업 신청 버튼
      $('#upgrade-btn').click(function() {
         getList('upgrade', 1);
      });
      
      let StrAdd = "";
      let pageStr = "";
      // 목록(비동기)
      function getList(type, pageNum, keyword) {
         
         $.getJSON(
            "<c:url value='/myhome/allSearch/" + type + "?pageNum=" + pageNum + "&keyword=" + keyword + "'/>",
            function(data) {
               
               let list = data.list;
               let pc = data.pc;
               console.log("뽐내기 목록");
               console.log(list);
               
               StrAdd = '';
               
               if(list === null || list[0] === null) {
                  StrAdd   += "게시글이 존재하지 않습니다.";
               }else {      
                  console.log('리스트 데이터 받아옴');
                  if(type === 'home' || type === 'scrap') {
                     for(let i=0; i<list.length; i++) {
                        StrAdd += "<div class='col-md-4 cards' style='position: initial;'>";
                        StrAdd += "<div class='card' style='width: 13rem;'>";
                        StrAdd += "<img src='${pageContext.request.contextPath}/resources/img/interior10.png' class='card-img-top' alt='미리보기'>";
                        StrAdd   += "<div class='card-body'>";
                        StrAdd   += "<h5 class='card-title'><a href='<c:url value='/myhome/homeDetail?bno=" + list[i].bno + "'/>'>" + list[i].title + " </a></h5>";
                        StrAdd   += "<p class='card-text'>글내용</p>";
                        StrAdd   += "<hr>";
                        StrAdd   += "<div class='d-flex justify-content-between align-items-center'>";
                        StrAdd   += "<a class='dete'>" + timeStamp(list[i].regDate) + "</a>";
                        StrAdd   += "<a class='eye'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-eye-fill' viewBox='0 0 16 16'>";
                        StrAdd   += "<path d='M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z'></path>";
                        StrAdd   += "<path d='M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z'></path>";
                        StrAdd   += "</svg>" + list[i].viewCnt + "</a>";
                        StrAdd   += "</div>";
                        StrAdd   += "</div>";
                        StrAdd   += "</div>";
                        StrAdd   += "</div>";
                     }
                  } else if(type === 'quiz' || type === 'recoQuiz' || type ==='upgrade') {
                        StrAdd += "<div class='col-md-12'>";
                        StrAdd += "<div class='board'>";
                        StrAdd += "<div class='row'>";
                        StrAdd += "<div class='col-md-12'>";
                        StrAdd += "<div><table class='table table-hover table-bod' style='width: 800px;'>";
                        StrAdd += "<thead><tr style='background-color: #17a2b8;'>";
                        StrAdd += "<th width='10%'>번호</th>";
                        StrAdd += "<th width='45%'>제목 </th>";
                        StrAdd += "<th width='15%'>작성자 </th>";
                        if(type === 'upgrade') {
                           StrAdd += "<th width='20%'>가입일</th>";
                           StrAdd += "<th width='10%'>등급</th></tr></thead>";
                           for(let i=0; i<list.length; i++) {
                              StrAdd += "<tbody><tr><td>" + list[i].userNum + "</td>";
                              StrAdd += "<td class='title'>";
                              StrAdd += "<a href='<c:url value='/user/proInfo/" + list[i].userNum + "' />'>" + list[i].nickName +"님의 등업 신청 </a>";
                              StrAdd += "<td>" + list[i].nickName + "</td><td>" + timeStamp(list[i].regDate) + "</td>";
                              StrAdd += "<td>" + list[i].grade + "</td><tr></tbody>";
                           }
                        } else {
                           StrAdd += "<th width='20%'>작성일</th>";
                           StrAdd += "<th width='10%'>조회</th></tr></thead>";
                           for(let i=0; i<list.length; i++) {
                              StrAdd += "<tbody><tr><td>" + list[i].quizNum + "</td>";
                              StrAdd += "<td class='title'>";
                              StrAdd += "<a href='<c:url value='/quiz/quizDetail/" + list[i].quizNum + "' />'>" + list[i].title + "</a>";
                              if(list[i].newMark){
                                 StrAdd += "<span class='new'>NEW!</span></td>";                                 
                              }
                              StrAdd += "<td>" + list[i].writer + "</td><td>" + timeStamp(list[i].regDate) + "</td>";
                              StrAdd += "<td>" + list[i].views + "</td><tr></tbody>";
                           }
                        }

                        StrAdd += "</table></div></div></div></div></div>";
                     }
               }
               $('.articles-wrap').html(StrAdd);
               
               // 페이지 버튼 생성
               if(list.length > 0) {
                  pageStr = '';
                  
                  pageStr += "<ul class='pagination'>";
                  
                  if(paging.prev) {
                     pageStr += "<li class='page-item'>";
                     pageStr += "<button type='" + type + "' pageNum='" + --paging.beginPage  + "' class='page-link'>◁</button>";
                ++paging.beginPage
                     pageStr += "</li>";                              
                  }
                  
                  for(let k=paging.beginPage; k<=paging.endPage; k++) {
                     pageStr += "<li class='page-item'>";
                     pageStr += "<button type='" + type + "' pageNum='" + k + "' class='page-link' >" + k + "</button>";
                     pageStr += "</li>";
                     }
                  
                  if(paging.next) {
                     pageStr += "<li class='page-item'>";
               pageStr += "<button type='" + type + "' pageNum='" + ++paging.endPage  + "' class='page-link'>▷</button>";
                     pageStr += "</li>";
                  }
               
                  pageStr += "</ul>";
                  
                  $('#page-btn-wrap').html(pageStr);
               } // 페이지 버튼 생성 끝
               
            }
               
         ); //getJson end
      } // 목록 함수 끝
      
      // 댓글 페이징 이벤트
      $('#page-btn-wrap').on('click', 'button', function() {
         getList($(this).attr('type'), $(this).attr('pageNum'));
      });
      
      // 날짜 보정 함수
      function timeStamp(millis) {
                  
         let time;
         
        let regDate = new Date(millis);
        let year = regDate.getFullYear();
        let month = regDate.getMonth() + 1;
        let day = regDate.getDate();
        
        time = year + "-" + month + "-" + day;            
      
         return time;
      }
      
      // 탈퇴 버튼 클릭
      $('#del-btn').click(function() {
         if('${userInfo.pw}' !== $('#pw').val() ) {
            alert('비밀번호를 확인해주세요.');
            $('#pw').val('');
         } else {
            const result = confirm('정말 탈퇴하시겠습니까?');
            if(result) {
               $('#del-btn').attr('type', 'submit');               
            }
         }
      });
      
      
   }); // jquery end
   
   </script>
</html>