package com.eu.sams.service;

import com.eu.sams.entity.StudentBean;

import java.util.List;

/**
 * Created by 杨璐鹏 on 2017/6/8.
 */
public interface IStudentService {
    /**
     * 查找学生信息
     * */
    List<StudentBean> studentInfo(String s_studentid);
}
