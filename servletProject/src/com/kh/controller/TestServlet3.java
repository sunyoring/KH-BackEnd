package com.kh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet3
 */
@WebServlet("/test3.do")
public class TestServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //POST는 인코딩 꼭 해줘야함
		
		String name = request.getParameter("name"); //키 값으로 받아와야 한다.
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String city=request.getParameter("city");
		String height=request.getParameter("height");
		String[] foodArr=request.getParameterValues("food"); //배열로 받아야 함
		
		//서브릿을 수정할 때마다 서버를 재실행해야하므로 상당히 불편함. 이를 JSP를 이용해 간단하게 할 수 있음.
		
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("age", age);
		request.setAttribute("city", city);
		request.setAttribute("height", height);
		
		String foods = String.join(",", foodArr); //배열상태로 넘기는 것이 아니라 스트링 타입으로 넘김.
		request.setAttribute("food", foods);
		
		
		//JSP를 호출할 때 쓰는 객체 -> 디스패치
		
		RequestDispatcher view = request.getRequestDispatcher("views/testServlet3End.jsp");
		view.forward(request, response); //기존의 파라미터 정보를 유지하며 페이지를 변환만 시킨다. -> url은 변하지 않음

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
