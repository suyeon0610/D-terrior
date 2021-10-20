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
    <title>Document</title>
     <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/cart.css" rel="stylesheet">
    
   
</head>

<body style="margin-top: 130px;">
    <!-- 전체 박스 시작 -->
<div class="frame">
	<!-- main 타이틀 시작 -->
	<div class="favor-head border-btm-black mgb20" style="text-align: center; font-weight: bold;font-family:'Cafe24SsurroundAir', sans-serif;">
		<h2>장바구니</h2>
	</div>
	<!-- main 타이틀 끝 -->
	<!-- 장바구니 리스트 시작 -->
	<c:set var="prodCount" value="0" />
	<c:set var="prodPriceAll" value="0" />
	<div class="cart-table">
		<div class="cart-table-title-row">
			<div class="cart-table-title-prodInfo"style="font-family:'Cafe24SsurroundAir', sans-serif;">상품정보</div>
			<div class="cart-table-title-favor"></div>
			<div class="cart-table-title-price"style="font-family:'Cafe24SsurroundAir', sans-serif;">상품 가격</div>
			<div class="cart-table-title-delete"></div>
		</div>
			<c:choose>
				<c:when test="${products != null }">				
					<c:forEach var="product" items="${products }">
						<div class="cart-table-content-row" id="">
							<div class="cart-table-content-prodInfo">
								<div class="cart-table-content-prodInfo-img">
									<a class="cart-table-content-prodInfo-a" href="">
										<img src='<c:url value="/store/display?fileLoca=${product.thumbnail }" />' />
									</a>
								</div>
								<div class="cart-table-content-prodInfo-text"style="font-family:'Cafe24SsurroundAir', sans-serif;">
									<p class="cart-table-content-prodInfo-p mgb10">가구이름</p>
									<strong class="cart-table-content-prodInfo-strong">${ product.name}</strong>
								</div>
							</div>
							<div class="cart-table-content-favor"style="margin-right: 100px;">
								
									<button type="button" class="fav-btn cart-table-content-favor-btn" >
										<i class="material-icons">favorite_border</i>
									</button>
									
							</div>
							<div class="cart-table-content-price"style="font-family:'Cafe24SsurroundAir', sans-serif;">
								<fmt:formatNumber value="${product.price}" type="number" />
							</div>
							<div class="cart-table-content-delete">
								<button type="button" id="cart-del-btn" class="cart-btn cart-table-content-delete-btn" pno="${product.pno }" style="background-color: #fff;" >
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
										<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</button>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="cart-table-content-row" id="">
						<h3>장바구니에 담긴 상품이 없습니다.</h3>
					</div>
				</c:otherwise>
			</c:choose>
	</div>
	<!-- 장바구니 리스트 끝 -->
	<!-- 합계 div 시작 -->
	<div class="cart-middle-box mgt20 mgb100">
		<div class="cart-middle-priceAll">
			<strong class="mgr5 f15-555">상품 <fmt:formatNumber value="" type="number" />70000원</strong>
			+
			<strong class="mgr5 mgl5 f15-555">배송비 2500원</strong>
			<button type="button" class="cart-middle-toolTip" id="cart-middle-toolTip" data-toggle="tooltip" data-placement="top" title="Hyukshop의 모든 상품은 무료 배송입니다.">
				<svg rold="img" aria-label="툴팁" width="17" height="17" viewBox="0 0 17 17" class="icon-tooltip"><g id="Symbols" fill="none" fill-rule="evenodd"><g id="Icon-Asset-SVG" transform="translate(-76 -6)"><g id="btn/alert01/default" transform="translate(72 2)"><g id="Group-7" transform="translate(4 4)"><circle id="Oval" cx="8.5" cy="8.5" r="8" fill="#FFF" stroke="#DDD"></circle><g id="icon/alert_shape" fill="#555" transform="translate(8 4.5)"><path id="icon/alert" d="M1 7v1.5H0V7h1zm0-7v6H0V0h1z"></path></g></g></g></g></g></svg>
			</button>
			<span class="cart-middle-totalPrice mgl20 pdl20 f15-bd-purple">합계</span>
			<span class="mgl10 f25-bd-purple"><fmt:formatNumber value="" type="number" />70000원</span>
		</div>
		<p class="mgt5 mgb0 cart-middle-content">
			장바구니에 담긴 상품은 최대 30일간 보관됩니다.(최대 200개까지 보관 가능)
		</p>
	</div>
	<!-- 합계 div 끝 -->
	<!-- 하단 div 시작 -->
	<div class="cart-under-box">
		<div class="cart-under-box-inner-left-box">
			<ul class="cart-under-box-inner-left-ul">
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">상품 수</span>
					<strong class="f18-333">1개</strong>
				</li>
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">상품 금액</span>
					<strong class="f18-333"><fmt:formatNumber value="" type="number" />70000원</strong>
				</li>
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">할인 금액</span>
					<strong class="f18-purple">0원</strong>
				</li>
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">총 배송비</span>
					<strong class="f18-333">2500원</strong>
				</li>
			</ul>
		</div>
		<div class="cart-undex-box-inner-right-box">
			<span class="cart-undex-box-inner-right-box-span mgr10 f15-aaa">총 결제 예상 금액</span>
			<strong class="mgl13 f30-bd-111"><fmt:formatNumber value="" type="number" />72500원</strong>
		</div>
	</div>
	<!-- 하단 div 끝 -->
	<!-- 버튼 박스 시작 -->
	<div class="cart-go-to-check-box">
		<button class="cart-go-to-check-btn mgt100 mgb100 f18-bd-fff">주문하기 </button>
	</div>
	<!-- 버튼 박스 끝 -->
</div>
<!-- 전체 박스 끝 -->
    
    
</body>

<script>

	$(function() {
		
		$('#cart-del-btn').click(function() {
			
			var pno = $(this).attr('pno');
			console.log(pno);
			
			const del = confirm('해당 상품을 장바구니에서 삭제하시겠습니까?');
			if(del) {
				$.ajax({
					type : "POST",
					url : "<c:url value='/store/cartDelete' />",
					headers : {
						"Content-Type" : "application/json"
					},
					dataType : "text",
					data : {"pno" : pno},
					success : function(result) {
						if(result === 'delSuccess'){
							console('통신 성공');
							alert('삭제되었습니다.');							
						}
					},
					error : function() {
						console.log('통신 실패');
					}
					
				});
			}
			
			
		}); // 장바구니 삭제
		
	});

</script>
</html>

<%@ include file="../include/footer.jsp"%>
