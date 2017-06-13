package com.eu.sams.servlet;

import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.service.IAdminService;
import com.eu.sams.service.IStudentService;
import com.eu.sams.service.ITeacherService;
import com.eu.sams.service.impl.AdminService;
import com.eu.sams.service.impl.StudentService;
import com.eu.sams.service.impl.TeacherService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by 杨璐鹏 on 2017/6/8.
 */
@WebServlet(name = "TeacherServlet",urlPatterns = "/TeacherServlet")
public class TeacherServlet extends HttpServlet {
ITeacherService teacherService =new TeacherService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String method=request.getParameter("method");
        if(method.equals("teacherInfo")){
            System.out.println(12121255);
            teacherInfo(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void teacherInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List <TeacherBean> teacherBeans= (List<TeacherBean>) request.getSession().getAttribute("info");

        List<TeacherBean> teacherBean1= teacherService.teacherInfo(teacherBeans.get(0).getT_teacherid());
        JSONArray jsonArray = JSONArray.fromObject(teacherBean1);
        System.out.println("111111"+jsonArray);
        response.getWriter().print(jsonArray);
    }
}
