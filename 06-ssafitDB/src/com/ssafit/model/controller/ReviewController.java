package com.ssafit.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.config.MyAppSqlConfig;
import com.ssafit.model.Review;
import com.ssafit.model.dao.ReviewDao;

@WebServlet("/ssafit/review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDao reviewDao;

	public ReviewController() {
		reviewDao = MyAppSqlConfig.getSession().getMapper(ReviewDao.class);
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		getProcess(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		postProcess(req, res);
		// 정보를 등록, 수정하거나, 삭제하는 기능 은 post로 분리
	}

	private void getProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String act = req.getParameter("act");

		switch (act) {
		case "list":
			selectReviewByYoutubeId(req, res);
			break;
		case "detail":
			selectReview(req, res);
			break;
		case "writeForm":
			writeForm(req, res);
			break;
		case "updateForm":
			updateForm(req, res);
			break;
		case "delete":
			deleteReview(req, res);
			break;
		}

	}

	private void postProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String act = req.getParameter("act");

		switch (act) {
		case "insert":
			insertReview(req, res);
			break;
		case "update":
			updateReview(req, res);
		}
	}

	private void selectReviewByYoutubeId(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String youtubeId = req.getParameter("youtubeId");
		List<Review> rlist = reviewDao.selectReviewByYoutubeId(youtubeId);
		req.setAttribute("rlist", rlist);
		req.getRequestDispatcher("detail.jsp").forward(req, res);
	}

	private void selectReview(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
		Review review = reviewDao.selectReview(reviewNo);
		reviewDao.upReviewViewCntByReviewNo(reviewNo);
		System.out.println(review.toString());
		req.setAttribute("review", review);
		req.getRequestDispatcher("review/detail.jsp").forward(req, res);
	}

	private void writeForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("youtubeId", req.getParameter("youtubeId"));
		req.getRequestDispatcher("review/writeForm.jsp").forward(req, res);
	}

	private void insertReview(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String youtubeId = req.getParameter("youtubeId");
		reviewDao.insertReview(new Review(req.getParameter("youtubeId"), req.getParameter("title"), req.getParameter("userId"),
				req.getParameter("content")));

		res.sendRedirect("main?act=detail&youtubeId=" + youtubeId);
	}

	private void updateForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));		
		req.setAttribute("youtubeId", req.getParameter("youtubeId"));
		req.setAttribute("review", reviewDao.selectReview(reviewNo));
		req.getRequestDispatcher("review/updateForm.jsp").forward(req, res);
	}

	private void updateReview(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String reviewNo = req.getParameter("reviewNo");
		Review review = new Review(Integer.parseInt(req.getParameter("reviewNo")), req.getParameter("title"),req.getParameter("content"));		
		reviewDao.updateReview(review);
		res.sendRedirect("review?act=detail&reviewNo=" + reviewNo);
	}

	private void deleteReview(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
		Review review = reviewDao.selectReview(reviewNo);
//		HttpSession session = req.getSession();
//		String logonId = session.getAttribute("userId").toString();
		String logonId = "asdf";
		if (logonId != review.getUserId()) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = res.getWriter();
			writer.println(
					"<script>alert('작성자만 삭제 가능합니다.'); location.href='" + "/06-ssafitDB/ssafit/main" + "';</script>");
			writer.close();
			return;
		}
		System.out.println(review.toString());
		req.setAttribute("review", review);
		req.getRequestDispatcher("review/detail.jsp").forward(req, res);
	}
}
