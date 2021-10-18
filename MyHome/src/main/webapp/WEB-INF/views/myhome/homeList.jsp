<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file = "../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
	<title>내집 뽐내기</title>
	    
    
    <style>
     .sorting{
      height: 100px;
      
      }
      .bd-placeholder-img {
        font-homeSize: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-homeSize: 3.5rem;
        }
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
        display: inline-block;
      }
    

      .card-body{
        text-align: center;
      }

      .card-text{
        font-weight: 1000;
        margin-bottom: 3px;
        color: rgb(66, 63, 73);
      }

      .id-link{
        display: block;
      }

      #total{
        font-weight: 600;
        font-homeSize: 15px;
        margin: 30px 0 5px 1px;
      }

      .order-list{
        list-style: none;
        
      }

      .my-btn{
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
        user-select: none;
        display: inline-block;
        margin-right: 7px;
        margin-bottom: 15px;
        padding: 3px;
        box-sizing: border-box;
        border: 1px solid transparent;
        background: lightgray;
        font-family: inherit;
        color: black;
        font-weight: bold;
        font-homeSize: 15px;
        text-decoration: none;
        text-align: center;
        transition: color .1s,background-color .1s,border-color .1s;
        border-radius: 4px;
        cursor: pointer;
      }     
      
      
    
    </style>
    
</head>
<body style="margin-top: 90px;">

<main id="homepage-margin">

  <!-- 정렬 메뉴 -->
  <div class="album py-5 bg-light">
    <div class="container">      
      <div class="control-list">  

		<div id="sorting">
         <select class="input-box" name="sort">            
               <option value="1" selected>정렬</option>
               <option value="1">최신순</option>
               <option value="2">인기순</option>
           </select>    
           
           <select class="input-box" name="homeForm">          
               <option value selected>주거형태</option>
               <option>아파트</option>
               <option>빌라</option>
               <option>오피스텔</option>
               <option>단독주택</option>
           </select>          
         
           
           <select class="input-box" name="homeSize">          
               <option value selected>평수</option>
               <option>10평 미만</option>
               <option>10~15평</option>
               <option>16~20평</option>
               <option>21~25평</option>
               <option>26~30평</option>
               <option>31~35평</option>
               <option>36~40평</option>
               <option>41~50평</option>
               <option>51평 이상</option>
           </select> 
           
           <select class="input-box" name="money">          
               <option value selected>예산</option>
               <option>500만원 미만</option>
               <option>500~1000만원</option>
               <option>1000~1500만원</option>
               <option>1500~2000만원</option>
               <option>2000~3000만원</option>
               <option>3000~4000만원</option>
               <option>4000~5000만원</option>
               <option>5000만원 이상</option>
           </select>  
          <c:if test="${sessionScope.user != null}"> 
      		<button type="button" id="writeBtn" class="btn btn-outline-success float-right" onclick="location.href='<c:url value="/myhome/homeWrite" />'">글쓰기</button>
      	  </c:if>   
      </div>
	
	<!-- 글 목록 -->
	  <div id="total"></div>	      
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="divContent">
	      
	      
	      
      </div>   
      
    </div>
    </div>
  </div>

</main>

<script>
	$(function() { //start jquery
		
		//삭제 후 알람창 처리
		const msg = '${msg}';
		if(msg === 'delSuccess')
			alert('게시글이 삭제되었습니다.');
		
		
		let str = '';
		getList(1, true);
		
		//1. 리스트 처리
		function getList(page, reset) {
			if(reset === true)
				str = '';
			
			const sort = $('select[name=sort] option:selected').val();
			const homeForm = $('select[name=homeForm] option:selected').val();
			const homeSize = $('select[name=homeSize] option:selected').val();
			const money = $('select[name=money] option:selected').val();
			
			$.getJSON(
				'<c:url value="/myhome/getList?nowPage=' + page + '&homeForm=' + homeForm + '&homeSize=' + homeSize + '&money=' + money + '&sort=' + sort + '" />',
				function(data) { //글 목록, 게시글 총 수를 map으로 포장해서 전달함.
					console.log(JSON.stringify(data));	
					const list = data.list;
					const total = data.total;
					
					$('#total').html('전체 ' + total);
					
					for(let i=0;i<list.length;i++){
						str += '<div class="col-lg-4 col-sm-4 col-md-4">';
						str += '<div class="card" style="width: 20rem">';
						str += '<a href="${pageContext.request.contextPath}/myhome/homeDetail?bno=' + list[i].bno + '" style="text-decoration: none;">';
						if(list[i].thumbImg != null)
							str += '<img class="img" src="${pageContext.request.contextPath}/myhome/display?userNum=' + list[i].userNum +'&fileName=' + list[i].thumbImg +'" alt="사진">';
						else
							str += '<img class="img" src="${pageContext.request.contextPath}/resources/img/interior10.png" alt="사진">';							
						str += '<div class="card-body">';
						str += '<p class="card-text">' + list[i].title + '</p>'
						if(list[i].profile != null)
							str += '<a href="#" style="text-decoration: none;" class="id-link"><img class="profile" src="${pageContext.request.contextPath}/quiz/display?fileLoca=' + list[i].profile + '"alt="사진"><small class="text-muted">' + list[i].writer + '</small></a>';
						else
							str += '<a href="#" style="text-decoration: none;" class="id-link"><img class="profile" src="${pageContext.request.contextPath}/resources/img/icon.png" alt="사진"><small class="text-muted">' + list[i].writer + '</small></a>';								
						str += '<small class="text-muted">스크랩 ' + list[i].scrapCnt + ' · 조회 ' + list[i].viewCnt + '</small>';
						str += '</div>';
						str += '</a>';
						str += '</div>';
						str += '</div>';
					}
						$('#divContent').html(str);
				}
			
			) //end getJSON
		}; //리스트 처리 끝
		
		
		//2. 페이징 처리
		let page = 1;
		$(window).scroll(function() {
			console.log($(window).scrollTop());
			console.log($(document).height());
			console.log($(window).height());
			if($(window).scrollTop() >= ($(document).height() - $(window).height())*0.8){
				console.log(++page);
				getList(++page, false);
				
			}			
		}); //페이징 처리 끝
		
		//3. 정렬 처리
		$('#sorting').on('change', 'select',  function() {
			getList(1, true);			
		});		
		
		
		
	}); //end jquery

</script>

</body>
</html>
<%@include file = "../include/footer.jsp" %> 