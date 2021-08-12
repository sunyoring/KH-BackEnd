package com.kh.servlet.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.servlet.model.vo.Member;

/**
 * Servlet implementation class MainViewServlet
 */
@WebServlet("/mainView.do")
public class MainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Member m = (Member)request.getSession().getAttribute("loginedMember");
		String html="<html>";		
		html+="<body>";
		html+="<h1>"+m.getMemberId()+"님, 로그인을 환영합니다.</h1>";
		html+="<button onclick='location.replace(\"deleteSession.do\");'>로그아웃</button>";

		html+="</body>";
		html+="</html>";
		response.setContentType("text/html;charset=UTF-8;");
		 
		PrintWriter out=response.getWriter();
		out.print(html);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
