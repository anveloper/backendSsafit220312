package com.ssafy.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/idcheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		String msg = "success";
		if ("ssafy".equals(id)) {
			msg = "fail";
		}
		res.setContentType("text/plain; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
		out.close();
	}
}
