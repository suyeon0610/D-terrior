<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=, initial-scale=1.0">
<title>스토어</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/home-icon.png">

<link
	href="${pageContext.request.contextPath}/resources/css/shopinpage.css"
	rel="stylesheet">

<style>
.store-img {
	width: 800px;
	height: auto;
	display: block;
}

.exs {
	left: 33%;
	margin-top: 100px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 50%;
	margin-left: -240px;
	background: #fff;
	overflow-x: hidden;
	overflow-y: auto;
}

span {
	color: black;
}

.cate {
	width: 180px;
	position: relative;
	border-style: solid;
	border-width: 1px 1px 0 1px;
	border-color: #f8f9fa;
	font-family: 'Cafe24SsurroundAir';
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
	magin: 0;
	color: black;
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

.cate-pos {
	top: 87px;
	z-index:
}

.boast_inwrite {
	width: 47%;
	height: auto;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
</style>

</head>

<body style="margin-top: 130px;">

	<div class="accordion fixed-top cate-pos"
		style="z-index: auto; margin-top: 110px;">
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink active">가구</a></span>
			<ul>
				<li>거실가구</li>
				<li>침실가구</li>
				<li>주방가구</li>
				<li>유아동가구</li>
				<li>수납가구</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink ">페브릭</a></span>

			<ul>
				<li>침구</li>
				<li>커튼/블라인드</li>
				<li>카페트/러그</li>
				<li>쿠션/방석</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink ">가전</a></span>
			<ul>
				<li>대형가전</li>
				<li>주방가전</li>
				<li>생활가전</li>
				<li>청소가전</li>
				<li>디지털가전</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink">주방용품</a></span>
			<ul>
				<li>그릇/홈세트</li>
				<li>컴/잔/텀블러</li>
				<li>냄비/프라이팬</li>
				<li>조리도구</li>
				<li>보관/용기</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink">생활용품</a></span>
			<ul>
				<li>욕실용품</li>
				<li>수건/타월</li>
				<li>청소용품</li>
				<li>세탁용품</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink">수납</a></span>
			<ul>
				<li>수납장/서랍장</li>
				<li>리빙박스</li>
				<li>바구니/바스켓</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink">캠핑용품</a></span>
			<ul>
				<li>캠핑가구</li>
				<li>캠핑생활용품</li>
				<li>캠핑주방용품</li>
			</ul>
		</div>
		<div class="cate">
			<span class="menu"> <a href="javascript:void(0);"
				class="menulink">반려동물</a></span>
			<ul>
				<li>강아지 리빙</li>
				<li>강아지 위생</li>
				<li>강아지 미용</li>
				<li>고양이 리빙</li>
				<li>고양이 위생</li>
				<li>고양이 미용</li>
			</ul>
		</div>

	</div>



	<main class="mt-3">
		<div class="container">
			<div class="row" style="position: relative; left: 20%">
				<div class="col-md-4">
					<div id="carouselExampleIndicators"
						class="carousel carousel-dark slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img
									src='<c:url value="/store/display?fileLoca=${product.thumbnail }" />'
									class="d-block w-100" alt="...">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="card" style="width: 18rem;">

						<div class="card-body">
							<h5 class="card-title">${product.name }</h5>
							<h5 class="card-title pt-3 pb-3 border-top">${product.price }</h5>
							<p class="card-text pt-3 border-top">
								<span class="badge bg-dark">${priduct.category1 }</span> <span
									class="badge bg-dark">${priduct.category2 }</span>
							</p>
							<p class="card-text pb-3">
								배송비 ${product.deliPrice }원 | 도서산관(제주도) 배송비 추가 ${product.deliPlus }원
								| 택배 배송 |<br> ${product.releaseDate }일 이내 출고(주말,공휴일 제외)
							</p>
							<p class="card-text  pb-3 border-top">
							<div class="row">
								<div class="col-auto">
									<label class="col-form-label">구매수량</label>
								</div>
								<div class="col-auto"></div>
								<div class="input-group ">
									<span class="input-group-text">-</span> <input type="text"
										class="form-control" style="width: 40px;" value="1"> <span
										class="input-group-text">+</span>
								</div>
							</div>
							</p>
							<div class="row pt-3 pb-3 border-top">
								<div class="col-auto">
									<h3>총 상품 금액</h3>
								</div>
							</div>
							<div class="col-auto" style="text-align: right;">
								<h3>${product.price }</h3>
							</div>
						</div>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group" role="group">
								<button type="button" id="cart-btn" class="btn btn-sm btn-outline-success">장바구니 담기</button>
								<button type="button" class="btn btn-sm btn-outline-success" onclick="location.href='<c:url value="/store/orderCount?pno=${product.pno }" />'">주문하기</button>
								<c:if test="${user.userNum == product.userNum }">
									<button type="button" id="btn-del" class="btn btn-sm btn-danger">삭제하기</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">

			<div class="col-12 border-top exs">
				<div contentEditable="false" id="content" class="boast_inwrite">${product.productExplan}</div>

				<c:forEach var="i" items="${imgs }">
					<img class="store-img"
						src='<c:url value="/store/display?fileLoca=${i}" />'>
				</c:forEach>
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

	// jquery start
	$(function() {

		$('#cart-btn').click(function() {
			console.log('장바구니 클릭!');
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/store/cartIn' />",
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : "text",
				data : JSON.stringify({
					"pno" : '${product.pno}',
					"userNum" : '${user.userNum}' 
					}) ,
				success : function(result) {
					console.log('통신 성공!');
					if(result === 'inSuccess') {
						const move = confirm('상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?');
						if(move) {
							location.href='<c:url value="/store/cart" />';
						}
					} else {
						alert('로그인 후 이용 가능합니다.')
					}
				},
				error : function() {
					console.log('통신 실패!');
				}
	
			}); // 비동기 끝
				
		});
		
		$('#btn-del').click(function() {
			const delResult = confirm('제품을 삭제하시겠습니까?');
			if(delResult) {
				location.href='<c:url value="/store/productDelete?pno=${product.pno}" />';
			}
		});

	});
</script>

</html>

<%@ include file="../include/footer.jsp"%>