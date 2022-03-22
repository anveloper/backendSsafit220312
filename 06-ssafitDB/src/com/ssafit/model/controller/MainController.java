package com.ssafit.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.config.MyAppSqlConfig;
import com.ssafit.model.dao.VideoDao;

@WebServlet("/main")
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
		if(!req.getParameterMap().containsKey("act")) { // main
			System.out.println("main page 이동");
			req.setAttribute("ilist", videoDao.selectInterestViewFitVideo());
			req.setAttribute("wlist", videoDao.selectPartFitVideo(1));
			req.setAttribute("ulist", videoDao.selectPartFitVideo(2));
			req.setAttribute("llist", videoDao.selectPartFitVideo(3));
			req.setAttribute("clist", videoDao.selectPartFitVideo(4));		
			req.getRequestDispatcher("main.jsp").forward(req, res);
		}
		String act = req.getParameter("act");
		
		
	}

	private void postProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

}
