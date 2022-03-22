package com.ssafit.model.video;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.Review;
import com.ssafit.model.Video;
import com.ssafit.model.dao.MainDao;
import com.ssafit.model.dao.ReviewDao;

@WebServlet("/ssafit/detail")
public class DetailVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String youtubeId = req.getParameter("youtubeId");
		Video video = MainDao.getInstance().getVideoByYoutubeId(youtubeId);
		List<Review> rlist = ReviewDao.getInstance().getReviewListByYoutubeId(youtubeId);
		video.upViewCnt();
		req.setAttribute("video", video);	
		req.setAttribute("rlist", rlist);
		req.getRequestDispatcher("detail.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}
}
