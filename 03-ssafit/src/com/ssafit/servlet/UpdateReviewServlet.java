package com.ssafit.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.Review;
import com.ssafit.model.dao.ReviewDao;

@WebServlet("/ssafit/review/update")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		Review review = ReviewDao.getInstance().getReviewByNo(no);
		req.setAttribute("review", review);
		req.setAttribute("youtubeId", req.getParameter("youtubeId"));
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

		res.sendRedirect("/03-ssafit/ssafit/review/detail?youtubeId=" + req.getParameter("youtubeId") + "&no=" + no);

	}
}
