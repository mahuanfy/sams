package com.eu.sams.dao.impl;

import com.eu.sams.dao.IStudentDao;
import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public class StudentDao extends BaseDaoutil implements IStudentDao {
    public List<ScoreBean> score() {
        String sql = " SELECT * FROM score; ";
        List<ScoreBean> scoreBeans = super.query(sql, null, ScoreBean.class);
        return scoreBeans != null && scoreBeans.size() > 0 ? scoreBeans : null;
    }

    public List<StudentBean> studentInfo() {
        return null;
    }

    public List<ScoreBean> idscore(String s_studentid){
        String sql="SELECT * FROM score WHERE sc_studentid=?";
        Object[] num={s_studentid};
        List<ScoreBean> scoreBeans=super.query(sql,num,ScoreBean.class);
        return scoreBeans != null && scoreBeans.size() > 0 ? scoreBeans : null;
    }
}
