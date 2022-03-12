package com.ssafy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test08")
public class Test08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//	@Override
//	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		System.out.println("service");
//	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost");
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doGet");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = res.getWriter();
		writer.write("<html>");
		writer.write("<head>");
		writer.write("<title>Hello! SSAFY?</title>");
		writer.write("</head>");
		writer.write("<body>");
		writer.write("<h1>Hello! Servlet!</h1><br>");
		writer.write("<p>Hello! SSAFY!</p>");
		writer.write("</body>");
		writer.write("</html>");		
	}
}
