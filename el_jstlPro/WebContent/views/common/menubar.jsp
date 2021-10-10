<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<style>
    div{box-sizing: border-box;}
    #header{
        width:80%;
        height:100px;
        padding-top: 20px;
        margin:auto;
    }
    #header>div{width:100%; margin-bottom:10px}
    #header_1{height:40%;}
    #header_2{height:60%;}

    #header_1>div{
        height:100%;
        float:left;
    }
    #header_1_left{width:30%;position:relative;}
    #header_1_center{width:20%;}
    #header_1_right{width:40%;}

    #header_1_left>img{height:80%;position:absolute;margin:auto;top:0;bottom:0;right: 0;left:0;}
    #header_1_right{text-align: center; line-height:35px; font-size: 12px; text-indent: 35px;}
    #header_1_right>a{margin: 5px;}
    #header_1_right>a:hover{cursor: pointer;}
    
    #header_2>ul{width:100%; height:100%; list-style-type: none; margin: auto; padding:0;}
    #header_2>ul>li{float:left; width:25%; height:100%; line-height: 55px; text-align:center;}
    #header_2>ul>li a{text-decoration: none; color:black; font-size: 18px; font-weight: 900;}

    #header_2{border-top:1px solid lightgray}

    #header a{text-decoration:none; color:black}
    
    /* 세부 페이지마다 공통적으로 유지할 style */
    .content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background:white;
    }

</style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	<div id="header">
        <div id="header_1">
            <div id="header_1_left">
                <img src="https://www.iei.or.kr/resources/images/common/top_logo_s.jpg" alt="" onclick="location.href='${ pageContext.servletContext.contextPath }';">
            </div>
            <div id="header_1_center"></div>
            <div id="header_1_right">
            
            	<!-- 기존과 동일 하게 작업!! 이제는 바로 로그인유저가 있는 경우 없는 경우 동시에 작업하자!! -->
                <!-- 로그인 전 -->
                <c:if test="${ empty sessionScope.loginUser }">
	                <a href="enrollForm.me">회원가입</a> | 
	                <a data-toggle="modal" data-target="#loginModal">로그인</a> <!-- 모달의 원리 : 이 버튼 클릭시 data-target에 제시되어있는 해당 아이디의 div가 보이는 거임 -->
	                
	                <!-- Modal -->
	                <div class="modal" id="loginModal">
	                	<div class="modal-dialog">
	                		<div class="modal-content">
	                			<div class="modal-header">
	                				<h4 class="modal-title">로그인</h4> <!-- 팝업창 헤더 -->
	                			</div>
	                			<form id="loginForm" method="POST"> <!-- 팝업창 바디에 들어갈 로그인 폼 -->
	                				<div class="modal-body">
	                					<table>
	                						<tr>
	                							<td style="width : 100px">아이디</td>
	                							<td><input type="text"></td> <!-- 아이디 입력창 -->
	                						</tr>
	                						<tr>
	                							<td style="width : 100px">비밀번호</td>
	                							<td><input type="password"></td> <!-- 비밀번호 입력창 -->
	                						</tr>
	                					</table>
	                				</div>
	                				<div class="modal-footer">
		                				<button type="submit" class="btn btn-primary" onclick="loginPopUp();">로그인</button> <!-- 로그인 submit 버튼 -->
	                					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button> <!-- 취소 버튼 누르면 그냥 닫기처리 -->                				
	                				</div>
	                			</form>
	                			<script>
	                				//일단 임시로 submit 버튼 클릭시 alert창이 나타나도록 처리하였음
	                				function loginPopUp(){
	                					alert(" 로그인 되었다고 보여주는 팝업 메시지~!");
	                				}
	                			</script>
	                			
	                		</div>
	                	</div>	                
	                </div>
                </c:if>
                
                <!-- 로그인 후  -->
                <c:if test="${!empty sessionScope.loginUser }">
	                <label>${sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
	                <a href="myPage.me">마이페이지</a>
	                <a href="logout.me">로그아웃</a>
                </c:if>  
                
            </div>
        </div>
        <div id="header_2">
            <ul>
                <li><a href="${ pageContext.servletContext.contextPath }">HOME</a></li>
                <li><a href="">공지사항</a></li>
                <li><a href="list.bo">자유게시판</a></li>
            </ul>
        </div>
    </div>

 

    <br clear="both">

</body>
</html>