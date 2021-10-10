<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>* JSTL 선언방법</h3>
	<p>JSTL 을 사용 하는 JSP 상단에 page 지시자 아래에 taglib 지시 자를 사용 하여 선언 prefix:
		접두사 . 다른 태그와 구분 할수 있는 name space 를 제공함 uri : 실제 웹상의 주소가 아닌, 태그 라이브러리를
		나타내는 식별자, 이 지시자를 통해 작성한 태그 이름과 매칭되는 자바코드를 찾음 tld : 커스텀 태그 정보를 갖고 있는
		라이브러리 파일</p>

	<h1 align="center">JSTL Core Library Tag Test</h1>
	<h3>1. 변수</h3>
	<pre>
		* 변수 선언 (c:set)
		- 변수를 선언하고 초기값을 대입하는 기능을 가진 태그 
		- 변수선언시 scope 를 지정할수 있음 , 기본scope 는 pagescope
		- 사용 방법
		  1) 변수 타입은 별도로 선언하지 않는다. 
		  2) 초기값은 반드시 지정해야한다. 
		  3) c:set 태그로 선언한 변수는  EL 안에서 사용 가능 
		          하지만 스크립틀릿 요소 내에서는 사용할 수 없음  
	</pre>

	<h2>c:set 태그 : 변수선언</h2>

	<c:set var="num1" value="100" scope="session" />
	<c:set var="num2" value="200" scope="session" />
	<c:set var="sum" value="${num1+num2}" />

	num1+num2 = ${sum}
	<br>

	<%
		int num3 = 10, num4 = 20;
	%>
	<c:set var="sum2" value="<%=num3 + num4%>" />

	num3+num4 = ${sum2}
	<br>


	<h2>c:set 태그 : 배열로 사용할 문자열 선언</h2>

	<c:set var="colors">
	red, yellow, green, orange, blue, black
	</c:set>

	color 값 확인 : ${colors}

	<script>
		window.onload = function() {
			var colors = '${colors}'.split(',');
			console.log(colors);
		}
	</script>



	<h2>c:remove 태그 : 변수삭제</h2>
	<pre>
	* 변수 삭제 (c:remove)
	지정한 변수를 모든 scope 에서 검색해 삭제함. 
	또는 지정한 scope 만 삭제도 가능 
	</pre>

	num1 변수값 :${num1}
	<br> num2 변수값 :${num2}
	<br>
	<br> 1)특정scope 에서 삭제

	<br>
	<c:remove var="num2" scope="session" />
	삭제후 \${num1} : ${num1}
	<br> 삭제후 \${num2} : ${num2}
	<br>
	<br> 2)모든scope에서 삭제
	<c:remove var="num1" />
	<br> 삭제후 \${num1} : ${num1}
	<br> 삭제후 \${num2} : ${num2}
	<br>

	<h2>c:out 태그 : 값 출력용</h2>

	<pre>
	* 변수 출력(c:out)
	데이터를 출력할때 사용 하는 태그 
	&lt;, &gt;, & 특수 문자를 자동으로 이스케이프 시퀀스로 변환가능 
	
	</pre>

	<c:out value="core 라이브러리의 <out> 태그는 값을 화면에 출력하는 태그이다." />
	<br>
	<c:out value="<h2>데이터출력</h2>" escapeXml="false" />
	<br>
	<!-- escapeXml이 false이면 태그를 인식 -->
	<c:out value="<h2>데이터출력</h2>" escapeXml="true" />
	<br>

	<c:out value="${param.name }" default="유재석" />
	<br>
	<!-- param.name이 없으므로 default 값 출력 -->


	<h2>c:if 태그 : 조건문</h2>
	<pre>
	- java 의 if 문과 비슷한 역할을 하는 태그 
	- 위의 태그 사용시 조건식은 test 라는 속성의 값으로 지정해야함  조건식은 반드시 EL 형식으로 기술!! 
	</pre>

	<c:set var="value1" value="9" scope="page" />
	<c:set var="value2" value="30" scope="page" />

	value1의 값은
	<c:out value="${value1}" />
	이고,
	<br> value2의 값은
	<c:out value="${value2}" />
	이다.

	<c:if test="${value1 + 0 >= value2+0 }">
		<h3>
			value1이 큽니다. :
			<c:out value="${value1}" />
		</h3>

	</c:if>
	<c:if test="${value1 + 0 < value2+0 }">
		<h3>
			value2이 큽니다. :
			<c:out value="${value2}" />
		</h3>

	</c:if>


	<h2>c:choose : switch 문 , c:when : case문 , c:otherwise: default문</h2>
	<pre>
		- Java 의 if-else if 문 또는 switch문과 비슷한 역활을 하는 태그<br>
		- 각 조건들은 c:choose 문의 하위요소로 c:when를 통해서 작성 (default 값으로는 c:otherwise)
	</pre>
	<c:set var="no" value="${param.no}" />

	param.no값은
	<c:out value="${param.no }" />
	입니다.

	<c:choose>
		<c:when test="${no==1 }">
			<h3>안녕하세요</h3>
		</c:when>
		<c:when test="${no==2 }">
			<h3>반갑습니다</h3>
		</c:when>
		<c:otherwise>
			<h3>환영합니다</h3>
		</c:otherwise>
	</c:choose>



	<h2>c:forEach태그 : for문</h2>
	<h3>반복문 (c:forEach var="" begin="" end="" step="" items=""
		varStatus="")</h3>
	<pre>
		-JAVA의 for 문에 해당하는 기능을 제공
		-forEach 문은 여러가지 속성이 사용 
		
		var : 현재 반복횟수에 해당하는 변수의 이름
		begin : 반복이 시작할 요소번호 (0....n)
		end : 반복이 끝나는 요소번호
		step : 반복시 증가할 수 
		items : 반복할 객체명 (collection 객체)
		varStatus : 현재 반복에 해당하는 객체의 요소정보 
		
	</pre>

	<c:forEach begin="1" end="10">
		반복실행<br>

	</c:forEach>

	<c:forEach var="size" begin="1" end="7" step="1">
		<font size="${size}">글자크기${size}</font>

	</c:forEach>

	<h2>c:forEach태그 : 배열 또는 컬렉션 연속 처리에 for~ each 문 처럼 사용 가능 하다.</h2>

	<c:forEach var="color" items="${colors}" varStatus="st">
		<!--varStatus : 상태값  -->
		<font color="${color}">${st.index} : 글자색${color}<br></font>
	</c:forEach>



	<h2>c:forTokens태그 : 문자열을 토큰으로 분리 처리할때 사용</h2>
	<pre>
		- 문자열에 포함된 구분자를 통해 토큰을 분리해서 반복처리
		- java 의 String.split() 또는 StringTokenizer와 비슷한기능
		- items 속성에는 토큰을 포함하는 문자열을 지정하고 , 
		- delims 속성에는 토큰을 분리하는데 사용할 구획문자를 기술.
	</pre>

	<ul>
		<c:forTokens items="yellow blue pink red green" delims=" " var="color">
			<li>${color}</li>
		</c:forTokens>
	</ul>


	<h3>여러개의 토큰 문자를 가지고 분리 할수도 있다</h3>

	<c:forTokens items="yellow-blue*pink/red green" delims="*/ - " var="color">
		${color}<br>
	</c:forTokens>

	<h2>c:url 태그 : 링크 설정정보 별도 지정시 사용하는태그</h2>
	<c:url var="fmklink" value="testJstlCoreResult.jsp">	
		<c:param name = "num" value ="77"></c:param>
	</c:url>
	
	<a href="${fmklink}">결과화면</a>
</body>
</html>