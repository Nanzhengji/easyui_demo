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
		//��ȡҳ�洫�ݹ�����ֵ
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		//��װ
		User newU=new User();
		newU.setUname(uname);
		newU.setPwd(pwd);
		//�浽���ݿ�
		uService.save(newU);
		
		//��ת����½ҳ��
		response.sendRedirect("login");
		
	}
}
