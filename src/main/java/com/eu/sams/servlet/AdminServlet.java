package com.eu.sams.servlet;

import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.service.IAdminService;
import com.eu.sams.service.impl.AdminService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.io.IOException;

/**
 * Created by 马欢欢 on 2017/6/10.
 */
@WebServlet(name = "AdminServlet",urlPatterns = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    IAdminService adminService = new AdminService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if(method.equals("findTeacherInfo")){
            findTeacherInfo(req,resp);
        }else if(method.equals("insertTeacher")){
            insertTeacher(req,resp);
        }else if(method.equals("deleteTeacher")){
            deleteTeacher(req,resp);
        }else if(method.equals("updataTeacher")){
            updataTeacher(req,resp);
        }else if(method.equals("findTeacherToId")){
            findTeacherToId(req,resp);
        }else if (method.equals("Admin_StudentInfo")){
            Admin_StudentInfo(req,resp);
        }else if (method.equals("Admin_addInfo")){
            Admin_addInfo(req,resp);
        }else if (method.equals("Admin_deleteInfo")){
            Admin_deleteInfo(req,resp);
        }else if (method.equals("Admin_updateInfo")){
            Admin_updateInfo(req,resp);
        }else if (method.equals("findStudentToId")){
            findStudentToId(req,resp);
        }

    }
    protected void findTeacherInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<TeacherBean> teacherBeans = adminService.findTeacherInfo();
        JSONArray jsonArray = JSONArray.fromObject(teacherBeans);
        System.out.println(jsonArray);
        resp.getWriter().print(jsonArray);
    }
    protected void insertTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeacherBean teacherBean = new TeacherBean();
        teacherBean.setT_teacherid(req.getParameter("t_teacherid"));
        teacherBean.setT_username(req.getParameter("t_username"));
        teacherBean.setT_password(req.getParameter("t_password"));
        teacherBean.setT_sex(req.getParameter("t_sex"));
        teacherBean.setT_tipsay(req.getParameter("t_tipsay"));
        adminService.insertTeacher(teacherBean);
        resp.sendRedirect(req.getContextPath()+"/Admin/Admin_TeacherInfo.jsp");
    }
    protected void deleteTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int t_id = Integer.parseInt(req.getParameter("t_id"));
        adminService.deleteTeacher(t_id);
    }
    protected void updataTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeacherBean teacherBean = new TeacherBean();
        teacherBean.setT_id(Integer.parseInt(req.getParameter("t_id")));
        teacherBean.setT_teacherid(req.getParameter("t_teacherid1"));
        teacherBean.setT_username(req.getParameter("t_username1"));
        teacherBean.setT_password(req.getParameter("t_password1"));
        teacherBean.setT_sex(req.getParameter("t_sex1"));
        teacherBean.setT_tipsay(req.getParameter("t_tipsay1"));
        adminService.updataTeacher(teacherBean);
        resp.sendRedirect(req.getContextPath()+"/Admin/Admin_TeacherInfo.jsp");
    }
    protected void findTeacherToId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("t_id"));
        int t_id= Integer.parseInt(req.getParameter("t_id"));
        List<TeacherBean> teacherBeans= (List<TeacherBean>) adminService.findTeacherToId(t_id);
        JSONArray jsonArray = JSONArray.fromObject(teacherBeans);
        System.out.println(jsonArray);
            resp.getWriter().print(jsonArray);

    }




    private void Admin_StudentInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<StudentBean> studentBeans=adminService.Admin_StudentInfo();
        JSONArray jsonArray=JSONArray.fromObject(studentBeans);
        System.out.println(jsonArray);
        response.getWriter().print(jsonArray);
    }
    private void Admin_addInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StudentBean studentBean=new StudentBean();
        studentBean.setS_studentid(request.getParameter("s_studentid"));
        studentBean.setS_username(request.getParameter("s_username"));
        studentBean.setS_password(request.getParameter("s_password"));
        studentBean.setS_sex(request.getParameter("s_sex"));
        studentBean.setS_class(request.getParameter("s_class"));
        adminService.Admin_addInfo(studentBean);
        response.sendRedirect(request.getContextPath()+"/Admin/Admin_StudentInfo.jsp");
    }
    private void Admin_deleteInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int s_id= Integer.parseInt(request.getParameter("s_id"));
        adminService.Admin_deleteInfo(s_id);
    }
    private void Admin_updateInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(request.getParameter("s_id"));
        StudentBean studentBean=new StudentBean();
        studentBean.setS_studentid(request.getParameter("s_studentid1"));
        studentBean.setS_username(request.getParameter("s_username1"));
        studentBean.setS_password(request.getParameter("s_password1"));
        studentBean.setS_sex(request.getParameter("s_sex1"));
        studentBean.setS_class(request.getParameter("s_class1"));
        studentBean.setS_id(Integer.parseInt(request.getParameter("s_id")));
        adminService.Admin_updateInfo(studentBean);
        response.sendRedirect(request.getContextPath()+"/Admin/Admin_StudentInfo.jsp");

    }
    private void findStudentToId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int s_id= Integer.parseInt(request.getParameter("s_id"));
        List<StudentBean> studentBean= (List<StudentBean>) adminService.findStudentToId(s_id);
        JSONArray jsonArray = JSONArray.fromObject(studentBean);
        System.out.println(jsonArray);
        response.getWriter().print(jsonArray);

    }
}
