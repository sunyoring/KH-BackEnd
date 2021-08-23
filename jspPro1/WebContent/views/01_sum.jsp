<%--directive page : 페이지 지시자 태그 (페이지에 대한 설정) errorPage="errorPage.jsp" --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- HTML 주석 : 개발자도구 탭에 노출이 됨 (클라이언트에게 전달 됨) -->
<%-- JSP 주석 : 개발자도구 탭에 노출 안 됨 (클라이언트에게 전달 안 됨) --%>

<%-- 필드를 선언하는 태그 엘리먼트 --%>
<%--	<%! private int age = 20; %>	--%>
<%--	<% 스크립틀릿 태그 : 내부에 자바 문법을 작성 %>		--%>

<% //일반적인 자바 코드를 작성 가능
	int total = 0;
	for(int i = 0; i <= 10; i++) {
		total += i;
	}

	String s = null;
	char c = s.charAt(0);
%>

<h4>1부터 10까지의 합은 <span style="color:red;" font-size:"16px";><%= total %></span>입니다.</h4>
<h4>1부터 10까지의 합은 <span style="color:red;" font-size:"16px";><% out.print(total); %></span>입니다.</h4>

</body>
</html>