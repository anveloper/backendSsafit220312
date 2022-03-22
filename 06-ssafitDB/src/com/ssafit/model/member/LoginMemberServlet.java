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
		// 아이디가 없거나, 비밀번호가 맞지 않으면 null
		Member member = md.getMemberByUserId(userId, password);

		if (md.isExistedUserId(userId) && member != null) {
			System.out.println(member.toString());
			// 뭘해야 크롬 세션에도 정보가 들어갈까..
			ss.setAttribute("logonMember", member);
			ss.setAttribute("logonMemberId", member.getUserId());
			ss.setAttribute("logonMemberNick", member.getNickname());
			req.setAttribute("logonMember", member);
			req.setAttribute("logonMemberId", member.getUserId());
			req.setAttribute("logonMemberName", member.getNickname());
			req.getRequestDispatcher("/ssafit/main").forward(req, res);
//			res.sendRedirect("/03-ssafit/ssafit/main");
		} else { // 로그인 실패
			System.out.println("login fail");
			out.println("<script>alert('없는 아이디 이거나 잘못된 패스워드입니다.'); location.href='" + "/03-ssafit/ssafit/main"
					+ "';</script>");
		}
		if (ss.getAttribute("logonMember") != null)
			System.out.println("지금 세션에 정보가 있는 지\n" + ss.getAttribute("logonMember").toString());

		out.close();
	}

}
