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
    <title>  QnA  </title> 
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home-icon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <style>
        #contentForm {
            width: 40%;
            margin: 0 auto;
            padding-top: 12%;
        }
        .table>thead>tr>th,
        .table>tbody>tr>th {
           background-color: #F5F5F5;
            text-align: center;
        }
        .btns{
            text-align: right;
        }
        .boast_inwrite{
            background-color: white;
            width: 100%;
            height: 300px;
            overflow:auto;
        }
        .inimg{
		    width: 100%;
		    height: auto;
		    text-align: center;
		}
	
    </style>


</head>

<body>

    <form action='<c:url value="/quiz/quizRegist" />' method="post" enctype="multipart/form-data">
        <div id="contentForm"> 
        <h2 class="text-center">작성하기</h2>
	        <input type="hidden" name="content" value="">	         
	        <input type="hidden" name="writer" value="${user.nickName }">	         
            <div class="input-group input-group-sm" role="group" aria-label="...">
                <table class="table table-striped table-bordered">
                    <thead>
                       
                        <tr>
                            <th style="padding-bottom: 15px;">제목</th>
                            <td>
                            	<input id="title" type="text" name="title" class="form-control" aria-describedby="basic-addon1" autofocus="autofocus">
                            </td>
                        </tr>
                        <tr>
                            <th style="padding-bottom: 15px;">분류</th>
                            <td>     
                                <input type="checkbox" name="type" value="도배"> 도배
                                <input type="checkbox" name="type" value="장판"> 장판
                                <input type="checkbox" name="type" value="조명"> 조명
                                <input type="checkbox" name="type" value="타일"> 타일
                                <input type="checkbox" name="type" value="페인트"> 페인트 <br>
                                <input type="checkbox" name="type" value="필름시트"> 필름시트
                                <input type="checkbox" name="type" value="상품"> 인테리어 상품
                                <input type="checkbox" name="type" value="기타"> 기타
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2"> 
                            	<div contentEditable="true" id="content" class="boast_inwrite" style="white-space: pre"></div>

                            	<!-- 이미지 미리보기 
                            		<div class="img-wrap inimg">
                            			<img id="img" />
                            		</div>
                            	 -->
                                <input type="file" id="input_img" name="file">
                            </td>
                        </tr>
                    </tbody>
                </table>
	        	<div class="btn-group btn-group-sm" role="group" aria-label="..."> 
	            	<input type="button" id="regist-btn" class="btn btn-outline-success btns" value="글쓰기"> 
	            </div>
            </div>
        </div>
    </form>

</body>

<script>
	
	// jquery start
	$(function() {
		var strAdd;
		
		// 글 내용 보내기
		$('#regist-btn').click(function() {
			const content = $('#content').html();
			console.log(content);
			console.log($('#title').val());
			if($('#title').val() === '') {
				alert('제목을 입력해 주세요.');
			} else if(content === '') {
				alert('내용을 입력해 주세요.');
			} else {
				$('input[name=content]').val(content);
				$('#regist-btn').attr('type', 'submit');
			}
			
		});
		
		
		
		<%-- 이미지 미리보기
		var sel_file;
		
		$('#input_img').change(function(e) {
			
			const tag = "<div class='img-wrap'><img src='' id='img' class='inimg' /></div>";
			strAdd += tag;
			
			strAdd += "<div class='img-wrap'>";
			strAdd += "<img src='' id='img' class='inimg' />";
			strAdd += "</div>";
			$('#content').html(strAdd);
			
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			
			filesArr.forEach(function(f) {
				if(!f.type.match(reg)){
					alert('이미지파일만 업로드 가능합니다.');
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e) {
					console.log(e.target.result);
					$('#img').attr("src", e.target.result); // 읽은 파일 결과
				}
				reader.readAsDataURL(f);
			});
		}); // 이미지 파일 값 변경 시 수행
		--%>
		
	}); // jquery end
</script>


</html>
<%@ include file="../include/footer.jsp"%>