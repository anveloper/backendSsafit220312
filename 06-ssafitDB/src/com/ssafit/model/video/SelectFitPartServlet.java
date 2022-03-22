package com.ssafit.model.video;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ssafit/selectpart")
public class SelectFitPartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String fitPart = req.getParameter("fitPart");
		String msg = "";
		if(fitPart.equals("wlist"))
			msg="wlist";
		else if(fitPart.equals("ulist"))
			msg="ulist";
		else if(fitPart.equals("llist"))
			msg="llist";
		res.setContentType("text/plain; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
		out.close();
	}
	
}
