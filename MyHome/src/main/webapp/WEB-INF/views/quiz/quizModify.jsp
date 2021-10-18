<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA</title>
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/img/home-icon.png">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<style>
#contentForm {
   width: 40%;
   margin: 0 auto;
   padding-top: 30px;
}
.table>thead>tr>th, .table>tbody>tr>th {
   background-color: #e6ecff;
   text-align: center;
}
.boast_inwrite{
            background-color: white;
            width: 100%;
            height: 300px;
            overflow:auto;
        }
.btns {
   text-align: right;
}
</style>


</head>

<body style="margin-top: 130px;">


   <form action='<c:url value="/quiz/quizModify" />'  method="post" enctype="multipart/form-data">
   <h2 class="text-center">수정하기</h2>
      <div id="contentForm">
         <input type="hidden" name="quizNum" value="${article.quizNum }"> 
         <input type="hidden" name="content" value=""> 
         <input type="hidden" name="fileLoca" value="${article.fileLoca }"> 
         <input type="hidden" name="pageNum" value="${page.pageNum }">
         <input type="hidden" name="condition" value="${page.condition }">
         <input type="hidden" name="keyWord" value="${page.keyword }">
         <input type="hidden" name="sort" value="${page.sort }">
         <div class="input-group input-group-sm" role="group" aria-label="...">
            <table class="table table-striped table-bordered">   
               <thead>
                  <tr>
                     <th style="padding-bottom: 15px;">제목</th>
                     <td>
                        <input type="text" name="title" value="${article.title}" class="form-control" aria-describedby="basic-addon1">
                     </td>
                  </tr>
                  <tr>
                            <th style="padding-bottom: 15px;">분류</th>
                            <td>     
                                <input type="checkbox" class="checkcss" name="type" value="도배"> 도배
                                <input type="checkbox" class="checkcss" name="type" value="장판"> 장판
                                <input type="checkbox" class="checkcss" name="type" value="조명"> 조명
                                <input type="checkbox" class="checkcss" name="type" value="타일"> 타일
                                <input type="checkbox" class="checkcss" name="type" value="페인트"> 페인트 <br>
                                <input type="checkbox" class="checkcss" name="type" value="필름시트"> 필름시트
                                <input type="checkbox" class="checkcss" name="type" value="상품"> 인테리어 상품
                                <input type="checkbox" class="checkcss" name="type" value="기타"> 기타
                            </td>
                        </tr>
               </thead>
               <tbody>
                  <tr>
                     <td colspan="2">
                        <div contentEditable="true" id="content" class="boast_inwrite">${article.content }</div>
                        <input multiple="multiple" type="file" name="file" value="${article.fileLoca }">
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="btn-group btn-group-sm" role="group" aria-label="..." style="margin-bottom: 100px;">
            <input type="submit" id="modify-btn" class="btn btn-outline-success btns" value="수정">
         </div>
      </div>
   </form>

</body>

<script>
   
   $(function() {
      
      $('#modify-btn').click(function() {
         const content = $('#content').text();
         $('input[name=content]').val(content);
      });
      
      // 질문 유형 체크 박스
        const types = '${article.type}'.split(',');
        
        for(var i=0; i<types.length; i++) {
           for(var j=0; j<$('.checkcss').length; j++) {
              if(types[i] == $('.checkcss')[j].value) {
                 $('.checkcss')[j].checked = 'true';
              }
           }
        }
      
   }); //jquery end
   
</script>

</html>

<%@ include file="../include/footer.jsp"%>