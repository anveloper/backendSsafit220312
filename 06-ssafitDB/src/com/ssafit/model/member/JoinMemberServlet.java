package com.ssafit.model.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafit.model.Member;
import com.ssafit.model.dao.MemberDao;

@WebServlet("/ssafit/member/join")
public class JoinMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		System.out.println("UserId : " + req.getParameter("userId") + "\nPassword : " + req.getParameter("password")
				+ "\nNickname : " + req.getParameter("nickname"));
		MemberDao.getInstance().doJoinMember(
				new Member(req.getParameter("userId"), req.getParameter("password"), req.getParameter("nickname")));
		res.sendRedirect("/03-ssafit/ssafit/main");
	}

}
