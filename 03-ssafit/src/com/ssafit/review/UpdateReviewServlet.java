package com.ssafit.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Review/update")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		Review Review = ReviewDao.getInstance().getReviewByNo(no);
		req.setAttribute("Review", Review);
		req.getRequestDispatcher("update.jsp").forward(req, res);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		int no = Integer.parseInt(req.getParameter("no"));
		Review Review = ReviewDao.getInstance().getReviewByNo(no);
		
		Review.setTitle(req.getParameter("title"));
		Review.setWriter(req.getParameter("writer"));
		Review.setContent(req.getParameter("content"));		
		
		res.sendRedirect("/02-ssafit/review/detail?no=" + no);

	}
}
