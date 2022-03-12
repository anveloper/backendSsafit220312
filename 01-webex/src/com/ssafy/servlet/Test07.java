package com.ssafy.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test07")
public class Test07 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Map<String, String> members = new HashMap<>();

	@Override
	public void init(ServletConfig config) {
		System.out.println("call init");
		members.put("admin", "1111");
		members.put("ssafy", "7777");

	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("call service");

	}

}
