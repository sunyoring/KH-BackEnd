package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8"); // POST 방식은 인코딩 꼭 해야 함.
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd"); //form에서 넘겨주는 name으로 적는 것.
		
		String originPwd = (String)request.getParameter("originPwd");
		
		Member loginUser = new MemberService().loginMember(userId,userPwd);
		
		if(loginUser != null) {
			HttpSession session = request.getSession();//세션정보를 가져와 담아주고 세션에 유저의 정보를 담는다.
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("originPwd", originPwd);
			
			response.sendRedirect(request.getContextPath()); //세션에 정보담았으니 sendRedirect로 바로 간다.
		}else { // 로그인유저 null일 경우 에러페이지 
			request.setAttribute("msg", "로그인에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); //request에 정보가 있으니 RequestDispatcher 로 에러페이지로 보냄
			view.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
