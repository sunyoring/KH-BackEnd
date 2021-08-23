package com.kh.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.model.vo.User;

/**
 * Servlet implementation class JqAjaxServlet4
 */
@WebServlet("/JqTest4.do")
public class JqAjaxServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxServlet4() {
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
		
		
		int input = Integer.parseInt(request.getParameter("input"));
		 /** JSON (JavaScript Object Notaion : 자바스크립트 객체 표기법)
		 * - JSON을 사용하여 모든 데이터형을 서버와 주고 받을 수 있다.
		 * 	 (숫자, 문자열, boolean, 배열, 객체, null)
		 * - '{'로 시작하여 '}'로 끝나고 그 속에 데이터를 표기하는데 'key:value' 쌍으로 구성된다.
		 * - key는 문자열로 표현하므로 반드시 쌍따옴표를 해야하고, value는 기본자료형이나 문자열, 배열, 객체가 들어간다.
		 * 	 (단, value로는 char형은 안됨)
		 *   순서는 의미 없고 단지 'key:value'로 올바르게 매핑만 되어있으면 된다.
		 **/
		User findUser = null;
		JSONObject jsonUser = null;
		
		for(int i = 0;i < list.size(); i++) {
			
			if(list.get(i).getNo() == input) {
				findUser = list.get(i);
				
				jsonUser = new JSONObject();  //자바 객체 형태로는 전송할수 없으므로 json형태로 만들어 전송하는 것이다.
				
				jsonUser.put("no",findUser.getNo());
				jsonUser.put("name",findUser.getName());
				jsonUser.put("age",findUser.getAge());
				jsonUser.put("gender",findUser.getGender()+""); //getGender가 char 형이므로 ""를 붙여 문자열로 만들어준 것임
				
			}
		}
		
		//브라우저로 json 객체를 전송
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

		System.out.println(jsonUser.toJSONString());
		
		out.print(jsonUser);
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
