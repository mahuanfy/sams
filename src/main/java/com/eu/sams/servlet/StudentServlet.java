package com.eu.sams.servlet;

import com.eu.sams.dao.IStudentDao;
import com.eu.sams.entity.ScoreBean;
import com.eu.sams.service.IStudentService;
import com.eu.sams.service.impl.StudentService;
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
@WebServlet(name = "StudentServlet",urlPatterns = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    IStudentService studentService = new StudentService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if(method.equals("score")){
            score(req,resp);
        }
    }
    protected void score(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List <ScoreBean> scoreBeans = studentService.score();
        JSONArray jsonArray = JSONArray.fromObject(scoreBeans);
        System.out.println(jsonArray);
        resp.getWriter().print(jsonArray);
    }
}
