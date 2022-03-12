package com.ssafit.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.Review;
import com.ssafit.model.dao.ReviewDao;

@WebServlet("/ssafit/review/detail")
public class DetailReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));

		Review review = ReviewDao.getInstance().getReviewByNo(no);
		
		req.setAttribute("review", review);		
		
		req.getRequestDispatcher("detail.jsp").forward(req, res);
	}

}
