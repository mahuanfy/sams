package com.eu.sams.dao.impl;

import com.eu.sams.dao.IAdminStuCourseDao;
import com.eu.sams.entity.CurriseBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
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

    public List<TeacherBean> Student_findTeacher() {
        String sql=" select * from  teacher ;";
        List<TeacherBean> teacherBeans = super.query(sql,null,TeacherBean.class);
        return teacherBeans!=null&&teacherBeans.size()>0?teacherBeans:null;
    }

    public List<StudentBean> StudentIdFindName(String s_studentid) {
        String sql =" SELECT * from students where s_studentid=? ";
        Object[] num={s_studentid};
        List<StudentBean> studentBeans =super.query(sql,num,StudentBean.class);
        return studentBeans!=null&&studentBeans.size()>0?studentBeans:null;

    }
}
