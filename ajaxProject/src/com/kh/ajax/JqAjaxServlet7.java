package com.kh.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.model.vo.User;

/**
 * Servlet implementation class JqAjaxServlet7
 */
@WebServlet("/JqTest7.do")
public class JqAjaxServlet7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxServlet7() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<User> list = new ArrayList<>();

		list.add(new User(1, "유재석", 30, '남'));
		list.add(new User(2, "한지민", 20, '여'));
		list.add(new User(3, "배수지", 32, '여'));
		list.add(new User(4, "김봉남", 15, '여'));
		list.add(new User(5, "왕만두", 64, '남'));
		list.add(new User(6, "고창석", 32, '남'));

		
		
		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().print(jArr);
		
		
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
