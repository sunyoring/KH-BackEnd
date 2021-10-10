<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>parameter 값 받아서 출력하기</h2>
	<p>해당 페이지 요청시에 전달값은 내부적으로 param 영역에 저장되어있음<br>
		param: 해당페이지 요청시 전달된 파라미터값을 받아올때 사용한다.
		paramValues: 해당페이지 요청시 전달된 파라미터 값들을 배열로 받아올때 사용한다.
	</p>
	
	
	<%
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String[] no = request.getParameterValues("no");  //values로 받아온 것은 배열로 넘어온다.
		String option = request.getParameter("option");

	%>
	
	상품명:<%= name %><br>
	가격:<%= price %><br>
	제품번호:<%= no[0] %> 와 <%= no[1] %><br>
	옵션:<%= option %><br>
	
	<hr>
	
	상품명 : ${param.name}<br>
	가격 : ${param.price}<br>
	제품번호 : ${paramValues.no[0]} 와 ${paramValues.no[1]} <br>
	옵션 : ${(empty param.option) ? "옵션없음" : param.option}<br>
	
</body>
</html>