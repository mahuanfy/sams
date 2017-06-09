package com.eu.sams.dao;

import com.eu.sams.entity.EvaluateBean;

import java.util.*;

/**
 * Created by 马欢欢&杨路鹏 on 2017/6/9.
 */
public interface IEvaluateDao {
    /**
     * 老师给学生发布任务
     */
    void teacherEvaluateStudent(EvaluateBean evaluateBean);

    /**
     * 将老师发布任务查找到该老师页面
     */
    List<EvaluateBean > findteacherEvaluateStudent(EvaluateBean evaluateBean);
}
