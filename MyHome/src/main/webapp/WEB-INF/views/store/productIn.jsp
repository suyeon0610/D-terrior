<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>  제품등록  </title> 
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<style>
    .ex{
      margin-left: 400px;
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
<body style="margin-top: 130px;">
    <main class="mt-3">
     <div class="container">
        <h2 class="text-center">제품등록</h2>
        <form action='<c:url value="/store/productIn" />' method="post" enctype="multipart/form-data">
	        <div class="mb-3 row">
	            <label  class="col-md-3 col-form-label">제품명*</label>
	            <div class="col-md-9">
	              <input type="text" id="productName" name="name" class="form-control" >
	            </div>
	        </div>
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">제품가격*</label>
	                <div class="col-md-9">
	                    <div class="input-group mb-3">
	                        <input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" id="price" name="price" class="form-control">
	                        <span class="input-group-text" >원</span>
	                      </div>
	                </div>
	            </div>
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">배송비*</label>
	                <div class="col-md-9">
	                    <div class="input-group mb-3">
	                        <input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" id="deliPrice" name="deliPrice" class="form-control">
	                        <span class="input-group-text" >원</span>
	                      </div>
	                </div>
	            </div>   
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">추가배송비(도서산간)</label>
	                <div class="col-md-9">
	                    <div class="input-group mb-3">
	                        <input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" id="deliPlus" name="deliPlus" class="form-control">
	                        <span class="input-group-text" >원</span>
	                      </div>
	                </div>
	            </div>   
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">제품 카테고리*</label>
	                <div class="col-md-9">
	                    <div class="row">
	                        <div class="col-auto">
	                            <select name="category1" id="category1" class="form-select">
	                                <option>가구</option>
	                                <option>패브릭</option>
	                                <option>가전</option>
	                                <option>주방용품</option>
	                                <option>생활용품</option>
	                                <option>수납</option>
	                                <option>캠핑용품</option>
	                                <option>반려동물</option>
	                            </select>
	                            <select name="category2" id="category2" class="form-select">
	                                <option>거실가구</option>
	                                <option>침실가구</option>
	                                <option>주방가구</option>
	                                <option>유아동가구</option>
	                                <option>수납가구</option>
	                            </select>
	                        </div>
	                    </div>
	                </div>
	            </div>      
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">출고일</label>
	                <div class="col-md-9">
	                    <div class="input-group mb-3">
	                        <input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" id="releaseDate" name="releaseDate" class="form-control">
	                        <span class="input-group-text" >일 이내 출고</span>
	                      </div>
	                </div>
	            </div>    
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">썸네일 이미지*</label>
	                <div class="col-md-9">
	                    <input id="thumbnail" class="form-control" type="file" name="thumbnailImg" accept="image/png,image/jpeg">
	                    <div id="thumbPlace" class="alert alert-secondary" role="alert">
	                    	<img alt="thumb" src="" id="thumb" style="display: none;">
		                   <ul class="thumText">
		                       <li>이미지 사이즈 : 350*350</li>
		                       <li>파일 사이즈 : 1M 이하</li>
		                       <li>파일 확장자 : png,jpg만 가능</li>
		                   </ul>
                      </div>
	                </div>
	            </div>  
	            <div class="mb-3 row">
	                <label  class="col-md-3 col-form-label">제품 이미지*</label>
	                <div class="col-md-9">
	                    <input id="productImg" class="form-control" multiple="multiple" type="file" name="productImgs" accept="image/png,image/jpeg" multiple>
	                    <div class="alert alert-secondary" role="alert">
	                   <ul>
	                       <li>최대 5개가능</li>
	                       <li>이미지 사이즈 : 350*350</li>
	                       <li>파일 사이즈 : 1M 이하</li>
	                       <li>파일 확장자 : png,jpg만 가능</li>
	                   </ul>
	                      </div>
	                </div>
	            </div>
	            <div class="mb-3 row">
	               	<label  class="col-md-3 col-form-label">제품 상세설명*</label>
	                <div class="col-md-9">
            			<textarea id="textarea" name="productExplan" rows="5" cols="111"></textarea>    
                    </div>
            	</div>
	            
	            <div class="mb-3 row text-center">
	                <div class="col-12 d-grid p-1 ">
	                    <button type="button" id="regist-btn" class="btn btn-lg btn-info">등록하기</button>
	                </div>
	            </div>
            </form>
        </div>
    </main>
</body>

<script>

	//jquery start
	$(function() {
		var str = $('#textarea').val();
		str = str.split('<br/>').join("\r\n");
		$('#textarea').val(str);
		
		var regex = /^[0-9]*$/;
		
		$('#regist-btn').click(function() {
			if($('#productName').val() === '') {
				alert('이름을 입력해주세요.');
				$('#productName').focus();
			} else if($('#price').val() === '') {
				alert('상품 가격을 입력해주세요.');	
				$('#price').focus();
			} else if($('#deliPrice').val() === '') {
				alert('배송비를 입력해주세요.');
				$('#deliPrice').focus();
			} else if($('#thumbnail').val() === ''){
				alert('썸네일을 선택해 주세요.');
				$('#productImg').focus();
			} else if($('#thumbnail').val() === ''){
				alert('제품이미지를 선택해 주세요.');
				$('#thumbnail').focus();
			} else if(!regex.test($('#releaseDate').val())) {
				alert('출고일은 숫자만 입력 가능합니다.');
				$('#releaseDate').focus();
			} else {
				$('#regist-btn').attr('type', 'submit');
			}
		}); // 등록 버튼 끝
		
		$('#category1').change(function() {
			let strAdd = "";
			if($(this).val() === '가구') {
				strAdd += "<option>거실가구</option>";
				strAdd += "<option>침실가구</option>";
				strAdd += "<option>주방가구</option>";
				strAdd += "<option>유아동가구</option>";
				strAdd += "<option>수납가구</option>";
			} else if($(this).val() === '패브릭') {
				strAdd += "<option>침구</option>"
				strAdd += "<option>커튼/블라인드</option>"
				strAdd += "<option>카페트/러그</option>"
				strAdd += "<option>쿠션/방석</option>"
			} else if($(this).val() === '가전') {
				strAdd += "<option>대형가전</option>"
				strAdd += "<option>주방가전</option>"
				strAdd += "<option>생활가전</option>"
				strAdd += "<option>청소가전</option>"
				strAdd += "<option>디지털가전</option>"
			} else if($(this).val() === '주방용품') {
				strAdd += "<option>그릇/홈세트</option>"
				strAdd += "<option>컵/잔/텀블러</option>"
				strAdd += "<option>냄비/프라이팬</option>"
				strAdd += "<option>조리도구</option>"
				strAdd += "<option>보관/용기</option>"
			} else if($(this).val() === '생활용품') {
				strAdd += "<option>욕실용품</option>"
				strAdd += "<option>수건/타월</option>"
				strAdd += "<option>청소용품</option>"
				strAdd += "<option>세탁용품</option>"
			} else if($(this).val() === '수납') {
				strAdd += "<option>수납장/서랍장</option>"
				strAdd += "<option>리빙박스</option>"
				strAdd += "<option>바구니/바스켓</option>"
			} else if($(this).val() === '캠핑용품') {
				strAdd += "<option>캠핑가구</option>"
				strAdd += "<option>캠핑생활용품</option>"
				strAdd += "<option>캠핑주방용품</option>"
			} else if($(this).val() === '반려동물') {
				strAdd += "<option>강아지 리빙</option>"
				strAdd += "<option>강아지 위생</option>"
				strAdd += "<option>강아지 미용</option>"
				strAdd += "<option>고양이 리빙</option>"
				strAdd += "<option>고양이 위생</option>"
				strAdd += "<option>고양이 미용</option>"
			}
			
			$('#category2').html(strAdd);
		});
		
		// 썸네일 미리보기
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
		  
			$('#myhomeImgs').change(function () {
				$('#myhomeImgs').attr('src', '#');
				$('#imgPlace').css('display', 'none');
			});// 미리보기 끝
			
		// textarea 줄 개행
		
		
	});
	
</script>
</html>

<%@ include file="../include/footer.jsp"%>
