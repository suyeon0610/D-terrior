<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>QnA</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnApage.css">



</head>

<body style="margin-top: 130px; font-family:'Cafe24SsurroundAir';">

   <!-- Page Content -->
   <div class="container">

      <div class="row">
            <div class="col-md-12">
            
           

            <div class="row">

               <div class="col-md-12">

                  <div class="list" id="#">
                                                 
                            <b style="margin-top: 50px; margin-left: 45%; font-size: 20px;">질문과 답변 </b>
                        </div>
                        <div class="divisionx">
                            <div class="btn-group">
                                <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                         정렬
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                      <li><a class="dropdown-item" href='<c:url value="/quiz/quizList?pageNum=1&condition=${paging.page.condition }&keyword=${paging.page.keyword }" />'>최신순</a></li>
                                      <li><a class="dropdown-item" href='<c:url value="/quiz/quizList?pageNum=1&condition=${paging.page.condition }&keyword=${paging.page.keyword }&sort=popul" />'>인기순</a></li>
                                    </ul>
                                </div>
                              </div>
                            <button onclick="location.href='<c:url value="/quiz/quizRegist" />'" class="btn btn-outline-success btn-sm" style="position: relative; left: 86%;">질문하기</button> 
                        </div>

                  <div>
                     <table class="table table-hover">
                        <thead>
						<tr style="background-color: #f5f5f5;">	                              
							  <th width="10%">번호</th>
                              <th width="50%">제목</th>
                              <th width="10%">작성자</th>
                              <th width="20%">작성일</th>
                              <th width="10%">조회수</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:choose>
                              <c:when test="${paging.pageTotalCount != 0}">
                                 <c:forEach var="a" items="${articles }">
                                    <tr>
                                       <td>${a.quizNum}</td>
                                       <td class="title" id=""><a href='<c:url value="/quiz/quizDetail/${a.quizNum}?pageNum=${paging.page.pageNum }&condition=${paging.page.condition }&keyword=${paging.page.keyword }&sort=${paging.page.sort }" />'>${a.title}</a>
                                          <c:if test="${a.answerCnt!=0 }">
                                             <a href="#" style="color: crimson;">[${a.answerCnt }]</a>                                          
                                          </c:if>
                                          <c:if test="${a.newMark}">
                                             <span class="new">NEW!</span>
                                          </c:if>
                                       </td>
                                       <td>${a.writer}</td>
                                       <td><fmt:formatDate value="${a.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                       <td>${a.views}</td>
                                    <tr>                           
                                 </c:forEach>
                              </c:when>
                              <c:otherwise>
                                 <tr>
                                    <td colspan="5">
                                       존재하는 게시글이 없습니다. <br>
                                    </td>
                                 </tr>
                              </c:otherwise>
                           </c:choose>
                        </tbody>
                     </table>
                         <!-- 검색 태그 -->
                <form action='<c:url value="/quiz/quizList" />' method='get'>
                   <input type="hidden" name="pageNum" value="1">
                   <div class="row">
                       <div class="btn-group mr-sm-3">
                           <select class="form-control" name="condition" id="#">
                               <option value="title">제목</option>
                               <option value="writer">작성자</option>
                               <option value="content">내용</option>
                               <option value="titleContent">제목+내용</option>
                               <option value="type">카테고리</option>
                           </select>
                       </div>
                       <div id="#" class="my-2 col-md-3" style="border-radius: 50%;  position: relative; bottom:8px;"data-ride="carousel">
                       		<div class="input-group">
				               <input class="form-control mr-sm-3" type="search" name="keyword" placeholder="Search" aria-label="Search">
				               <button class="btn btn-outline-success lnr lnr-magnifier my-2 my-sm-0" type="submit"></button>
                            </div>
                        </div>
                   </div>
                 </form>
                     
                     <!-- 페이징 -->

                        <nav class="pagination-sm ">
                           <ul class="pagination "
                            style="position: absolute; left: 41.5%" 
                            id="pagenation">
                              <c:if test="${paging.prev }">
                                 <li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${paging.beginPage-1 }" />'> ◁ </a></li>                           
                              </c:if>
                              <c:forEach var="i" begin="${paging.beginPage}" end="${paging.endPage}">
                                 <li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${i}&condition=${paging.page.condition}&keyword=${paging.page.keyword}" />'> ${i} </a></li>                           
                              </c:forEach>
                              <c:if test="${paging.next }">
                                 <li class="page-item"><a class="page-link" href='<c:url value="/quiz/quizList?pageNum=${paging.endPage+1 }" />' > ▷ </a></li>                           
                              </c:if>
                           </ul>
                           
                        </nav>
                     
                     
                  </div>
               </div>
            </div>


         </div>
         <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

   </div>
   <!-- /.container -->



</body>

<script>

   const msg = '${msg}';
   if(msg == "delSuccess") {
      alert('삭제가 완료되었습니다.');
   } else if(msg == "regSuccess") {
      alert('질문 등록이 완료되었습니다.')
   }
/*
   // start JQuery
   $(function() {
      
      // 페이지 버튼 클릭 이벤트
      $('#pagenation').click(function(e) {
         
         e.preventDefault();
         const value = e.target.dataset.pageNum; 
         
         $('#pageForm').pageNum.val(value);
         $('#pageForm').sumbit();
      
      }); // 페이지 버튼 클릭 이벤트 끝
      
   }); // end JQuery
   
*/

   
</script>
</html>

<%@ include file="../include/footer.jsp"%>