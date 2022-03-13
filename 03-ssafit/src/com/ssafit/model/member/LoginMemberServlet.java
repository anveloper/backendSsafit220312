package com.ssafit.model.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafit.model.Member;
import com.ssafit.model.dao.MemberDao;

@WebServlet("/ssafit/member/login")
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter out = res.getWriter();

		HttpSession ss = req.getSession();

		MemberDao md = MemberDao.getInstance();
		String userId = req.getParameter("userId");
		String password = req.getParameter("password");

		Member member = md.getMemberByUserId(userId, password);
		
		if (md.isExistedUserId(userId) && member != null) {
			System.out.println(member.toString());
			ss.setAttribute("logonMember", member);
			res.sendRedirect("/03-ssafit/ssafit/main");
		} else {
			out.println("<script>alert('없는 아이디 이거나 잘못된 패스워드입니다.'); location.href='" + "/03-ssafit/ssafit/main"
					+ "';</script>");
			out.close();
			return;
		}

	}

}
