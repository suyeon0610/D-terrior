<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file = "../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내집 뽐내기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Boast_view.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<style>   
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
   margin-right: 20px;
   }
</style>
</head>

<div class="main">     
        <img id="main" src="${pageContext.request.contextPath}/myhome/display?userNum=${home.userNum}&fileName=${home.thumbImg}" alt="메인사진">
  
    
    <div class="contain">    
        <div id="before-title">내집 뽐내기</div>
        <div id="title">${home.title}</div>
        <div class="title-profile">
        <a href="#" class="id-link">
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
    
            <div class="info col-md-12">
                <!--주거형태-->
                <span class="index1"><i class="fas fa-home fa-2x"></i></span> <span class="index2">${home.homeForm}</span>
                <!--작업분야-->
                &nbsp;&nbsp;&nbsp; <span class="index1"><i class="fas fa-paint-roller fa-2x"></i></span> <span
                    class="index2">${home.worker}</span>
                <!--공간 평수-->
                &nbsp;&nbsp;&nbsp; <span class="index1"><i class="fab fa-buromobelexperte fa-2x"></i></span> <span
                    class="index2">${home.homeSize}</span>
                <!--가족형태-->
                &nbsp;&nbsp;&nbsp; <span class="index1"><i class="fas fa-users fa-2x"></i></span> <span
                    class="index2">${home.family}</span>
                <hr>

                &nbsp;&nbsp;&nbsp; <span class="index3">견적</span> <span class="index2">${home.money}</span>
                &nbsp;&nbsp;&nbsp; <span class="index3">장소</span> <span class="index2">${home.place}</span>
            </div>
        </div>

        <div class="main col-md-12 col-sm-12 boast_write">
            
                <div contentEditable="false" class="col-md-10 boast_inwrite">
                   <p>${home.content}</p>
                   <c:forEach var="li" items="${home.homeImg}">
	                   <img src="${pageContext.request.contextPath}/myhome/display?userNum=${home.userNum}&fileName=${li}" class="inimg" alt="인테리어">                   
                   </c:forEach>
                   <i class="fas fa-exclamation fa-1x ico" ></i>
                </div>
                   <div class="Exp"> 
                    <div class="expimgs" style=" display: inline-block">
                        <img class="expimg" src="${pageContext.request.contextPath}/myhome/display?userNum=${home.userNum}&fileName=${li}" alt="링크사진">
                    </div>
                   <div class="exptxts" style=" display: inline-block; margin-top: 10px;"> 
                    <a href="#"><span class="exptxt">이의자는 말이죠</span>
                        <hr> <span class="exptxt">000,000원이에요</span></a>
                    </div>
                </div>
                   
                  </div>

        
        
        <!-- 좋아요, 스크랩 등 정보 공간  -->
        <div class="view">
          <p class="view-count"><span id="view-total"></span> <i class="fas fa-comment fa-2x icos" ></i> <span id="totalReply"></span> </p>
        </div>

         <!--댓글-->
    <div class="row">
        <div class="col-xs-12 col-md-12 write-wrap">
            <div class="reply-wrap">
            	<!-- 로그인한 사용자일 경우 -->
            	<c:if test="${sessionScope.user != null}">
	                <div class="reply-image" style="width: 50px; height: 50px;">  
	                	<c:if test="${sessionScope.user.profile == null}">              
	                    	<img class="userimg" src="${pageContext.request.contextPath}/resources/img/icon.png" alt="prof">
	                	</c:if>
	                	<c:if test="${sessionScope.user.profile != null}">              
	                    	<img class="userimg" src="${pageContext.request.contextPath}/quiz/display?fileLoca=${sessionScope.user.profile}" alt="prof">
	                	</c:if>
	                </div>
	                <div class="reply-content">
	                    <div class="reply-group clearfix">
	                       
	                        <textarea class="form-control" rows="3" placeholder="댓글을 작성해주세요" id="reply-content"></textarea>
	                        <button class="btn btn-outline-success" id="cancelBtn">취소</button>
	                        <button class="btn btn-outline-success" id="regBtn">등록</button>
	                     
	                    </div>
	                </div>
                </c:if>
                <!-- 로그인 안한 사용자일 경우 -->
                <c:if test="${sessionScope.user == null}">
                	<div class="reply-image" style="width: 50px; height: 50px;">                
	                    <img class="userimg" src="${pageContext.request.contextPath}/resources/img/icon.png" alt="prof">
	                </div>
	                <div class="reply-content">
	                    <div class="reply-group clearfix">	                       
	                        <textarea class="form-control" rows="3" placeholder="로그인 후에 작성 가능합니다." id="reply-content" readonly></textarea>	                       	                     
	                    </div>
	                </div>
                </c:if>
            </div>
			<div id="reply">
            
        	</div>
        </div>
        </div>

        

    </div>
    <nav class="pagination-sm pag">
        <ul class="pagination" id="replyBtn" style="position: relative; left: 42%;">
            <%-- 페이지 버튼 영역 --%>          
          
        </ul>
    </nav>
       
       </div>
     
</body>
<script>

	//아이콘 

      
	//좋아요, 스크랩, 댓글, 조회수 정보 비동기 불러오는 함수
	function getInfo() {
		console.log('글 인기정보 불러옴');
		const bno = ${home.bno};
		
		$.getJSON(
			'<c:url value="/myhome/liveDetail/' + bno +'" />',
			function(data) {
				let strInfo = '';
				strInfo += ' <div class="ico-div" id="detail-heart"><i class="fas fa-heart fa-2x icos"></i>' + data.likeCnt + '</div>';
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
	    	 url: "${pageContext.request.contextPath}/myhome/like",
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
	 
    
    
	//스크랩 기능	
	
	 $('#view-total').on('click', '#detail-scrap', function(){ 
		console.log('스크랩 클릭됨!');		
		
		const bno = ${home.bno};
		const writer = '${sessionScope.user.nickName}';	
		
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/myhome/scrap",
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

    
    
    //수정, 삭제, 목록버튼 처리
    $('#main-list').click(function() {
		location.href="${pageContext.request.contextPath}/myhome/homeList";
	});
    $('#main-del').click(function() {
    	if(confirm('정말 삭제하시겠습니까?'))
    		location.href="${pageContext.request.contextPath}/myhome/homeDelete?bno=" + ${home.bno};
	});
    $('#main-modify').click(function() {
		location.href="${pageContext.request.contextPath}/myhome/homeModify?bno=" + ${home.bno};
	});
    
		
	//수정 확인 처리
	const msg = '${msg}';
	if(msg === 'updateSuccess')
		alert('수정이 완료되었습니다.');
		
		
	//댓글 등록 처리
	$('#regBtn').click(function() {
		const content = $('#reply-content').val();
		const bno = '${home.bno}';
		const writer = '${sessionScope.user.nickName}';
		
		$.ajax({
			url: '<c:url value="/homeReply/regist" />', 
			type: "post",
			data: JSON.stringify({
				"bno": bno,	
				"writer" : writer,
				"content": content				
			}),
			dataType: "text",
			headers: {
				"Content-Type" : "application/json"
			},
			success: function(result) {
				console.log("통신 성공");
				if(result === 'success'){
					alert('댓글이 등록되었습니다.');
					$('#reply-content').val('');
					getList(1);					
				}
			},
			error: function() {
				console.log('통신 실패. 관리자에게 문의하세요.');
			}		
			
		}); //end ajax
		
	});
	
	let strAdd = '';
	let strBtn = '';
	getList(1);
	
	//댓글 목록 처리
	function getList(pageNum) {		
		$.getJSON(
			'<c:url value="/homeReply/getList/' + ${home.bno} + '/' + pageNum + '" />',
			function(datas) {
				const list = datas.list;
				const pc = datas.pc;
				const totalNum = datas.total;
				const nowUser = '${sessionScope.user.nickName}';
				strAdd = '';
				
				console.log('리스트: ' + list);
				console.log('pc: ' + pc);
				
				//댓글 총 갯수 표시
				$('#totalReply').html(totalNum);				
				
				
				//목록 처리
				for(let i=0;i<list.length;i++){
					console.log(list[i].profile)
					strAdd += '<div class="col-xs-12 col-md-12 reply-wrap" id="reply-' + list[i].rno +'" >';
					strAdd += '<div class="reply-image" style="width: 50px; height: 50px;">';
					if(list[i].profile === null){
						strAdd += '<img class="userimg" id="img-' + list[i].rno + '" src="${pageContext.request.contextPath}/resources/img/icon.png" alt="prof">';
					}
					else{
						strAdd += '<img class="userimg" pro="' + list[i].profile +'" id="img-' + list[i].rno + '" src="${pageContext.request.contextPath}/quiz/display?fileLoca=' + list[i].profile + '" alt="prof">';
					}
							
					strAdd += '</div>';
					strAdd += '<div class="reply-content">';
					strAdd += '<div class="reply-group">';
					strAdd += '<strong class="left">' + list[i].writer + '</strong>'; 
					strAdd += '<small class="left">' + timeStamp(list[i].regDate) + '</small>';
					strAdd += '<div class="btn-group-sm" role="group">';
					if(nowUser === list[i].writer) {
						strAdd += '<button type="button" class="btn btn-outline-success delBtn" reply-page="' + pageNum + '" id="' + list[i].rno + '">삭제</button>';
						strAdd += '<button type="button" class="btn btn-outline-success modBtn" reply-page="' + pageNum + '" reply-content="' + list[i].content + '" id="' + list[i].rno + '">수정</button>';
					}
					strAdd += '</div>';
					strAdd += '</div>';
					strAdd += '<p id="pageHint-' + list[i].rno +'" class="' + pageNum + '">' + list[i].content + '</p>';
					strAdd += '</div>';
					strAdd += '</div>';
					console.log($('.userimg').attr('src'));
				}
				$('#reply').html(strAdd);
				
				//페이지버튼 처리
				strBtn = '';
				if(pc.prev){
					strBtn += '<li class="page-item">';
					strBtn += '<button class="page-link" id="' + (pc.beginPage-1) + '" >';
					strBtn += '이전';
					strBtn += '</button>';
					strBtn += '</li>';
				}
				for(let j=pc.beginPage;j<=pc.endPage;j++){
					strBtn += '<li class="page-item">';
					strBtn += '<button class="page-link" id="' + j + '" >';
					strBtn += j;
					strBtn += '</button>';
					strBtn += '</li>';
				}
				if(pc.next){
					strBtn += '<li class="page-item">';
					strBtn += '<button class="page-link" id="' + (pc.endPage+1) + '" >';
					strBtn += '다음';
					strBtn += '</button>';
					strBtn += '</li>';
				}
				$('#replyBtn').html(strBtn);
				
			}
			
		); //end getJSON
		
		//글 인기정보 표시
		getInfo();
	}
		
	//댓글 페이지버튼 클릭 이벤트
	$('#replyBtn').on('click', 'button', function() {
		getList($(this).attr('id'));
	});
	
	//댓글 삭제 처리
	$('#reply').on('click', '.delBtn', function() {
		const rno = $(this).attr('id');		 
		const delPage = $('#pageHint-' + rno).attr('class');
		
		console.log('rno: ' + rno);
		console.log('page: ' + delPage);
		
		if(confirm('삭제하시겠습니까?')){			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/homeReply/delete",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: rno,
				success: function(result) {
					if(result === 'delSuccess'){
						console.log('댓글 삭제 완료!');
						getList(delPage);
					}					
				},
				error: function() {
					console.log('통신 실패!');
				}
			}); //end ajax	
		}
	
	});	
	
	//댓글 수정 처리
	$('#reply').on('click', '.modBtn', function() {	
		const rno = $(this).attr('id');
		const modPage = $('#pageHint-' + rno).attr('class');	
		
		console.log('rno: ' + rno);
		console.log('page: ' + modPage);
		let strMod = '';
		strMod += '<div class="reply-wrap" id="' + rno +'">';
		strMod += '<div class="reply-image">';               
		strMod += '<img class="userimg" src="${pageContext.request.contextPath}/quiz/display?fileLoca=' + $('#img-' + rno).attr('pro') +'" alt="prof">';
		strMod += '</div>';
		strMod += '<div class="reply-content">';
		strMod += '<div class="reply-group clearfix">';
		strMod += '<textarea class="form-control" rows="3" placeholder="댓글을 작성해주세요" id="reply-content-' + rno +'">' + $(this).attr('reply-content') + '</textarea>';
		strMod += '<button class="btn btn-outline-success" id="mod-cancelBtn">취소</button>';
		strMod += '<button class="btn btn-outline-success" id="mod-regBtn">등록</button>';	
		strMod += '<path fill="#292929" fill-rule="nonzero"';
		strMod += 'd="M3.22 20C1.446 20 0 18.547 0 16.765V6.176c0-1.782 1.446-3.235 3.22-3.235h3.118L7.363.377A.586.586 0 0 1 7.903 0h8.195c.24.003.453.152.54.377l1.024 2.564h3.118c1.774 0 3.22 1.453 3.22 3.235v10.589C24 18.547 22.554 20 20.78 20H3.22zm0-1.176h17.56a2.037 2.037 0 0 0 2.05-2.06V6.177c0-1.15-.904-2.058-2.05-2.058h-3.512a.585.585 0 0 1-.54-.368l-1.024-2.574H8.296L7.27 3.75a.585.585 0 0 1-.54.368H3.22a2.037 2.037 0 0 0-2.05 2.058v10.589c0 1.15.904 2.059 2.05 2.059zM12 17.059c-3.064 0-5.561-2.51-5.561-5.588 0-3.08 2.497-5.589 5.561-5.589s5.561 2.51 5.561 5.589c0 3.079-2.497 5.588-5.561 5.588zm0-1.177a4.392 4.392 0 0 0 4.39-4.411A4.392 4.392 0 0 0 12 7.059a4.392 4.392 0 0 0-4.39 4.412A4.392 4.392 0 0 0 12 15.882z">';
		strMod += '</path>';
		strMod += '</svg></button>';
		strMod += '</div>';
		strMod += '</div>';
		strMod += '</div>';
		
		$('#reply-' + rno).replaceWith(strMod);		
		
		//수정 시
		$('#mod-regBtn').click(function() {
			const modContent = $('#reply-content-' + rno).val();
			console.log(modContent);
			
			$.ajax({
				type: "post",
				url: "<c:url value='/homeReply/update' />",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: JSON.stringify({
					"rno" : rno,
					"content" : modContent
				}),
				success: function(result) {
					if(result === 'modSuccess'){
						console.log('댓글 수정 완료!');
						getList(modPage);
					}
				},
				error: function() {
					console.log('통신 실패!');
				}				
			}); //end ajax
		});
		
		//취소 시
		$('#mod-cancelBtn').click(function() {
			getList(modPage);
		});
	});
	
	
	
	//댓글 등록시간 처리
	function timeStamp(mil) {
		const date = new Date();
		const gap = date.getTime() - mil;
		
		let time;
		
		if(gap < 3600 * 1000)
			time = '방금 전';
		else if(gap < 3600 * 24 * 1000)
			time = parseInt(gap / (3600 * 1000)) + "시간 전";
		else{
			const regTime = new Date(mil);
			const year = regTime.getFullYear();
			const month = regTime.getMonth() + 1;
			const day = regTime.getDate();
			const hour = regTime.getHours();
			const minute = regTime.getMinutes();
			
			time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 ' + minute + '분';
		}
		
		return time;		
	}
	
	
		
		
		
		
	}); //end jquery
</script>	
</html>
<%@include file = "../include/footer.jsp" %> 