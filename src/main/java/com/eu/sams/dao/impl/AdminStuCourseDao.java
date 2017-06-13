package com.eu.sams.dao.impl;

import com.eu.sams.dao.IAdminStuCourseDao;
import com.eu.sams.entity.CurriseBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/12.
 */
public class AdminStuCourseDao extends BaseDaoutil implements IAdminStuCourseDao {
    public List<CurriseBean> Admin_TeacherFindCourse() {
        String sql = " SELECT * FROM currise; ";
        List<CurriseBean> curriseBeans = super.query(sql,null,CurriseBean.class);
        return curriseBeans!=null&&curriseBeans.size()>0 ?curriseBeans:null;
    }
}
