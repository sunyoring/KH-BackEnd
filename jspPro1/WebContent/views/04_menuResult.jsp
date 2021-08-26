<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menu = (String)request.getAttribute("menu"); //object타입이므로 형변환
	int price = (int)request.getAttribute("price"); //object타입이므로 형변환
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>감사합니다</h2>
	<p>주문하신 <%= menu %> , 결제할 금액은 <%= price %>원 입니다!</p>
</body>
</html>