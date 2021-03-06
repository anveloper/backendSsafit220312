package com.ssafit.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafit.model.dao.MainDao;

@WebServlet("/ssafit/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
				
		req.setAttribute("ilist", MainDao.getInstance().selectInterestViewFitVideo());
		req.setAttribute("wlist", MainDao.getInstance().selectPartFitVideo("전신"));
		req.setAttribute("ulist", MainDao.getInstance().selectPartFitVideo("상체"));
		req.setAttribute("llist", MainDao.getInstance().selectPartFitVideo("하체"));
		req.setAttribute("clist", MainDao.getInstance().selectPartFitVideo("복부"));
				
		req.getRequestDispatcher("main.jsp").forward(req, res);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession ss = req.getSession();
		Member m = (Member) ss.getAttribute("logonMember");
		System.out.println("main : \n" + m.toString());
		doGet(req, res);
	}

}
