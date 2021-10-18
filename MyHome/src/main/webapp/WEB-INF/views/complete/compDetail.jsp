<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file = "../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완성형 인테리어</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/co-view.css">


<style>   
	  #ngside {
	    position: fixed;
	    right: 100px;
	    bottom: 0;
	    top: 500px;
	    padding: 0;
	    width: 300px;
	    height: 100%;
	    background-color: rgb(251, 251, 251 ,0.1);
	    cursor: default;
	}
	
	@media (max-width: 1817px) {
	    #ngside {
	        display: none;
	    }
	}
	
	a {
	    color: black;
	}
	
	.fill-heart {
	    display: none;
	}
	.fill-scrap{
	    display: none;
	}
	#ngside > ul >li{
	    list-style: none;
	    margin:0 0px 30px 40px;
	}
	.icos{
	    text-align: center;
	}
	.fa-bookmark{
	    margin: 5px;
	}
	.expimg{
	    position: relative;
	    width: 60px;
	    height: 100px;
	    bottom: 30px;
	}
	.btso {
	    position: relative;
	    bottom: 25px;
	}
	  .ico-div{
   display: inline-block;
   margin-right: 30px;
   }
   .info{
   position: relative;
   left: 15%;
   }
</style>
</head>

<div class="main">      
        <img id="main" src="${pageContext.request.contextPath}/comp/display?userNum=${home.userNum}&fileName=${home.thumbImg}" alt="메인사진">
    </div>
    
    <div class="contain">    
        <div id="before-title">완성형 인테리어</div>
        <div id="title">${home.title}</div>
        <div class="title-profile">
        <c:if test="${home.profile == null}"><img class="profile" src="${pageContext.request.contextPath}/resources/img/icon.png" alt="사진"></c:if>
        <c:if test="${home.profile != null}"><img class="profile" src="${pageContext.request.contextPath}/quiz/display?fileLoca=${home.profile}" alt="사진"></c:if>
            <small class="text-muted"> ${home.writer}</small> <small class="text-dete"><fmt:formatDate value="${home.regDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></small></a>
            <div class="btn-group-sm btso" role="group">
                  <button type="button" class="btn btn-default float-right" id="main-list">목록</button>
                  <c:if test="${home.writer == sessionScope.user.nickName}">
	                  <button type="button" class="btn btn-default float-right" id="main-del">삭제</button>
	                  <button type="button" class="btn btn-default float-right" id="main-modify">수정</button>
                  </c:if>
            </div>
        </div>
        <div class="main-info">
    
    
            <hr class="my-2">
    
            <div class="info col-md-8">
                <!--시공영역-->
                <span class="index1"><i class="fas fa-home fa-2x"></i></span> <span class="index2">${home.place}</span>
                <!--가격-->
                &nbsp;&nbsp;&nbsp; <span class="index1"><i class="fas fa-won-sign fa-2x"></i></span> <span
                    class="index2">${home.money}만원</span>
                <!--공간 평수-->
                &nbsp;&nbsp;&nbsp; <span class="index1"><i class="fab fa-buromobelexperte fa-2x"></i></span> <span
                    class="index2">${home.homeSize}</span>
                <!--방 갯수-->
                &nbsp;&nbsp;&nbsp; <span class="index1"><i class="fas fa-archive fa-2x"></i></span> <span
                    class="index2">방 ${home.room}</span>                
                
            </div>
        </div>

            <div class="main col-md-12 col-sm-12 boast_write">
            
                <div contentEditable="false" class="col-md-10 boast_inwrite">
                   <p>${home.content}</p>
                   <c:forEach var="li" items="${home.homeImg}">
	                   <img src="${pageContext.request.contextPath}/comp/display?userNum=${home.userNum}&fileName=${li}" class="inimg" alt="인테리어">                   
                   </c:forEach>
                   <i class="fas fa-exclamation fa-1x ico"></i>
                </div>
                   
                  </div>

        </div>

		<!-- 좋아요, 스크랩 등 정보 공간  -->
        <div class="view" style=>
          <p class="view-count"><span id="view-total" ></span>  </p>
        </div>
        
        <div class="mb-3 row text-center">
            <div class="col-12 d-grid p-1 ">
                <button type="button" class="btn btn-lg btn-outline-success" id="orderBtn" onclick="location.href='${pageContext.request.contextPath}/store/orderCount?pno=222'">주문하기</button>
            </div>
        </div>

   
</body>
<script>	
	//사이드 버튼 기능
	$(document).ready(function () {
      $('.inimg').hover(function () {
          $('.ico').toggle();
      });
 
  
      $('.ico').mousemove(function () {
          $('.Exp').toggle();
      });
      
     //로그인 체크
     /*
     if(${sessionScope.user} == null){
    	 $('#reply-content').attr('placeholder', '로그인 하셔야 작성 가능합니다.');
    	 
     }*/
     
   	//수정 확인 처리
 	const msg = '${msg}';
 	if(msg === 'updateSuccess')
 		alert('수정이 완료되었습니다.');
      
	//좋아요, 스크랩, 조회수 정보 비동기 불러오는 함수
	
     
	function getInfo() {
		console.log('글 인기정보 불러옴');
		const bno = ${home.bno};
		
		$.getJSON(
			'<c:url value="/comp/liveDetail/' + bno +'" />',
			function(data) {
				let strInfo = '';
				strInfo += ' <div class="ico-div" id="detail-heart" ><i class="fas fa-heart fa-2x icos"></i>' + data.likeCnt + '</div>';
	            strInfo += ' <div class= "ico-div" id="detail-scrap"> <i class="fas fa-bookmark fa-2x icos"></i>' + data.scrapCnt+ '</div>';
	            strInfo += '<div class= "ico-div"> <img class="ico-img" src="https://img.icons8.com/ios-glyphs/30/000000/visible--v1.png"/> ' + data.viewCnt;+ '</div>';         
	            $('#view-total').html(strInfo);
			}
		); //end getJSON
		
	};
      //좋아요 기능
	  $('#view-total').on('click', '#detail-heart', function(){ 
		 console.log('좋아요 버튼 클릭됨!');
		 $('#view-total').toggleClass('hint');
		 let lCount;
		 const bno = ${home.bno};
		 
		 if($('#view-total').hasClass('hint'))
			 lCount = 1;
		 else
			 lCount = -1;
	     
	     console.log('lCount: ' + lCount);
	     
	     $.ajax({ //좋아요 비동기 처리
	    	 type: "post",
	    	 url: "${pageContext.request.contextPath}/comp/like",
	    	 headers: {
		     		"Content-Type": "application/json"
	     	},
	     	dataType: "text",
	     	data: JSON.stringify({
	     		"likeCnt" : lCount,
	     		"bno" : bno
	     	}),
	     	success: function(result) {
				if(result === 'likeSuccess'){
					if(lCount === 1)
						alert('좋아요 클릭됨!');
					else
						alert('좋아요 취소 !');
					getInfo();
				}
			},
			error: function() {
				console.log('통신 실패!');
			}
	     }); //end ajax    
	    	 
	    	 
	   });       
	         
	  $('#view-total').on('click', '#detail-scrap', function(){ 
			console.log('스크랩 클릭됨!');		
			
			const bno = ${home.bno};
			const writer = '${sessionScope.user.nickName}';	
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/comp/scrap",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: JSON.stringify({
					"bno": bno,
					"writer" : writer,
				}),
				success: function(result) {
					console.log('스크랩 통신 성공!');
					if(result === 'addScrap')
						alert('스크랩되었습니다.');
					else if(result === 'removeScrap')
						alert('스크랩 취소되었습니다.');
					getInfo();
				},
				error: function() {
					console.log('통신 실패!');
				}
				
			}); //end ajax
			
			
		});	
      
      
	  getInfo();
    
    //수정, 삭제, 목록버튼 처리
    $('#main-list').click(function() {
		location.href="${pageContext.request.contextPath}/comp/compList";
	});
    $('#main-del').click(function() {
    	if(confirm('정말 삭제하시겠습니까?'))
    		location.href="${pageContext.request.contextPath}/comp/compDelete?bno=" + ${home.bno};
	});
    $('#main-modify').click(function() {
		location.href="${pageContext.request.contextPath}/comp/compModify?bno=" + ${home.bno};
	});
		
	
		
		
	}); //end jquery
</script>	
</html>
<%@include file = "../include/footer.jsp" %> 