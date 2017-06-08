package com.eu.sams.dao;

import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;

import java.util.List;

/**
 * Created by 杨路鹏 on 2017/6/6.
 */
public interface IStudentDao {

    /**
     * 查找学生信息
     */
    List <StudentBean> studentInfo(String s_studentid);


}
