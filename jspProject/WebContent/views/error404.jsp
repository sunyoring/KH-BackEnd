<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%> <%--에러 페이지임을 명시. --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>에러페이지</h1>
	<h3>에러종류 : <%=exception.getClass().getName() %></h3>
	<button onclick="history.back()">이전페이지로 이동 </button>	
	<!-- "history.back()" 바로 뒤 페이지로 이동 history.go()-1 과 같은 결과이다. -->
</body>
</html>