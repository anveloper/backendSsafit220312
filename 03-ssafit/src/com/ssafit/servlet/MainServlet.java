package com.ssafit.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.dao.MainDao;

@WebServlet("/ssafit/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String part ="하체";
		req.setAttribute("ilist", MainDao.getInstance().selectInterestViewFitVideo());
		req.setAttribute("plist", MainDao.getInstance().selectPartFitVideo(part));
		req.getRequestDispatcher("main.jsp").forward(req, res);
	}

}
