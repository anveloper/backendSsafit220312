package com.ssafit.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.config.MyAppSqlConfig;
import com.ssafit.model.dao.MemberDao;

@WebServlet("/joincheck")
public class JoinCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDao memberDao;

	public JoinCheckServlet() {
		memberDao = MyAppSqlConfig.getSession().getMapper(MemberDao.class);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String msg = "";
		if (req.getParameterMap().containsKey("userId"))
			msg = idCheck(req.getParameter("userId"));

		if (req.getParameterMap().containsKey("password"))
			msg = passCheck(req.getParameter("password"));

		if (req.getParameterMap().containsKey("nickname"))
			msg = nickCheck(req.getParameter("nickname"));

		res.setContentType("text/plain; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
		out.close();
	}

	private String idCheck(String userId) {
		String msg = "null";
		if (memberDao.isExistedUserId(userId))
			msg = "exist";
		else if (userId.length() > 0) {
			switch (isAvailableUserId(userId)) {
			case 0:
				msg = "pass";
				break;
			case 1:
				msg = "firstfail";
				break;
			case 2:
				msg = "short";
				break;
			case 3:
				msg = "long";
				break;
			case 4:
				msg = "fail";
				break;
			default:
				msg = "error";
				break;
			}
		}
		return msg;
	}

	private String passCheck(String password) {
		String msg = "null";
		if (password.length() > 0) {
			switch (isAvailablePassword(password)) {
			case 0:
				msg = "pass";
				break;
			case 1:
				msg = "short";
				break;
			case 2:
				msg = "long";
				break;
			case 3:
				msg = "fail";
				break;
			default:
				msg = "error";
				break;
			}
		}
		return msg;
	}

	private String nickCheck(String nickname) {
		String msg = "null";
		if (memberDao.isExistedNickname(nickname))
			msg = "exist";
		else if (nickname.length() > 0) {
			switch (isAvailableNickname(nickname)) {
			case 0:
				msg = "pass";
				break;
			case 1:
				msg = "short";
				break;
			case 2:
				msg = "long";
				break;
			default:
				msg = "error";
				break;
			}
		}
		return msg;
	}

	private int isAvailableUserId(String userId) {
		if (userId.charAt(0) < 'a' || userId.charAt(0) > 'z')
			return 1; // 첫글자가 숫자면 1
		else if (userId.length() < 5)
			return 2; // 길이가 짧으면 2
		else if (userId.length() > 16)
			return 3;
		else {
			for (char c : userId.toCharArray()) {
				boolean flag = false;
				if (c < 'a' || c > 'z')
					flag = true; // 숫자포함 알파벳 아니면 true
				if (c >= '0' && c <= '9')
					flag = false; // 숫자였으면 다시 false
				if (flag)
					return 4;
			}
		} // 여기까지 왔으면 가능한 ID
		return 0;
	}

	private int isAvailablePassword(String password) {
		if (password.length() < 8)
			return 1; // 길이가 짧으면 1
		else if (password.length() > 20)
			return 2;
		else {
			for (char c : password.toCharArray()) {
				boolean flag = false;
				if (c < 'a' || c > 'z')
					flag = true; // 숫자포함 알파벳 아니면 true
				if (c >= '0' && c <= '9')
					flag = false; // 숫자였으면 다시 false
				if (flag)
					return 3;
			}
		} // 여기까지 왔으면 가능한 ID
		return 0;
	}

	private int isAvailableNickname(String nickname) {
		if (nickname.length() < 2)
			return 1; // 길이가 짧으면 2
		else if (nickname.length() > 8)
			return 2;
		// 여기까지 왔으면 가능한 ID
		return 0;
	}
}
