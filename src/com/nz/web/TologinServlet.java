package com.nz.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nz.entity.User;
import com.nz.service.UserService;


@WebServlet("/tologin")
public class TologinServlet extends HttpServlet {
	private UserService uService=new UserService();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/tologin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取页面传递过来的值
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		//封装
		User newU=new User();
		newU.setUname(uname);
		newU.setPwd(pwd);
		//存到数据库
		uService.save(newU);
		
		//跳转到登陆页面
		response.sendRedirect("login");
		
	}
}
