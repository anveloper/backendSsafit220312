package com.ssafit.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.config.MyAppSqlConfig;
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
		String youtubeId = req.getParameter("youtubeId");
		switch(act) {
		case "list":
			
		}
		
	}

	private void postProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

}
