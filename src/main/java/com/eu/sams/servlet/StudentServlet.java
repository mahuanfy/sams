package com.eu.sams.servlet;

import com.eu.sams.entity.StudentBean;
import com.eu.sams.service.IStudentService;
import com.eu.sams.service.impl.StudentService;
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
@WebServlet(name = "StudentServlet",urlPatterns = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    IStudentService studentService=new StudentService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String method=request.getParameter("method");
        if(method.equals("studentInfo")){
            System.out.println(12121255);
            studentInfo(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void studentInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("woshisyuds");
        List <StudentBean> studentBean= (List<StudentBean>) request.getSession().getAttribute("info");

        List <StudentBean> studentBean1= studentService.studentInfo(studentBean.get(0).getS_studentid());
        JSONArray jsonArray = JSONArray.fromObject(studentBean1);
        System.out.println("111111"+jsonArray);
        response.getWriter().print(jsonArray);
    }
}
