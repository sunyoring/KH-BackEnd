<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">testForward.jps 입니다.</h1>
	<h3 align="right"><%= request.getAttribute("name") %>님 환영합니다.</h3>
	<h3 align="right"><%= request.getParameter("name") %>님 환영합니다.</h3>
	<h3 align="right"> ${param.name} 님 환영합니다.</h3>
	
	<h2>jsp:useBean활용하기</h2>
	<%-- 기존의 방식 import="com.kh.el.model.vo.Member"
	<%
		Member m = new Member();
		m.setName("유재석");
		m.setAge(20);
		m.setPhone("010-1111-2222");
		m.setEmail("ye@nate.com");
	%>
	
	이름 : <%= m.getName() %><br>
	나이 : <%= m.getAge() %><br>
	전화번호 : <%= m.getPhone() %><br>
	이메일 : <%= m.getEmail() %><br>
	
	 --%>
	 
	 <%-- /> 종료시켜줘야함 --%>
	 <jsp:useBean id="m" class="com.kh.el.model.vo.Member" scope="page"/>
	 <jsp:setProperty property="name" name="m" value="유재석"/>
	 <jsp:setProperty property="age" name="m" value="20"/>
	 <jsp:setProperty property="phone" name="m" value="010-1111-2222"/>
	 <jsp:setProperty property="email" name="m" value="ye@nate.com"/>
	 
	 
	 이름 :  <jsp:getProperty property="name" name="m"/><br>
	나이 :  <jsp:getProperty property="age" name="m"/><br>
	전화번호 : <jsp:getProperty property="phone" name="m"/><br>
	이메일 :  <jsp:getProperty property="email" name="m"/><br>
</body>
</html>