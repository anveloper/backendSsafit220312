package com.ssafy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test06")
public class Test06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// String에 넣기 전에 utf-8형식이라고 수정한다.
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		// 사용자에게 전달할 형식과 문자set을 더한다.
		res.setContentType("text/html; charset=UTF-8");

		PrintWriter out = res.getWriter();
		out.println("<h1>" + name + "님 안녕하세요.</h1>");
		out.close();

	}

}
