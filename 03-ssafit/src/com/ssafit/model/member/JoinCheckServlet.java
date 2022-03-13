package com.ssafit.model.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.dao.MemberDao;

@WebServlet("/ssafit/joincheck")
public class JoinCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		MemberDao md = MemberDao.getInstance();
		String msg = "null";
		if (md.isExistedUserId(userId))
			msg = "exist";
		else if (userId.length() > 0) {
			switch (md.isAvailableUserId(userId)) {
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
		MemberDao md = MemberDao.getInstance();
		String msg = "null";
		if (password.length() > 0) {
			switch (md.isAvailablePassword(password)) {
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
		MemberDao md = MemberDao.getInstance();
		String msg = "null";
		if (md.isExistedNickname(nickname))
			msg = "exist";
		else if (nickname.length() > 0) {
			switch (md.isAvailableNickname(nickname)) {
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

}
