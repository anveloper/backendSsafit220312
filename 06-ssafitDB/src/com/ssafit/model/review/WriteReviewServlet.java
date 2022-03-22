package com.ssafit.model.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.Review;
import com.ssafit.model.dao.ReviewDao;

@WebServlet("/ssafit/review/write")
public class WriteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("youtubeId", req.getParameter("youtubeId"));
		req.getRequestDispatcher("write.jsp").forward(req, res);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		ReviewDao.getInstance()
				.insertReview(new Review(req.getParameter("youtubeId"),
						(req.getParameter("title").length() == 0 ? "(제목없음)" : req.getParameter("title")),
						req.getParameter("writer"), req.getParameter("content")));	
		
		res.sendRedirect("/03-ssafit/ssafit/detail?youtubeId=" + req.getParameter("youtubeId"));
	}
}
