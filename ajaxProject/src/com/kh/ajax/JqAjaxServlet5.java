package com.kh.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.model.vo.User;

import jdk.nashorn.internal.scripts.JS;

/**
 * Servlet implementation class JqAjaxServlet5
 */
@WebServlet("/JqTest5.do")
public class JqAjaxServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxServlet5() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> list = new ArrayList<>();
		
		list.add(new User(1,"유재석",30,'남'));
		list.add(new User(2,"한지민",20,'여'));
		list.add(new User(3,"배수지",32,'여'));
		list.add(new User(4,"김봉남",15,'여'));
		list.add(new User(5,"왕만두",64,'남'));
		list.add(new User(6,"고창석",32,'남'));
		
		
		char gender = request.getParameter("gender").charAt(0);
		
		JSONArray jArr = new JSONArray();
		JSONObject jsonUser = null;
		
		for(User user : list) {
			if(user.getGender() == gender) {
				jsonUser = new JSONObject();
				
				jsonUser.put("no",user.getNo());
				jsonUser.put("name",user.getName());
				jsonUser.put("age",user.getAge());
				jsonUser.put("gender",user.getGender()+"");
				
				jArr.add(jsonUser);
			}
		}
		
		//브라우저로 json 객체를 전송
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jArr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
