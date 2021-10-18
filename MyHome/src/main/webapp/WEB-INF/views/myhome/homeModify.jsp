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
<title>내집 뽐내기</title>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">

	<style>
		#main{
        width: 100%;
        height: 300px;
    }

    .contain{
        width: 60%;
        margin: 0px auto;
    }

    #before-title{
        text-align: left;
        color: blue;
    }

    #title{
        font-size: 35px;
        text-align: center;
    }

    .img{
        height: 240px;
        width: 100%;
        border-radius: 5%;
      }

    .profile{
        width: 20px;
        height: 20px;
        border-radius: 50%;
    }

    .card{
        margin-bottom: 10px;
        border: none;
        background: none;
     }
     .index1{
         font-weight: bold;
     }
     .index2{
         color: blue;
     }
     .inimg{
         width: 100%;
         height: auto;
         text-align: center;
     }

     .boast_write{
        position: relative;
        left: 5%;
     }
     .view-count{
         text-align: center;

     }
     .userimg {
    position: absolute;
    width: 30px;
    height: 30px;
    top: 2px;
    margin-left: 10px;
    border-radius: 100%;
    background-color: #dbdbdb;
	}
	
	.reply-wrap {
	    background: #f5f5f5;
	    padding: 15px;
	    border: 1px solid #ddd;
	    position: relative;
	}
	
	.reply-wrap .reply-image {
	    position: absolute;
	    left: 15px;
	    top: 15px;
	
	}
	
	.reply-wrap .reply-content {
	    padding-left: 60px;
	}
	
	.reply-content textarea {
	    resize: none;
	    width: 100%;
	    margin-bottom: 10px;
	}
	
	.reply-input > .form-control {
	    width: 200px;
	    margin-bottom: 5px;
	}
	
	.reply-input {
	    float: left;
	}
	
	.reply-group button {
	    float: right;
	}
	
	.reply-group small {
	    margin-left: 10px;
	    height: 20px;
	    line-height: 20px;
	}
	
	.reply-group a {
	    text-decoration: none;
	    color: #777;
	    float: right;
	}
	.btcon{
	    float: right;
	    margin-bottom: 20px;
	}
	.info{
	     text-align: center;
	}
	.title{
	    text-align: center;
	}
	.text-muted{
	    text-align: center;
	}
	.text-dete{
	    text-align: center;
	}
	.title-profile{
	    text-align: center;
	}
	#before-title{
	    text-align: center;
	}
	.pagination{
	    margin-top: 20px;
	}
	ul {
	    width: 300px;
	    margin-left: auto;
	    margin-right: auto;
  	}
  .inwrite{
      width: 100%;
	  }
	  .info{
	    margin: 30px 0 30px 0;
	      background-color: lightskyblue;
	      width: 45%;
	      position: relative;
	      left: 25%;
	  }
	  .boast_write{  
	      position: relative;
	  }
	  .boast_write .ico{
	    position:absolute;
	    bottom: 300px;
	     left:450px;
	     display: none;
	  }
	  .clearfix::after {
	    display: block;
	    clear: both;
	    content: "";
	}
	.boast_write .Exp{
	    position:absolute;
	    bottom: 300px;
	     left:470px;
	     display: none;
	     border: black solid 1px;
	     width: 200px;
	     height: auto;
	     background-color: rgba(254, 253, 253, 0.2);;
	  }
.exptxt{
    font-size: 12px;
}
	</style>
</head>

<body>
  <main class="mt-3">
    <div class="container" style="width: 50%;">
       <h2 class="text-center">수정하기</h2>
      
       <br>

       <h4 class="mb-3">필수 정보 입력</h4>  
       <form action='<c:url value="/myhome/homeUpdate" />' method="post" id="modiForm" enctype="multipart/form-data"> 
       
           <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">주거 형태 *</label>
               <div class="col-md-9">
                   <div class="input-group mb-3">
                       <select class="input-box form-control" name="homeForm">
	                        <option selected disabled>선택해주세요.</option>
	                        <option ${home.homeForm == '아파트' ? 'selected' : ''}>아파트</option>
	                        <option ${home.homeForm == '빌라' ? 'selected' : ''}>빌라</option>
	                        <option ${home.homeForm == '오피스텔' ? 'selected' : ''}>오피스텔</option>
	                        <option ${home.homeForm == '단독주택' ? 'selected' : ''}>단독주택</option>
                      	</select> 
                     </div>
               </div>
           </div>
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
              <label  class="col-md-3 col-form-label">예산 *</label>
              <div class="col-md-9">
                <select class="form-control" name="money">          
                    <option selected disabled>선택해주세요.</option>
                    <option ${home.money == '500만원 미만' ? 'selected' : ''}>500만원 미만</option>
                    <option ${home.money == '500~1000만원' ? 'selected' : ''}>500~1000만원</option>
                    <option ${home.money == '1000~1500만원' ? 'selected' : ''}>1000~1500만원</option>
                    <option ${home.money == '1500~2000만원' ? 'selected' : ''}>1500~2000만원</option>
                    <option ${home.money == '2000~3000만원' ? 'selected' : ''}>2000~3000만원</option>
                    <option ${home.money == '3000~4000만원' ? 'selected' : ''}>3000~4000만원</option>
                    <option ${home.money == '4000~5000만원' ? 'selected' : ''}>4000~5000만원</option>
                    <option ${home.money == '5000만원 이상' ? 'selected' : ''}>5000만원 이상</option>
                </select> 
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
              <label  class="col-md-3 col-form-label">가족형태 *</label>
              <div class="col-md-9">
                <select class="form-control" name="family">
                    <option selected disabled>선택해주세요.</option>
                    <option ${home.family == '싱글라이프' ? 'selected' : ''}>싱글라이프</option>
                    <option ${home.family == '신혼부부' ? 'selected' : ''}>신혼부부</option>
                    <option ${home.family == '자녀가 있는 집' ? 'selected' : ''}>자녀가 있는 집</option>
                    <option ${home.family == '부모님과 함께사는 집' ? 'selected' : ''}>부모님과 함께사는 집</option>
                    <option ${home.family == '룸메이트와 사는 집' ? 'selected' : ''}>룸메이트와 사는 집</option>
                    <option ${home.family == '기타' ? 'selected' : ''}>기타</option>
                </select>
              </div>
           </div> 
           <div class="mb-3 row">
              <label  class="col-md-3 col-form-label">작업자 *</label>
              <div class="col-md-9" id="work">
                <input type="radio" name="worker" value="셀프" ${home.worker == '셀프' ? 'checked' : ''}>셀프 &nbsp;&nbsp;&nbsp;
                <input type="radio" name="worker" value="반셀프" ${home.worker == '반셀프' ? 'checked' : ''}>반셀프 &nbsp;&nbsp;&nbsp;
                <input type="radio" name="worker" value="전문가" ${home.worker == '전문가' ? 'checked' : ''}>전문가
              </div>
          </div>             
           <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">방향</label>
               <div class="col-md-9">
                  <select class="form-control" name="direction">
                    <option selected disabled>선택해주세요.</option>
                    <option ${home.direction == '남향' ? 'selected' : ''}>남향</option>
                    <option ${home.direction == '동향' ? 'selected' : ''}>동향</option>
                    <option ${home.direction == '북향' ? 'selected' : ''}>북향</option>
                    <option ${home.direction == '서향' ? 'selected' : ''}>서향</option>
                    <option ${home.direction == '남동향' ? 'selected' : ''}>남동향</option>
                    <option ${home.direction == '남서향' ? 'selected' : ''}>남서향</option>
                    <option ${home.direction == '북동향' ? 'selected' : ''}>북동향</option>
                    <option ${home.direction == '북서향' ? 'selected' : ''}>북서향</option>
                  </select>
               </div>
           </div> 
           <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">준공연차</label>
               <div class="col-md-9">
                  <select class="form-control" name="age">
                    <option selected disabled>선택해주세요.</option>
                    <option ${home.age == '2년 미만' ? 'selected' : ''}>2년 미만</option>
                    <option ${home.age == '2~4년' ? 'selected' : ''}>2~4년</option>
                    <option ${home.age == '5~10년' ? 'selected' : ''}>5~10년</option>
                    <option ${home.age == '11~15년' ? 'selected' : ''}>11~15년</option>
                    <option ${home.age == '16~20년' ? 'selected' : ''}>16~20년</option>
                    <option ${home.age == '21~25년' ? 'selected' : ''}>21~25년</option>
                    <option ${home.age == '26년 이상' ? 'selected' : ''}>26년 이상</option>
                  </select>
               </div>
           </div>     
           <div class="mb-3 row">
               <label  class="col-md-3 col-form-label">지역</label>
               <div class="col-md-9">
                   <div class="input-group mb-3">
                      <select class="form-control" name="region">
                        <option selected disabled>선택해주세요.</option>
                        <option ${home.region == '서울특별시' ? 'selected' : ''}>서울특별시</option>
                        <option ${home.region == '부산광역시' ? 'selected' : ''}>부산광역시</option>
                        <option ${home.region == '인천광역시' ? 'selected' : ''}>인천광역시</option>
                        <option ${home.region == '대구광역시' ? 'selected' : ''}>대구광역시</option>
                        <option ${home.region == '광주광역시' ? 'selected' : ''}>광주광역시</option>
                        <option ${home.region == '울산광역시' ? 'selected' : ''}>울산광역시</option>
                        <option ${home.region == '강원도' ? 'selected' : ''}>강원도</option>
                        <option ${home.region == '경기도' ? 'selected' : ''}>경기도</option>
                        <option ${home.region == '전라남도' ? 'selected' : ''}>전라남도</option>
                        <option ${home.region == '전라북도' ? 'selected' : ''}>전라북도</option>
                        <option ${home.region == '경상남도' ? 'selected' : ''}>경상남도</option>
                        <option ${home.region == '경상북도' ? 'selected' : ''}>경상북도</option>
                        <option ${home.region == '충청남도' ? 'selected' : ''}>충청남도</option>
                        <option ${home.region == '충청북도' ? 'selected' : ''}>충청북도</option>
                        <option ${home.region == '제주도' ? 'selected' : ''}>제주도</option>
                      </select>
                    </div>
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
                   <div class="alert alert-secondary" role="alert" id="thumbPlace">
	                  <img alt="thumb" src="" id="thumb" style="display: none;">
	                  <ul id="thumbText">
	                      <li>이미지 사이즈 : 350*350</li>
	                      <li>파일 사이즈 : 1M 이하</li>
	                      <li>파일 확장자 : png, jpg, jpeg만 가능</li>
	                  </ul>
                   </div>
                    
                     
               </div>
           </div>
          
           <input type="hidden" name="writer" value="jiseong"> <!-- 세션에서 얻어온 nick 넣어주기 -->            
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
	                  <button type="button" class="btn btn-lg btn-dark" id="cancelBtn">취소하기</button>
	                  <button type="button" class="btn btn-lg btn-info" id="subBtn">등록하기</button>
	              </div>
	          </div>
	          
	          <input type="hidden" name="bno" value="${home.bno}">
          </form>
          

       </div>
  </main>



</body>
        

        
<script>
$(function() { //start jquery
	//등록하기 버튼 이벤트
	$('#subBtn').click(function() {	
	
		if($('select[name=place] option:selected').val() === '선택해주세요.'){
			alert('시공 영역을 선택해 주세요.');
			$('select[name=place] option:selected').focus();
			return;
		}
		else if($('select[name=homeForm] option:selected').val() === '선택해주세요.'){
			alert('주거 형태를 선택해 주세요.');
			$('select[name=homeForm] option:selected').focus();
			return;		
		}
		else if($('select[name=homeSize] option:selected').val() === '선택해주세요.'){
			alert('평수를 선택해 주세요.');
			$('select[name=homeSize] option:selected').focus();
			return;		
		}			
		else if($('select[name=money] option:selected').val() === '선택해주세요.'){
			alert('예산을 선택해 주세요.');
			$('select[name=money] option:selected').focus();
			return;		
		}
		else if($('select[name=family] option:selected').val() === '선택해주세요.'){
			alert('가족형태를 선택해 주세요.');
			$('select[name=family] option:selected').focus();
			return;		
		}
		else if($('select[name=worker] option:selected').val() === '선택해주세요.'){
			alert('작업자를 선택해 주세요.');
			$('select[name=worker] option:selected').focus();
			return;		
		}
		else if($('input[name=title]').val() === ''){
			alert('제목을 작성해 주세요.');
			$('input[name=title]').focus();
			return;	
		}
		else if($('textarea[name=content]').val() === ''){
			alert('내용을 작성해 주세요.');
			$('textarea[name=content]').focus();
			return;	
		}
		else{
			$('#modiForm').submit();	
		}
		
	});
		
	
	//취소버튼 클릭 이벤트
	$('#cancelBtn').click(function() {
		if(confirm('글 작성을 취소하시겠습니까?')){
			location.href = '${pageContext.request.contextPath}/myhome/homeList';
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
	
	
}); //end jquery
</script>
        
        
 <%@include file = "../include/footer.jsp" %> 