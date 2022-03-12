package com.ssafit.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/list")
public class ListReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 화면에 사용할 데이터를 호출하여
		// JSP가 사용할 수 있도록 request 영역에 부여한다.

		req.setAttribute("list", ReviewDao.getInstance().selectReview());

		// JSP페이지로 이동
		// forward는 프로젝트 내 에서만 사용할 수 있으므로, 프로젝트 명까지 생략한다.
//		RequestDispatcher rd = req.getRequestDispatcher("/board/list.jsp");
		// '/'가 없으면 현재 호출 페이지에서 마지막 값만 수정해서 호출한다.
		RequestDispatcher rd = req.getRequestDispatcher("list.jsp");
		rd.forward(req, res);
	}
}
