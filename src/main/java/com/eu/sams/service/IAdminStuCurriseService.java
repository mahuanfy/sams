package com.eu.sams.service;

import com.eu.sams.entity.CurriseBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/12.
 */
public interface IAdminStuCurriseService {
    /**
     * 查找所有的课程
     */
    List<CurriseBean> Admin_TeacherFindCourse();

}
