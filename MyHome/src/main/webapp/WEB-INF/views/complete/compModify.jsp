<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@include file = "../include/header.jsp" %> 
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>완성형 인테리어</title>
<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<style>
.bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }
  
  .side-text{
      display: inline-block;
      width: 100px;
      margin-bottom: 20px;
  }

  .pc-verbose{
      display: block;
  }

  .ex{
    margin-left: 400px;
  }

  #work{
    margin-top: 6px;
  }
  
  #thumb{
  	width: 100%;
  	height: 100%;
  	border-radius: 2%;
  }
	
	.thumbPlace{
	  	height: 400px; 
	  	padding: 0;
	  	border-radius: 2%;
	  	text-align: center;
	  	vertical-align: middle;  	
  	}
  	
  	.thumbText{
	  	list-style: none;
	  	position: relative;
	  	top: 150px;
	  } 
	</style>
</head>

<body>
  <main class="mt-3">
    <div class="container" style="width: 50%;">
       <h2 class="text-center">수정하기</h2>
      
       <br>

       <h4 class="mb-3">필수 정보 입력</h4>  
       <form action='<c:url value="/comp/compUpdate" />' method="post" id="modiForm" enctype="multipart/form-data"> 
                  
           <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">평수 *</label>
               <div class="col-md-9">
                   <div class="input-group mb-3">
                      <select class="form-control" name="homeSize">   
                        <option selected disabled>선택해주세요.</option>
                        <option ${home.homeSize == '10평 미만' ? 'selected' : ''}>10평 미만</option>
                        <option ${home.homeSize == '10~15평' ? 'selected' : ''}>10~15평</option>
                        <option ${home.homeSize == '16~20평' ? 'selected' : ''}>16~20평</option>
                        <option ${home.homeSize == '21~25평' ? 'selected' : ''}>21~25평</option>
                        <option ${home.homeSize == '26~30평' ? 'selected' : ''}>26~30평</option>
                        <option ${home.homeSize == '31~35평' ? 'selected' : ''}>31~35평</option>
                        <option ${home.homeSize == '36~40평' ? 'selected' : ''}>36~40평</option>
                        <option ${home.homeSize == '41~50평' ? 'selected' : ''}>41~50평</option>
                        <option ${home.homeSize == '51평 이상' ? 'selected' : ''}>51평 이상</option>
                      </select> 
                     </div>
               </div>
           </div>   
           
            <div class="mb-3 row">
              <label  class="col-md-3 col-form-label">가격 *</label>
              <div class="col-md-9">
	              <div class="input-group mb-3">
		              <input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" id="money" name="money" class="form-control input-sm" value="${home.money}" placeholder="가격을 입력해 주세요.">
		              <span class="input-group-text" >만원</span>
	              </div>
              </div>
           </div>
            
           <div class="mb-3 row">
	           <label  class="col-md-3 col-form-label">시공 영역 *</label>
	           <div class="col-md-9">
		            <select class="form-control" name="place">
		              <option selected disabled>선택해주세요.</option>
		              <option ${home.place == '전체' ? 'selected' : ''}>전체</option>
		              <option ${home.place == '주방' ? 'selected' : ''}>주방</option>
		              <option ${home.place == '화장실' ? 'selected' : ''}>화장실</option>
		              <option ${home.place == '조명' ? 'selected' : ''}>조명</option>
		              <option ${home.place == '발코니확장' ? 'selected' : ''}>발코니확장</option>
		              <option ${home.place == '거실' ? 'selected' : ''}>거실</option>
		              <option ${home.place == '방' ? 'selected' : ''}>방</option>
		              <option ${home.place == '중문' ? 'selected' : ''}>중문</option>
		              <option ${home.place == '방문' ? 'selected' : ''}>방문</option>
		              <option ${home.place == '폴딩도어' ? 'selected' : ''}>폴딩도어</option>
		              <option ${home.place == '기타' ? 'selected' : ''}>기타</option>
		          </select>
	           </div>
       		</div>
       		
           <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">방 개수</label>
               <div class="col-md-9">
                   <div class="input-group mb-3">
                      <select class="form-control" name="room">
                        <option selected disabled>선택해주세요.</option>
                        <option ${home.room == '1개' ? 'selected' : ''}>1개</option>
                        <option ${home.room == '2개' ? 'selected' : ''}>2개</option>
                        <option ${home.room == '3개' ? 'selected' : ''}>3개</option>
                        <option ${home.room == '4개' ? 'selected' : ''}>4개</option>
                        <option ${home.room == '5개 이상' ? 'selected' : ''}>5개 이상</option>
                      </select>
                     </div>
               </div>
           </div>  
             
            <hr class="my-4">
            
            <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">썸네일 이미지 *</label>
               <div class="col-md-9">
                   <input class="form-control" type="file" accept="image/png,image/jpeg,image/jpg" name="file">
                   <div class="alert alert-secondary thumbPlace" role="alert" id="thumbPlace">
	                  <img alt="thumb" src="" id="thumb" style="display: none;">
	                  <ul class="thumbText">
	                      <li>이미지 사이즈 : 350*350</li>
	                      <li>파일 사이즈 : 1M 이하</li>
	                      <li>파일 확장자 : png, jpg, jpeg만 가능</li>
	                  </ul>
                   </div>
                    
                     
               </div>
           </div>
          
           <input type="hidden" name="writer" value="${sessionScope.user.nickName}"> <!-- 세션에서 얻어온 nick 넣어주기 -->            
           <table class="table">
              <tbody class="t-control">    
                  <tr>
                      <td class="t-title">제목</td>
                      <td><input class="form-control input-sm" name="title" placeholder="제목을 입력해 주세요." value="${home.title}"></td>
                  </tr>
                  <tr>
                      <td class="t-title">내용</td>
                      <td>
                      <textarea class="form-control" rows="15" name="content" placeholder="내용을 입력해 주세요.">${home.content}</textarea>
                      </td>                 
                  </tr>
                  <tr>
                  	  <td class="t-title">내 집 이미지</td>
                  	  <td><input class="form-control" src="" multiple="multiple" type="file" id="myhomeImgs" name="myhomeImgs" accept="image/png,image/jpeg,image/jpg" multiple>
	                    <div class="alert alert-secondary thumbPlace" role="alert" id="imgPlace">
		                   <ul class="thumbText">
		                       <li>최대 5개가능</li>
		                       <li>이미지 사이즈 : 350*350</li>
		                       <li>파일 사이즈 : 1M 이하</li>
		                       <li>파일 확장자 : png, jpg, jpeg만 가능</li>
		                   </ul>
	                    </div>
                     </td>
                  </tr>    
              </tbody>
            </table>
         
	          <div class="mb-3 row text-center">
	              <div class="col-12 d-grid p-1 ">
	                  <button type="button" class="btn btn-lg btn-outline-success" id="cancelBtn">취소하기</button>
	                  <button type="button" class="btn btn-lg btn-outline-success" id="subBtn">등록하기</button>
	              </div>
	          </div>
	          
	          <input type="hidden" name="bno" value="${home.bno}">
          </form>
          

       </div>
  </main>



</body>
        

        
<script>
$(function() { //start jquery
	var regex= /^[0-9]/g;
	
	//등록하기 버튼 이벤트
	$('#subBtn').click(function() {				
		if($('select[name=place] option:selected').val() === '선택해주세요.'){
			alert('시공 영역을 선택해 주세요.');
			$('select[name=place] option:selected').focus();
			return;
		}			
		else if($('select[name=homeSize] option:selected').val() === '선택해주세요.'){
			alert('평수를 선택해 주세요.');
			$('select[name=homeSize] option:selected').focus();
			return;		
		}			
		else if($('select[name=money] option:selected').val() === '선택해주세요.'){
			alert('가격을 선택해 주세요.');
			$('select[name=money] option:selected').focus();
			return;		
		}		
		else if($('textarea[name=content]').val() === ''){
			alert('내용을 작성해 주세요.');
			$('textarea[name=content]').focus();
			return;	
		}		
		else if($('#thumb').attr('src') === ''){
			alert('썸네일 사진을 첨부해 주세요.');
			$('#thumb').focus();
			return;
		}
		else if($('#myhomeImgs').attr('src') === ''){
			alert('인테리어 이미지를 1장 이상 첨부해 주세요.');
			$('#myhomeImgs').focus();
			return;
		}	
		else{
			$('#modiForm').submit();				
		}
		
	});
		
	
	//취소버튼 클릭 이벤트
	$('#cancelBtn').click(function() {
		if(confirm('글 작성을 취소하시겠습니까?')){
			location.href = '${pageContext.request.contextPath}/comp/compList';
		}
		else
			return;					
	});
	
	//썸네일 미리보기 기능
	function preView(input) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.readAsDataURL(input.files[0]); 
			
			reader.onload = function(e) {
				$('#thumb').css('display', 'block');
				$('#thumb').attr('src', e.target.result);
				$('#thumbPlace ul').css('display', 'none');
				console.log(e.target);
			};
			
		}
	}
	
	$('input[name=file]').change(function() {
		preView(this);			
	});
	
	//내 집 사진 업로드 시
	$('#myhomeImgs').change(function () {
		$('#myhomeImgs').attr('src', '#');
		$('#imgPlace').css('display', 'none');
	});
	
	
}); //end jquery
</script>
        
        
 <%@include file = "../include/footer.jsp" %> 