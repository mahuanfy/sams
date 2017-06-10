package com.eu.sams.service.impl;

import com.eu.sams.dao.IAdminDao;
import com.eu.sams.dao.impl.AdminDao;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.service.IAdminService;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/10.
 */
public class AdminService implements IAdminService {
    IAdminDao adminDao = new AdminDao();
    public List<TeacherBean> findTeacherInfo() {
        try {
           return adminDao.findTeacherInfo();
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void insertTeacher(TeacherBean teacherBean) {
        try {
            adminDao.insertTeacher(teacherBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void deleteTeacher(int t_id) {
        try {
            adminDao.deleteTeacher(t_id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void updataTeacher(TeacherBean teacherBean) {
        try {
            adminDao.updataTeacher(teacherBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public List<TeacherBean> findTeacherToId(int t_id) {
        try {
            return adminDao.findTeacherToId(t_id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
    public List<StudentBean> Admin_StudentInfo() {
        try {
            return adminDao.Admin_StudentInfo();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public void Admin_addInfo(StudentBean studentBean) {
        try {
            adminDao.Admin_addInfo(studentBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void Admin_deleteInfo(int s_id) {
        try{
            adminDao.Admin_deleteInfo(s_id);

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void Admin_updateInfo(StudentBean studentBean) {
        try {
            adminDao.Admin_updateInfo(studentBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public List<StudentBean> findStudentToId(int s_id) {
        try {
            return adminDao.findStudentToId(s_id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
