<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file = "include/header.jsp" %>  
<link href="${pageContext.request.contextPath }/resources/css/home.css" rel="stylesheet"> 

<script>
   const msg = '${msg}';
   if(msg === 'logoutSuccess')
      alert('로그아웃 되었습니다.');
</script>


<body id="page-top">     
    <div id="demo" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <!-- 슬라이드 쇼 -->
            <div class="carousel-item active">
                <!--가로--> <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/img/cas2.jpg" alt="First slide">
            </div>
            <div class="carousel-item"> <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/img/cas1.jpg" alt="Second slide"> </div>
            <div class="carousel-item"> <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/img/cas3.jpg" alt="Third slide"> </div>
            <!-- / 슬라이드 쇼 끝 -->
            <!-- 왼쪽 오른쪽 화살표 버튼 --> <a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
                    class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> --> </a> <a
                class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"
                    aria-hidden="true"></span> <!-- <span>Next</span> --> </a> <!-- / 화살표 버튼 끝 -->
            <!-- 인디케이터 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <!--0번부터시작-->
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul> <!-- 인디케이터 끝 -->
        </div>



        <h3 class="best_title" style="margin-top: 40px;">완성형 인테리어 Best3</h3>
      

        <div class="hash-tag-lists text-center" style="margin: 50px;">
            <a href="javascript:;" data-typecd="lan" class="hash-tag__name">#인테리어 복사하기</a>
            <a href="javascript:;" data-typecd="export" class="hash-tag__name">#인테리어 완성품</a>
            <a href="javascript:;" data-typecd="movie" class="hash-tag__name">#인테리어 간편주문</a>
        </div>


    <!-- 완성형 인테리어 Best -->
  <div class="album py-5">
    <div class="container" style="padding-left: 50px;">      
      <div class="control-list">  
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="divContent">
	      
	      
      	</div>         
     </div>
    </div>
   </div>
  </div>
  

    <div class="button-area text-center button-more" style="margin-top: 20px; margin-bottom: 50px;">
        <input type="hidden" value="1" class="" name="">
        <button class="btn btn-default more" data-addmore="true" onclick="location.href='${pageContext.request.contextPath}/comp/compList'">더보기</button>
    </div>

    <h3 class="best_title">내집 뽐내기 BEST3</h3>

	 <div class="album py-5">
    <div class="container" style="padding-left: 50px;">      
      <div class="control-list">  
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="divContent2">
	      
	      
      	</div>         
     </div>
    </div>
   </div>
   

   <div class="button-area text-center button-more" style="margin-top: 20px; margin-bottom: 50px;">
        <input type="hidden" value="1" class="" name="">
        <button class="btn btn-default more2" data-addmore="true" onclick="location.href='${pageContext.request.contextPath}/myhome/homeList'">더보기</button>
    </div>



    <!-- 스토어 view-->

    <h4 class="card-title" style="text-align: center; font-weight: bold; margin-top: 60px;">스토어</h4>

    <div class="col-md-12 category">
        <ul id="store-btns">
            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="">
                <a href="best"  class="is-active"><i class="fas fa-heart fa-4x "
                        style="color: rgb(51, 49, 49);"></i><br>BEST</a>
            </li>
            <li class="col-md-1 category-item" data-filter4="" data-sort="rgstdtime">
                <a href="new"><i class="fas fa-clinic-medical fa-4x" style="color: rgb(51, 49, 49);"></i><br>NEW</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='가구'><i class="fas fa-couch fa-4x" style="color: rgb(51, 49, 49);"></i><br>가구</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='패브릭'><i class="fas fa-bed fa-4x" style="color: rgb(51, 49, 49);"></i><br>패브릭</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='가전'><i class="fas fa-tv fa-4x" style="color: rgb(51, 49, 49);"></i><br>가전</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='주방용품'><i class="fas fa-sink fa-4x" style="color: rgb(51, 49, 49);"></i><br>주방용품</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='생활용품'><i class="fas fa-laptop-house fa-4x" style="color: rgb(51, 49, 49);"></i><br>생활용품</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='수납'><i class="fas fa-box fa-4x" style="color: rgb(51, 49, 49);"></i><br>수납</a>
            </li>

            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='캠핑용품'><i class="fas fa-hiking fa-4x" style="color: rgb(51, 49, 49);"></i><br>캠핑용품</a>
            </li>
            <li class="col-md-1 category-item is-active" data-filter4="" data-sort="#">
                <a href='반려동물'><i class="fas fa-dog  fa-4x" style="color: rgb(51, 49, 49);"></i><br>반려동물</a>
            </li>


        </ul>
    </div>




    <div class="container">
        <div id="store-wrap" class="row">
			
			<!--  
            <div class="col-md-4">
                <div class="card3" style="width: 100%;">
                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/interior10.png" class="card-img-top" alt="..."></a>
                    <div class="card-body">
                        <h5 class="card-title">이쁜조명</h5>
                        <p class="card-text">
                            <span class="badge bg-dark sptext">가구제품</span>
                            <span class="badge bg-dark sptext">조명</span>
                            <span class="badge bg-dark sptext">인테리어</span>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-sm btn-dark">장바구니 담기</button>
                                <button type="button" class="btn btn-sm btn-info">주문하기</button>
                            </div>
                            <small class="text-dark">000,000원</small>
                        </div>
                    </div>
                </div>
            </div>
            -->

        </div>
    </div>
    <div class="button-area text-center button-more" style="margin-top: 50px; margin-bottom: 50px;">
        <input type="hidden" value="1" class="" name="">
        <button class="btn btn-default more2" data-addmore="true" >더보기</button>
    </div>

	<script>
		$(function() {
			
			getStoreList('best', 1);
			
			$('#store-btns').on('click', 'a', function(e) {
				e.preventDefault();
				getStoreList($(this).attr('href'), 1);
				console/log($(this).attr('href'));
				
			}); // 스토어 버튼 클릭
			
			let strAdd = "";
			// 스토어 목록 비동기
			function getStoreList(category, pageNum) {
				
				$.getJSON(
					"<c:url value='/store/list/" + category + "?pageNum=" + pageNum + "'/>",
					function(data) {
						
						strAdd = "";
						
						let list = data.list;
						let paging = data.paging;
						console.log(list);
						
						for(var i=0; i<list.length; i++) {
							strAdd += "<div class='col-md-4'>";
							strAdd += "<div class='card3' style='width: 100%;'>";
							strAdd += "<a href='#'><img src='${pageContext.request.contextPath }/resources/img/interior10.png' class='card-img-top' alt='...'></a>";
							strAdd += "<div class='card-body'>";
							strAdd += "<h5 class='card-title'>이쁜조명</h5>";
							strAdd += "<p class='card-text'>";
							strAdd += "<span class='badge bg-dark sptext'>가구제품</span>";
							strAdd += "<span class='badge bg-dark sptext'>조명</span>";
							strAdd += "<span class='badge bg-dark sptext'>인테리어</span>";
							strAdd += "</p>";
							strAdd += "<div class='d-flex justify-content-between align-items-center'>";
							strAdd += "<div class='btn-group' role='group'>";
							strAdd += "<button type='button' class='btn btn-sm btn-outline-success'>장바구니 담기</button>";
							strAdd += "<button type='button' class='btn btn-sm btn-outline-success'>주문하기</button>";
							strAdd += "</div>";
							strAdd += "<small class='text-dark'>000,000원</small>";
							strAdd += "</div></div></div></div>";
						}
						
						$('#store-wrap').html(strAdd);
					}
				);
				
			}
			
			
			//완성형 인테리어 Best
			getCompList(1)
			
			function getCompList(page) {
			let str = '';
			
			const sort = 2;
			const place = '';
			const homeSize = '';
			const money = 0;
			
			$.getJSON(
				'<c:url value="/comp/getList?nowPage=' + page + '&place=' + place + '&homeSize=' + homeSize + '&money2=' + money + '&sort=' + sort + '" />',
				function(data) { //글 목록, 게시글 총 수를 map으로 포장해서 전달함.
					console.log(JSON.stringify(data));	
					const list = data.list;					
					
					for(let i=0;i<3;i++){
						str += '<div class="col-lg-4 col-sm-4 col-md-4" style="width: 30%">';
						str += '<div class="card" style="width: 20rem">';
						str += '<a href="${pageContext.request.contextPath}/comp/compDetail?bno=' + list[i].bno + '" style="text-decoration: none;">';
						if(list[i].thumbImg != null)
							str += '<img class="img" src="${pageContext.request.contextPath}/comp/display?userNum=' + list[i].userNum +'&fileName=' + list[i].thumbImg +'" alt="사진">';
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
		
		//내집뽐내기 Best
		let str = '';
		getMyhomeList(1);		
		
		function getMyhomeList(page) {		
			
			const sort = 2;
			const homeForm = '';
			const homeSize = '';
			const money = '';
			
			$.getJSON(
				'<c:url value="/myhome/getList?nowPage=' + page + '&homeForm=' + homeForm + '&homeSize=' + homeSize + '&money=' + money + '&sort=' + sort + '" />',
				function(data) { //글 목록, 게시글 총 수를 map으로 포장해서 전달함.
					console.log(JSON.stringify(data));	
					const list = data.list;
					
					for(let i=0;i<3;i++){
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
						$('#divContent2').html(str);
				}
			
			) //end getJSON
		}; //리스트 처리 끝
			
			
			
			
			
			
			
			
			
			
			
		});
	</script>
</body>

<%@include file = "include/footer.jsp" %> 
