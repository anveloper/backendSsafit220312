package com.ssafit.model.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.dao.ReviewDao;

@WebServlet("/ssafit/review/delete")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));

		ReviewDao.getInstance().deleteReview(no);

		res.sendRedirect("/03-ssafit/ssafit/detail?youtubeId=" + req.getParameter("youtubeId"));
	}
}
