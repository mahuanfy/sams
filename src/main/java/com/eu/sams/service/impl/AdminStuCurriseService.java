package com.eu.sams.service.impl;

import com.eu.sams.dao.IAdminStuCourseDao;
import com.eu.sams.dao.impl.AdminStuCourseDao;
import com.eu.sams.entity.CurriseBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.service.IAdminStuCurriseService;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/12.
 */
public class AdminStuCurriseService implements IAdminStuCurriseService {
    private IAdminStuCourseDao adminStuCourseDao = new AdminStuCourseDao();
    public List<CurriseBean> Admin_TeacherFindCourse() {
        try{
            return adminStuCourseDao.Admin_TeacherFindCourse();
        }catch (Exception e){
            throw new RuntimeException(e);
        }

    }

    public List<TeacherBean> Student_findTeacher() {
        try{
           return adminStuCourseDao.Student_findTeacher();
        }catch (Exception e){
            throw new RuntimeException(e);
        }

    }

    public List<StudentBean> StudentIdFindName(String s_studentid) {
        try{
            return adminStuCourseDao.StudentIdFindName(s_studentid);
        }catch (Exception e){
            throw new RuntimeException(e);
        }    }
}
