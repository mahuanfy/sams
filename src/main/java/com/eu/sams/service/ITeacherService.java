package com.eu.sams.service;

import com.eu.sams.entity.TeacherBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public interface ITeacherService {
    /**
     * 查找学生信息
     */
    List<TeacherBean> teacherInfo(String t_teacherid);

}
