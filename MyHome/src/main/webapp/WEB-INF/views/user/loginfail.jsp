<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 실패</title>
</head>
<body>
<script>
    alert('로그인에 실패하였습니다. 이메일 혹은 비밀번호가 맞는지 확인해주세요');
    history.go(-1);
</script>
</body>
</html>