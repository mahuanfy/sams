package com.eu.sams.servlet;

import com.eu.sams.entity.CurriseBean;
import com.eu.sams.service.IAdminStuCurriseService;
import com.eu.sams.service.impl.AdminStuCurriseService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/12.
 */
@WebServlet(name = "AdminStuCurriseServlet" ,urlPatterns = "/AdminStuCurriseServlet")
public class AdminStuCurriseServlet extends HttpServlet {
    private IAdminStuCurriseService adminCurriseService = new AdminStuCurriseService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if(method.equals("Admin_findcurrise")){
            Admin_findcurrise(req,resp);
        }
    }
    protected void Admin_findcurrise(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CurriseBean> curriseBeans = adminCurriseService.Admin_TeacherFindCourse();
        JSONArray jsonArray = JSONArray.fromObject(curriseBeans);
        System.out.println(jsonArray);
        resp.getWriter().print(jsonArray);

    }
}



