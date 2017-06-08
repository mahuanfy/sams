package com.eu.sams.servlet;

import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.service.IScoreService;
import com.eu.sams.service.impl.ScoreService;
import net.sf.json.JSONArray;

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
@WebServlet(name = "ScoreServlet",urlPatterns = "/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    IScoreService scoreService = new ScoreService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if(method.equals("score")){
            score(req,resp);
        }else
        if(method.equals("sc_idscore")){
            sc_idscore(req,resp);
        }else if(method.equals("idscore")){
            idscore(req, resp);
        }else if(method.equals("saveById")){
            saveById(req, resp);
        }else if(method.equals("sc_idDelete")){
            sc_idDelete(req, resp);
        }else if(method.equals("addStudentResult")){
            System.out.println("查询成绩");
            addStudentResult(req, resp);
        }
    }
    protected void score(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List <ScoreBean> scoreBeans = scoreService.score();
        JSONArray jsonArray = JSONArray.fromObject(scoreBeans);
        System.out.println(jsonArray);
        resp.getWriter().print(jsonArray);
    }
    protected void sc_idscore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sc_id = Integer.parseInt(req.getParameter("sc_id"));
        System.out.println(req.getParameter("sc_id"));
        List <ScoreBean> scoreBeans = scoreService.idFindscore(sc_id);
        JSONArray jsonArray = JSONArray.fromObject(scoreBeans);
        System.out.println(jsonArray);
        resp.getWriter().print(jsonArray);
    }

    protected void idscore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List <StudentBean> studentBean = (List<StudentBean>) req.getSession().getAttribute("info");
        System.out.println(studentBean.get(0).getS_studentid());
        List <ScoreBean> scoreBeans = scoreService.idscore(studentBean.get(0).getS_studentid());
        JSONArray jsonArray = JSONArray.fromObject(scoreBeans);
        System.out.println("111111"+jsonArray);
        resp.getWriter().print(jsonArray);
    }
    protected void saveById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ScoreBean scoreBean =new ScoreBean();
        scoreBean.setSc_studentid(req.getParameter("sc_studentid"));
        scoreBean.setSc_name(req.getParameter("sc_name"));
        scoreBean.setSc_class1( Integer.parseInt(req.getParameter("sc_class1")));
        scoreBean.setSc_class2( Integer.parseInt(req.getParameter("sc_class2")));
        scoreBean.setSc_class3( Integer.parseInt(req.getParameter("sc_class3")));
        scoreBean.setSc_class4( Integer.parseInt(req.getParameter("sc_class4")));
        scoreBean.setSc_class5( Integer.parseInt(req.getParameter("sc_class5")));
        scoreBean.setSc_class6( Integer.parseInt(req.getParameter("sc_class6")));
        scoreBean.setSc_class7( Integer.parseInt(req.getParameter("sc_class7")));
        scoreBean.setSc_class8( Integer.parseInt(req.getParameter("sc_class8")));
        scoreBean.setSc_class9( Integer.parseInt(req.getParameter("sc_class9")));
        scoreBean.setSc_class10( Integer.parseInt(req.getParameter("sc_class10")));
        scoreService.saveById(scoreBean);
        resp.sendRedirect(req.getContextPath() + "/Admin/teacher_score.jsp");
    }
    protected void sc_idDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sc_id = Integer.parseInt(req.getParameter("sc_id"));
        scoreService.sc_idDelete(sc_id);
    }
    protected void addStudentResult(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ScoreBean scoreBean =new ScoreBean();
        scoreBean.setSc_name(req.getParameter("sc_name1"));
        scoreBean.setSc_studentid (req.getParameter("sc_studentid1"));
        scoreBean.setSc_class1( Integer.parseInt(req.getParameter("sc_class11")));
        scoreBean.setSc_class2( Integer.parseInt(req.getParameter("sc_class21")));
        scoreBean.setSc_class3( Integer.parseInt(req.getParameter("sc_class31")));
        scoreBean.setSc_class4( Integer.parseInt(req.getParameter("sc_class41")));
        scoreBean.setSc_class5( Integer.parseInt(req.getParameter("sc_class51")));
        scoreBean.setSc_class6( Integer.parseInt(req.getParameter("sc_class61")));
        scoreBean.setSc_class7( Integer.parseInt(req.getParameter("sc_class71")));
        scoreBean.setSc_class8( Integer.parseInt(req.getParameter("sc_class81")));
        scoreBean.setSc_class9( Integer.parseInt(req.getParameter("sc_class91")));
        scoreBean.setSc_class10( Integer.parseInt(req.getParameter("sc_class101")));
        scoreService.addStudentResult(scoreBean);
        resp.sendRedirect(req.getContextPath()+"/Admin/teacher_score.jsp");
    }
}
