<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link href="${pageContext.request.contextPath}/resources/css/shoppage.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
  
   <style>
  
    .st-write{
     position: relative; 
     left: 82%;
     }
     
     .cate {
   width: 180px;
   position: relative;
   border-style: solid;
   border-width: 1px 1px 0 1px;
   border-color: #f8f9fa;
   font-family:'Cafe24SsurroundAir';
}

.cate:last-child {
   border-bottom: 1px solid #f8f9fa;
}

.cate .menu {
   display: block;
   position: relative;
   width: 100%;
   background: light;
   height: 80px;
   
}

.cate .menu .menulink {
   display: block;
   color: #fff;
   text-decoration: none;
   width: 50%;
   padding-left: 15px;
   line-height: 80px;
   magin:0;
   color:black;
}

.cate .menu .subopen {
   position: absolute;
   width: 8px;
   height: 8px;
   right: 15px;
   padding: 0;
   top: 0;
   bottom: 0;
   margin: auto;
   border-right: 1px solid #fff;
   border-bottom: 1px solid #fff;
   transform: rotate(45deg);
}

.cate ul li {
   padding: 5px 10px;
}

.cate ul li:first-child {
   padding-top: 20px;
}

.cate ul li:last-child {
   padding-bottom: 20px;
}
.cate-pos{
top: 87px;
z-index:
}
.store-img{

height: 300px;
}
     
  </style>

</head>
<body id="homepage-margin" style="margin-top: 90px;">
    <div class="accordion fixed-top cate-pos" style="z-index:auto; margin-top: 110px;" >
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink active">가구</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=가구&category2=거실가구" />'>거실가구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가구&category2=침실가구" />'>침실가구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가구&category2=주방가구" />'>주방가구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가구&category2=유아동가구" />'>유아동가구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가구&category2=수납가구" />'>수납가구</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"><a href="javascript:void(0);"class="menulink ">패브릭</a></span>
         
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=패브릭&category2=침구" />'>침구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=패브릭&category2=커튼/블라인드" />'>커튼/블라인드</a></li>
            <li><a href='<c:url value="/store/storeList?category1=패브릭&category2=카페트/러그" />'>카페트/러그</a></li>
            <li><a href='<c:url value="/store/storeList?category1=패브릭&category2=쿠션/방석" />'>쿠션/방석</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink ">가전</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=가전&category2=대형가전" />'>대형가전</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가전&category2=주방가전" />'>주방가전</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가전&category2=생활가전" />'>생활가전</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가전&category2=청소가전" />'>청소가전</a></li>
            <li><a href='<c:url value="/store/storeList?category1=가전&category2=디지털가전" />'>디지털가전</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink">주방용품</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=주방용품&category2=그릇/홈세트" />'>그릇/홈세트</a></li>
            <li><a href='<c:url value="/store/storeList?category1=주방용품&category2=컵/잔/텀블러" />'>컴/잔/텀블러</a></li>
            <li><a href='<c:url value="/store/storeList?category1=주방용품&category2=냄비/프라이팬" />'>냄비/프라이팬</a></li>
            <li><a href='<c:url value="/store/storeList?category1=주방용품&category2=조리도구" />'>조리도구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=주방용품&category2=보관/용기" />'>보관/용기</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink">생활용품</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=생활용품&category2=욕실용품" />'>욕실용품</a></li>
            <li><a href='<c:url value="/store/storeList?category1=생활용품&category2=수건/타월" />'>수건/타월</a></li>
            <li><a href='<c:url value="/store/storeList?category1=생활용품&category2=청소용품" />'>청소용품</a></li>
            <li><a href='<c:url value="/store/storeList?category1=생활용품&category2=세탁용품" />'>세탁용품</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink">수납</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=수납&category2=수납장/서랍장" />'>수납장/서랍장</a></li>
            <li><a href='<c:url value="/store/storeList?category1=수납&category2=리빙박스" />'>리빙박스</a></li>
            <li><a href='<c:url value="/store/storeList?category1=수납&category2=바구니/바스켓" />'>바구니/바스켓</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink">캠핑용품</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=캠핑용품&category2=캠핑가구" />'>캠핑가구</a></li>
            <li><a href='<c:url value="/store/storeList?category1=캠핑용품&category2=캠핑생활용품" />'>캠핑생활용품</a></li>
            <li><a href='<c:url value="/store/storeList?category1=캠핑용품&category2=캠핑주방용품" />'>캠핑주방용품</a></li>
         </ul>
      </div>
      <div class="cate">
         <span class="menu"> <a href="javascript:void(0);"class="menulink">반려동물</a></span>
         <ul>
            <li><a href='<c:url value="/store/storeList?category1=반려동물&category2=강아지 리빙" />'>강아지 리빙</a></li>
            <li><a href='<c:url value="/store/storeList?category1=반려동물&category2=강아지 위생" />'>강아지 위생</a></li>
            <li><a href='<c:url value="/store/storeList?category1=반려동물&category2=강아지 미용" />'>강아지 미용</a></li>
            <li><a href='<c:url value="/store/storeList?category1=반려동물&category2=고양이 리빙" />'>고양이 리빙</a></li>
            <li><a href='<c:url value="/store/storeList?category1=반려동물&category2=고양이 위생" />'>고양이 위생</a></li>
            <li><a href='<c:url value="/store/storeList?category1=반려동물&category2=고양이 미용" />'>고양이 미용</a></li>
         </ul>
      </div>

   </div>

  <main class="mt-3" id="homepage-margin">
    <div class="container" style="max-width: 1400px; position: relative; left: 150px;">
  		  <h3 class="title">BEST12</h3>
      <c:if test="${user.grade == 'pro' }">
	      <button type="button" class="btn btn-info st-write" onclick="location.href='<c:url value="/store/productIn" />'">상품등록</button>
      </c:if>
      <div class="row">
        
        <c:choose>
           <c:when test="${products != null }">
              <c:forEach var='product' items="${products }">
                 <div class="col-xl-3 col-lg-4 col-md-6">
                   <div class="card" style="width: 18rem;">
                     <a href='<c:url value="/store/productDetail/${product.pno }" />'>
                     	<img src='<c:url value="/store/display?fileLoca=${product.thumbnail }" />' class="card-img-top store-img" alt="...">
                     </a>
                     <div class="card-body">
                       <h5 class="card-title">${product.name }</h5>
                       <p class="card-text">
                         <span class="badge bg-dark" style="color: white;">${product.category1 }</span>
                         <span class="badge bg-dark" style="color: white;">${product.category2 }</span>
                       </p>
                       <div class="d-flex justify-content-between align-items-center">
                         <div class="btn-group" role="group">
                           <button type="button" id="cart-btn" class="btn btn-sm btn-dark">장바구니 담기</button>
                           <button type="button" id="order-btn" class="btn btn-sm btn-info">주문하기</button>
                         </div>
                         <small class="text-dark">${product.price }</small>
                       </div>
                     </div>
                   </div>
                 </div>
              </c:forEach>
           </c:when>
           <c:otherwise>
             	<div> 상품이 존재하지 않습니다. </div>
           </c:otherwise>
        </c:choose>
    
      </div>
    </div>
    
    
</div>
</div>
  </main>
    
</body>


	<script>
		
		(function($) {
		      $('.cate ul').hide();
		      $('.cate .menu .menulink').click(
		            function() {
		               if ($(this).hasClass('active')) {
		                  $(this).parent().next().slideUp('slow');
		                  $(this).removeClass('active');
		               } else {
		                  $('.accordion').find('.active').parent().next()
		                        .slideUp('slow');
		                  $('.accordion').find('.active').removeClass('active');
		                  $(this).parent().next().slideDown('slow');
		                  $(this).addClass('active');
		               }

		            });
		   })(jQuery);
	
	</script>

</html>

<%@ include file="../include/footer.jsp"%>