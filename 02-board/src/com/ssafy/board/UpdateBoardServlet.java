package com.ssafy.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/update")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		Board board = BoardDAO.getInstance().getBoardByNo(no);
		req.setAttribute("board", board);
		req.getRequestDispatcher("update.jsp").forward(req, res);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		int no = Integer.parseInt(req.getParameter("no"));
		Board board = BoardDAO.getInstance().getBoardByNo(no);
		
		board.setTitle(req.getParameter("title"));
		board.setWriter(req.getParameter("writer"));
		board.setContent(req.getParameter("content"));		
		
		res.sendRedirect("/02-board/board/detail?no=" + no);

	}
}
