package com.ssafy.board;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private List<Board> list = new ArrayList<>();
	private int no = 0;
	private static BoardDAO instance;

	private BoardDAO() {
		insertBoard(new Board("제목자리", "작성자", "내용이 들어갈 자리입니다."));
		insertBoard(new Board("제리제리", "성자", "글 내용이 들어갈 자리입니다."));
		insertBoard(new Board("타이틀자리", "작자", "이런 내용이 들어갈 자리입니다."));
		insertBoard(new Board("몰루", "자", "저런 내용이 들어갈 자리입니다."));
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	public List<Board> selectBoard() {
		return list;
	}

	public void insertBoard(Board board) {
		board.setNo(++no);
		board.setViewCnt(0);
		list.add(board);
	}

	public Board getBoardByNo(int no) {
		Board board = null;
		for (Board b : list) {
			if (b.getNo() == no) {
				b.upViewCnt();
				board = b;
				break;
			}
		}
		return board;
	}

	public void deleteBoard(int no) {
		for (Board b : list) {
			if (b.getNo() == no) {
				list.remove(b);
				break;
			}
		}
	}
}
