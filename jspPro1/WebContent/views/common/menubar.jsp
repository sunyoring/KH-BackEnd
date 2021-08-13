<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.member.model.vo.Member" %>

<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>
	body{
		background:url('<%=request.getContextPath() %>/resources/images/cat.jpg') repeat; 
		
	}
	
	/* 로그인 폼 관련 스타일*/
	
	#loginForm, #userInfo{float:right;}
	.btns button{border-radius:5px;}
	#enrollBtn, #mypageBtn{background-color:yellowgreen;}
	#loginBtn, #logoutBtn{background-color:orangered;}
	#userInfo a{text-decoration:none;color:white;}
	
	
	/* 메뉴영역 관련 스타일*/
	
	.navWrap{background-color:black; width:100%; height:50px}
	.navWrap>.nav{width:600px;margin:auto;}
	.menu{text-align:center;color:white;font-weight:bold;width:150px;height:50px;display:table-cell;font-size:20px;vertical-align:middle;}
	.menu:hover{background-color:darkgray;}
</style>

<script type="text/javascript">
	$(function(){
		var msg = "<%=msg%>";
		if(msg != "null") {
			alert(msg);
			<%session.removeAttribute("msg");%> //메세지를 띄우고 나면 msg 속성을 삭제한다.
		}
	})

	function loginValidate(){
		if($("#userId").val().trim().length==0){
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		if($("#userPwd").val().trim().length==0){
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus();
			return false;
		}
		return true;
	}

</script>
</head>
<body>
	<h1 align = "center" style="color:white;">Welcome JSP World!</h1>
	<div class= "loginArea">
		<% if(loginUser == null) {%>
		<form id = "loginForm" action="<%=request.getContextPath()%>/login.me" method="post" onsubmit="return loginValidate();">
			<table>
				<tr>
					<th><label for = "userId" style="color:white;">아이디</label></th>
					<td><input id="userId" type="text" name="userId"></td>
				</tr>
				<tr>
					<th><label for = "userPwd" style="color:white;">비밀번호</label></th>
					<td><input id="userPwd" type="text" name="userPwd"></td>
				</tr>
			</table>
			<div class ="btns" align="center">
				
				<button id = "loginBtn" type="submit">로그인</button>
			    <button id = "enrollBtn" type="button" onclick="enrollPage();">회원가입</button>
			</div>
		</form>
		<%}else{ %>
			<div id = "userInfo">
				<b style = "color:white;"><%=loginUser.getUserName() %> 님 </b> 의 방문을 환영합니다.
				<br><br>
				<div class ="btns" align="center">
					<a href = "<%=request.getContextPath() %>/mypage.me">마이페이지</a>
					<a href = "<%=request.getContextPath() %>/logout.me">로그아웃</a>
				</div>
			</div>
		<%} %>
	</div>
	
	<script>
	
	function enrollPage(){
		location.href = "<%=request.getContextPath() %>/enrollForm.me";
	}
	</script>
</body>
</html>