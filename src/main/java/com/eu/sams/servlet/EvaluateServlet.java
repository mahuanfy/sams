package com.eu.sams.servlet;

import com.eu.sams.entity.EvaluateBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.service.IEvaluateService;
import com.eu.sams.service.impl.EvaluateService;
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
 * Created by 马欢欢&杨璐鹏 on 2017/6/9.
 */
@WebServlet(name = "EvaluateServlet",urlPatterns = "/EvaluateServlet")
public class EvaluateServlet extends HttpServlet {
    private IEvaluateService evaluateService =new EvaluateService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if(method.equals("teacherEvaluateStudent")){
            teacherEvaluateStudent(req,resp);
        }else
        if(method.equals("findteacherEvaluateStudent")){
            findteacherEvaluateStudent(req,resp);
        }if (method.equals("studentMessage")){
            studentMessage(req,resp);
        }else if (method.equals("find_studentMessage")){
            find_studentMessage(req,resp);
        }else if (method.equals("findStudentToTeacherEvaluate")){
            findStudentToTeacherEvaluate(req,resp);
        }else if(method.equals("find_teacherMessage")){
            find_teacherMessage(req,resp);

        }
    }
    protected void teacherEvaluateStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EvaluateBean evaluateBean = new EvaluateBean();
        List<TeacherBean> list = (List<TeacherBean>) req.getSession().getAttribute("info");
        evaluateBean.setE_teacherid( list.get(0).getT_teacherid());
        evaluateBean.setE_message_t( req.getParameter("e_message_t"));
        evaluateBean.setE_time(req.getParameter("e_time"));
        evaluateBean.setE_discern("1");
        evaluateService.teacherEvaluateStudent(evaluateBean);
    }
    protected void findteacherEvaluateStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EvaluateBean evaluateBean = new EvaluateBean();
        List<TeacherBean> list = (List<TeacherBean>) req.getSession().getAttribute("info");
        evaluateBean.setE_teacherid( list.get(0).getT_teacherid());
        evaluateBean.setE_discern("1");
        List<EvaluateBean> list1 =  evaluateService.findteacherEvaluateStudent(evaluateBean);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        System.out.println("老师留言信息："+jsonArray);
        resp.getWriter().print(jsonArray);
    }
    private void studentMessage(HttpServletRequest request, HttpServletResponse response) {
        EvaluateBean evaluateBean=new EvaluateBean();
        System.out.println(88888);
        List<StudentBean> studentBeans= (List<StudentBean>) request.getSession().getAttribute("info");
        evaluateBean.setE_studentid(studentBeans.get(0).getS_studentid());
        evaluateBean.setE_sudent_t(request.getParameter("e_sudent_t"));
        evaluateBean.setE_time(request.getParameter("e_time"));
        evaluateBean.setE_studentname(request.getParameter("e_studentname"));
        evaluateBean.setE_discern("2");
        evaluateBean.setE_teacherid(request.getParameter("e_teacherid"));
        evaluateService.studentMessage(evaluateBean);
    }
    private void find_studentMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<StudentBean> studentBeans= (List<StudentBean>) request.getSession().getAttribute("info");
        List<EvaluateBean> evaluateBeans= evaluateService.find_studentMessage(studentBeans.get(0).getS_studentid());
        JSONArray jsonArray = JSONArray.fromObject(evaluateBeans);
        System.out.println(jsonArray);
        response.getWriter().print(jsonArray);

    }

    private void findStudentToTeacherEvaluate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<TeacherBean> teacherBeans= (List<TeacherBean>) request.getSession().getAttribute("info");
        EvaluateBean evaluateBean = new EvaluateBean();
        evaluateBean.setE_teacherid(teacherBeans.get(0).getT_teacherid());
        evaluateBean.setE_discern("2");
        List<EvaluateBean> evaluateBeans= evaluateService.findStudentToTeacherEvaluate(evaluateBean);
        JSONArray jsonArray = JSONArray.fromObject(evaluateBeans);
        System.out.println(jsonArray);
        response.getWriter().print(jsonArray);

    }
    private void find_teacherMessage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<EvaluateBean> evaluateBeans=evaluateService.find_teacherMessage("1");
        System.out.println(333);
        JSONArray jsonArray=JSONArray.fromObject(evaluateBeans);
        System.out.println(jsonArray);
        resp.getWriter().print(jsonArray);


    }


}
