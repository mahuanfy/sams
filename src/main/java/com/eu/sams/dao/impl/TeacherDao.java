package com.eu.sams.dao.impl;

import com.eu.sams.dao.ITeacherDao;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public class TeacherDao extends BaseDaoutil implements ITeacherDao{
    public List<TeacherBean> teacherInfo(String t_teacherid) {
        String sql="SELECT * FROM teacher WHERE t_teacherid=?;";
        Object []info={t_teacherid};
        List<TeacherBean> teacherBean=super.query(sql,info,TeacherBean.class);
        return (teacherBean!=null&&teacherBean.size()>0?teacherBean:null);

    }
}
