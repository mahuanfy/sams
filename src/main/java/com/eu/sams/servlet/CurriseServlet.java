package com.eu.sams.servlet;

import com.eu.sams.entity.CurriseBean;
import com.eu.sams.service.ICurriseService;
import com.eu.sams.service.impl.CurriseService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by pc on 2017/6/12.
 */
@WebServlet(name = "CurriseServlet",urlPatterns = "/CurriseServlet")
public class CurriseServlet extends HttpServlet {
    ICurriseService curriseService=new CurriseService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String method=request.getParameter("method");
        if (method.equals("currise_find")){
            currise_find(request,response);

        }else if (method.equals("currise_insert")){

            currise_insert(request,response);
        }else if(method.equals("currise_delete")){
            currise_delete(request,response);
        }else if (method.equals("currise_update")){
            System.out.println(111);
            currise_update(request,response);
        }else if (method.equals("currise_idfind")){
            currise_idfind(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    private void currise_find(HttpServletRequest request, HttpServletResponse response) throws IOException {
    List<CurriseBean> curriseBeans=curriseService.currise_find();
        JSONArray jsonArray=JSONArray.fromObject(curriseBeans);
        System.out.println(jsonArray);
        response.getWriter().print(jsonArray);
    }
    private void currise_insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CurriseBean curriseBean=new CurriseBean();
        curriseBean.setC_name(request.getParameter("c_name"));
        System.out.println("uuuu"+request.getParameter("c_name"));
        curriseService.currise_insert(curriseBean);
        response.sendRedirect(request.getContextPath()+"/Admin/Admin_currise.jsp");
    }
    private void currise_delete(HttpServletRequest request, HttpServletResponse response) {
        int c_id= Integer.parseInt(request.getParameter("c_id"));
        curriseService.currise_delete(c_id);

    }
    private void currise_update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CurriseBean curriseBean=new CurriseBean();
        curriseBean.setC_id(Integer.parseInt(request.getParameter("c_id")));
        curriseBean.setC_name(request.getParameter("c_name"));
        System.out.println(request.getParameter("c_id"));
        System.out.println(request.getParameter("c_name"));
        curriseService.currise_update(curriseBean);
        response.sendRedirect(request.getContextPath()+"/Admin/Admin_currise.jsp");
    }
    private void currise_idfind(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int c_id= Integer.parseInt(request.getParameter("c_id"));
        List<CurriseBean> curriseBeans=curriseService.currise_idfind(c_id);
        JSONArray jsonArray=JSONArray.fromObject(curriseBeans);
        System.out.println(jsonArray);
        response.getWriter().print(jsonArray);
    }



}
