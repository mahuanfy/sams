package com.eu.sams.servlet;

import com.eu.sams.entity.StudentBean;
import com.eu.sams.service.IUserSerivce;
import com.eu.sams.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.io.IOException;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {
    IUserSerivce userSerivce =new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html;charset=utf-8");
       req.setCharacterEncoding("utf-8");
       String method = req.getParameter("method");
       if(method.equals("slogin")){
           slogin(req,resp);
       }
    }
    protected void slogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentBean studentBean = new StudentBean();
        studentBean.setS_username(req.getParameter("username"));
        studentBean.setS_password(req.getParameter("password"));
        List<StudentBean> slist= userSerivce.Slogin(studentBean);
        if(slist !=null){
            req.getSession().setAttribute("info",slist);
            resp.sendRedirect(req.getContextPath() + "/Admin/index1.jsp");
        } else {
            req.setAttribute("err","用户名或密码有误，请重新登录");
            req.getRequestDispatcher(req.getContextPath() + "/index.jsp").forward(req,resp);
        }
    }
}
