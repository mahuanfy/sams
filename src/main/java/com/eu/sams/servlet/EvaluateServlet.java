package com.eu.sams.servlet;

import com.eu.sams.entity.EvaluateBean;
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
 * Created by 马欢欢 on 2017/6/9.
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
        }else if(method.equals("idscore")){

        }else if(method.equals("saveById")){

        }else if(method.equals("sc_idDelete")){

        }else if(method.equals("addStudentResult")){
            System.out.println("查询成绩");
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
}
