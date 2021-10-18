<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
    .imgbox{
        float: left;
    }
    .imgch{
        width: 200px;
        height: 200px;
    }
    .boder{
        width: 700px;
        height: auto;

    }
    .txt-title{
        font-size: 30px;
        font-weight: bold;
        color: darkgreen;
    }
    .txtbox{
        float: left;
        margin: 30px 0 50px 50px; 
        width: 400px;
    }
    .boxbtn{
        position: relative;
        top: 80px;
        left: 60px;
    }
    body
{
  margin: 10% auto;
  width:40%;
}


</style>
<body>
    <div class="boder">
        <div class="imgbox">
            <img src="${pageContext.request.contextPath}/resources/img/ch.png" alt="체크완료" class="imgch">
        </div>
        <div class="txtbox">
            <div> 
                <span class="txt-title"> 주문이 확인 되었습니다.</span>
            </div>
            <div class="boxbtn">
                <button class="btn btn-success btn-sm active" onclick="history.back()">되돌아 가기</button>
                <button href="#" class="btn btn-success btn-sm active" onclick="location.href='${pageContext.request.contextPath}/store/storeList?category1=new'">쇼핑 계속</button>
            </div>
        </div>


    </div>
</body>
</html>