package com.eu.sams.servlet;

import com.eu.sams.entity.AdminBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
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
        if (method.equals("tlogin")){
            tlogin(req,resp);
        }
        if (method.equals("alogin")){
            alogin(req,resp);
        }
    }
    protected void slogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentBean studentBean = new StudentBean();
        studentBean.setS_username(req.getParameter("username"));
        studentBean.setS_password(req.getParameter("password"));
        List<StudentBean> slist= userSerivce.Slogin(studentBean);
        if(slist !=null){
            req.getSession().setAttribute("info",slist);
            req.getSession().setAttribute("identity","student");
            resp.sendRedirect(req.getContextPath() + "/Admin/index1.jsp");
        } else {
            req.setAttribute("err","用户名或密码有误，请重新登录");
            req.getRequestDispatcher(req.getContextPath() + "/index.jsp").forward(req,resp);
        }
    }
    protected void tlogin(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        TeacherBean teacherBean=new TeacherBean();
        teacherBean.setT_username(req.getParameter("username"));
        teacherBean.setT_password(req.getParameter("password"));
        List<TeacherBean> tlist=userSerivce.Tlogin(teacherBean);
        if (tlist!=null){
            req.getSession().setAttribute("info",tlist);
            req.getSession().setAttribute("identity","teacher");
            resp.sendRedirect(req.getContextPath()+"/Admin/index1.jsp");
        }else {
            req.setAttribute("err","用户名或密码错误，请重新登录");
            req.getRequestDispatcher(req.getContextPath()+"/index.jsp").forward(req,resp);
        }
    }
    protected void alogin(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        System.out.println("mahuan");
        AdminBean adminBean=new AdminBean();
        adminBean.setA_nameid(request.getParameter("userName"));
        adminBean.setA_password(request.getParameter("password"));
        List<AdminBean> alist=userSerivce.Alogin(adminBean);
        if (alist!=null){
            request.getSession().setAttribute("info",alist);
            request.getSession().setAttribute("identity","admin");
            response.sendRedirect(request.getContextPath()+"/Admin/index1.jsp");
        }else {
            request.setAttribute("err","用户名或密码错误，请重新登录");
            response.sendRedirect(request.getContextPath()+"/Admin/index.html");
        }
    }




}
