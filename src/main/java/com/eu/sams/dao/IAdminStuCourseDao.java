package com.eu.sams.dao;

import com.eu.sams.entity.CurriseBean;

import java.util.*;

/**
 * Created by 马欢欢 on 2017/6/12.
 */
public interface IAdminStuCourseDao {
    /**
     * 查找所有的课程
     */
    List<CurriseBean> Admin_TeacherFindCourse();
}
