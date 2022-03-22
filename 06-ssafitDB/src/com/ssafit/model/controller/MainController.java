package com.ssafit.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.Detail;

import com.ssafit.config.MyAppSqlConfig;
import com.ssafit.model.Video;
import com.ssafit.model.dao.VideoDao;

@WebServlet("/ssafit/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDao videoDao;

	public MainController() {
		videoDao = MyAppSqlConfig.getSession().getMapper(VideoDao.class);
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		getProcess(req, res);
		// detail 페이지 이동, 리뷰 작성, 수정 폼으로 이동
		// 단순 기능만 구동되는 것은 get으로 구현
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		postProcess(req, res);
		// 정보를 등록, 수정하거나, 삭제하는 기능 은 post로 분리
	}

	private void getProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if (!req.getParameterMap().containsKey("act")) { // main
			System.out.println("main page 이동");
			req.setAttribute("ilist", videoDao.selectVideoByViewCnt());
			req.setAttribute("wlist", videoDao.selectVideoByPartNo(1));
			req.setAttribute("ulist", videoDao.selectVideoByPartNo(2));
			req.setAttribute("llist", videoDao.selectVideoByPartNo(3));
			req.setAttribute("clist", videoDao.selectVideoByPartNo(4));
			req.getRequestDispatcher("main.jsp").forward(req, res);
			return;
		}
		String act = req.getParameter("act");
		switch (act) {
		case "detail":
			Detail(req, res);
			break;
		}

	}

	private void postProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

	private void Detail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String youtubeId = req.getParameter("youtubeId");
		Video video = videoDao.selectVideoByYoutubeId(youtubeId);
		videoDao.upVideoViewCntByYoutubeId(youtubeId);
		req.setAttribute("video", video);
		req.getRequestDispatcher("review?act=list&youtubeId=" + video.getYoutubeId()).forward(req, res);
	}

}

