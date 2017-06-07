package com.eu.sams.dao.impl;

import com.eu.sams.dao.IScoreDao;
import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public class ScoreDao extends BaseDaoutil implements IScoreDao {
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
    public List<ScoreBean> idFindscore(int sc_id) {
        String sql = " SELECT * FROM score WHERE sc_id=?; ";
        Object[] num = {sc_id};
        List <ScoreBean> scoreBeans = super.query(sql,num,ScoreBean.class);
        return scoreBeans != null && scoreBeans.size() > 0 ? scoreBeans : null;
    }

    public void saveById(ScoreBean scoreBean) {
        String sql = " UPDATE  score SET sc_class1=? ,sc_class2=?,sc_class3=?,sc_class4=?,sc_class5=?,sc_class6=?,sc_class7=?,sc_class8=?,sc_class9=?,sc_class10=? WHERE sc_studentid=?; ";

        Object[] num ={scoreBean.getSc_class1(),scoreBean.getSc_class2(),scoreBean.getSc_class3(),
                scoreBean.getSc_class4(),scoreBean.getSc_class5(),scoreBean.getSc_class6(),
                scoreBean.getSc_class7(),scoreBean.getSc_class8(),scoreBean.getSc_class9(),
                scoreBean.getSc_class10(),scoreBean.getSc_studentid()};
        for(int i=0;i<num.length;i++) {
            System.out.println(num[i]);
        }
        super.update(sql,num);
    }
}
