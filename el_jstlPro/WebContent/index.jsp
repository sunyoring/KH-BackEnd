<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"> JSP Action Tag</h1>
	<h3><a href="views/jspActionTag/testAction.jsp">JSP Action Tag 테스트 </a></h3>
	
	
	<br>
	<h1 align="center">EL(Expression Language)</h1>
	<h3><a href="test1">request.getAttribute() 테스트</a></h3>
	<h3><a href="test2">request에 저장된 vo 객체 출력 테스트</a></h3>
	<h3><a href="views/el/testEL3.jsp?name=galaxy&price=95&no=5&no=6&option=삼성">parameter로 전달한 값을 el로 출력 테스트 </a></h3>
	<h3><a href="test4">requestScope와 sessionScope 테스트</a></h3>

	<br>
	
	<h1 align="center">JSTL</h1>
	<h3><a href="views/jstl/testJstlCore.jsp">Core Library 테스트 </a></h3>
	<h3><a href="views/jstl/testJstlFmt.jsp">Fmt Library 테스트 </a></h3>
	<h3><a href="views/jstl/testJstlFunction.jsp">Function Library 테스트 </a></h3>




	<h3><a href="views/member/myPage.jsp">myPage</a></h3>


</body>
</html>