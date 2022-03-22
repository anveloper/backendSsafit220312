package com.ssafy.board.test;

import java.util.List;

import com.ssafy.board.config.MyAppSqlConfig;
import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.model.dto.Board;

public class Test {
	public static void main(String[] args) {
		BoardDao dao = MyAppSqlConfig.getSession().getMapper(BoardDao.class);
		
		Board board = new Board("22마이바티스는 사실...", "고나령", "아주   ezezezez어렵게 생각 말기");
		
		dao.insertBoard(board);
		
//		System.out.println(dao.selectBoardById(3));
		
		
//		dao.deleteBoard(5);
//		
//		List<Board> list = dao.selectBoard();
//		
//		for(Board b : list) {
//			System.out.println(b);
//		}
//		
//		
//		dao.updateViewCnt(2);
//		
//		System.out.println(dao.selectBoardById(2));
//		
		
//		Board b = dao.selectBoardById(1);
//		b.setContent("이제곧 점심시간이다.");
//		
//		dao.updateBoard(b);
//		
//		System.out.println(dao.selectBoardById(1));
//		
	}
}
