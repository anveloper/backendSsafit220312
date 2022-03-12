package com.ssafy.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/write")
public class WriteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.getRequestDispatcher("write.jsp").forward(req, res);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		// title이 없으면 제목없음으로 등록
		BoardDAO.getInstance()
				.insertBoard(new Board((req.getParameter("title").length() == 0 ? "(제목없음)" : req.getParameter("title")),
						req.getParameter("writer"), req.getParameter("content")));
//		req.getRequestDispatcher("list").forward(req, res);
		// 페이지가 바뀌어도 url이 바뀌지 않는다. write가 계속된다.
		res.sendRedirect("/02-board/board/list");
		// sendRedirect다른 page로도 요청이 된다. 따라서 프로젝트명을 넣어주는게 좋다.

	}
}
