package com.session.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionTestServlet
 */
@WebServlet("/sessionTest.do")
public class SessionTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); //현재 request의 대한 세션의 정보를 가져온다. 세션이 생성되어 있는 경우에는 생성된 것을 가져오고 생성되어있지 않으면 생성해서 return
		
		//세션의 유효기간 설정
		session.setMaxInactiveInterval(60); //1분 , 0이나 음수 값을 넣으면 무한으로 지정됨. -> 종료메소드 구현해줘야함
		session.setAttribute("testValue", session.getId());
		response.sendRedirect(request.getContextPath()); // request.디스팩쳐 : 정보를 가져가면서 url은  그대로  . 지금은 정보는 가져가지않고 화면만 전환해준다.
//		/ (루트) 일때는 공백으로 넘어온다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
