package com.eu.sams.service;

import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public interface IStudentService {
    /**
     * 查找学生成绩
     */
    List<ScoreBean> score ();
    /**
     * 查找学生信息
     */
    List <StudentBean> studentInfo();
}
