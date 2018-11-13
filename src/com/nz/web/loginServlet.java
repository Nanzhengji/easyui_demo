package com.nz.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nz.entity.User;
import com.nz.service.UserService;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private UserService uService=new UserService();
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码格式，防止乱码
		request.setCharacterEncoding("utf-8");
		//获取页面传递过来的参数值
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		String checkcode=request.getParameter("checkcode");
		HttpSession session=request.getSession();
		String code=(String)session.getAttribute("key");
		//判断验证码是否正确
		if(checkcode !=null && code.equals(checkcode)){
			//通过用户名查找用户
			User u1=uService.findByName(uname);
			//判断用户是否存在
			if(u1 !=null){
				//通过用户名和密码找用户
				User u2=uService.findByNameAndPwd(uname,pwd);
				//判断密码是否正确
				if(u2 !=null ){
					//登陆成功，跳转到主页
					request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
										
				}else{
					//密码错误,跳转到登录页
					session.setAttribute("code", "3");
					//请求转发还是重定向？为什么
					response.sendRedirect("/WEB-INF/login.jsp");
				}	
			
				}else{
					//用户名不存在
					session.setAttribute("code","2");
					response.sendRedirect("/WEB-INF/login.jsp");
				}
			}else{
				//验证码错误
				session.setAttribute("code","1");
				response.sendRedirect("/WEB-INF/login.jsp");
			}
		}

}
