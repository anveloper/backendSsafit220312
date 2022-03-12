package com.ssafy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test05")
public class Test05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println(req.getQueryString());
		System.out.println(req.getParameter("id") + " " + req.getParameter("pass"));

		res.setContentType("text/html; charset=UTF-8"); // 이것만 보내면 한글이 깨짐

		PrintWriter out = res.getWriter();
		out.println("<h1>Success 성공</h1>");
		out.close();

	}

}
