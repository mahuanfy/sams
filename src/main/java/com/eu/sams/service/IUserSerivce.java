package com.eu.sams.service;

import com.eu.sams.entity.AdminBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public interface IUserSerivce {
    /**
     * 学生登录
     */
    List<StudentBean> Slogin (StudentBean studentBean);

    /**
     * 老师登录
     */
    List<TeacherBean> Tlogin (TeacherBean teacherBean);

    /**
     * 管理员登录
     *
     */
    List<AdminBean> Alogin (AdminBean adminBean);
}
