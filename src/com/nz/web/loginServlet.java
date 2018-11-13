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
		//���ñ����ʽ����ֹ����
		request.setCharacterEncoding("utf-8");
		//��ȡҳ�洫�ݹ����Ĳ���ֵ
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		String checkcode=request.getParameter("checkcode");
		HttpSession session=request.getSession();
		String code=(String)session.getAttribute("key");
		//�ж���֤���Ƿ���ȷ
		if(checkcode !=null && code.equals(checkcode)){
			//ͨ���û��������û�
			User u1=uService.findByName(uname);
			//�ж��û��Ƿ����
			if(u1 !=null){
				//ͨ���û������������û�
				User u2=uService.findByNameAndPwd(uname,pwd);
				//�ж������Ƿ���ȷ
				if(u2 !=null ){
					//��½�ɹ�����ת����ҳ
					request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
										
				}else{
					//�������,��ת����¼ҳ
					session.setAttribute("code", "3");
					//����ת�������ض���Ϊʲô
					response.sendRedirect("/WEB-INF/login.jsp");
				}	
			
				}else{
					//�û���������
					session.setAttribute("code","2");
					response.sendRedirect("/WEB-INF/login.jsp");
				}
			}else{
				//��֤�����
				session.setAttribute("code","1");
				response.sendRedirect("/WEB-INF/login.jsp");
			}
		}

}
