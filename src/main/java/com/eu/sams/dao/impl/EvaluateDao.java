package com.eu.sams.dao.impl;

import com.eu.sams.dao.IEvaluateDao;
import com.eu.sams.entity.EvaluateBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/9.
 */
public class EvaluateDao extends BaseDaoutil implements IEvaluateDao {
    public void teacherEvaluateStudent(EvaluateBean evaluateBean) {
        String sql = "  INSERT INTO evaluate (e_teacherid,e_message_t,e_discern,e_time) VALUES (?,?,?,?); ";
        Object[] num ={evaluateBean.getE_teacherid(),evaluateBean.getE_message_t(),evaluateBean.getE_discern(),evaluateBean.getE_time()};
        super.update(sql,num);
    }

    public List<EvaluateBean> findteacherEvaluateStudent(EvaluateBean evaluateBean) {
        String sql = " SELECT * FROM evaluate WHERE e_teacherid=? AND e_discern=?; ";
        Object[] num={evaluateBean.getE_teacherid(),evaluateBean.getE_discern()};
        List <EvaluateBean> list = super.query(sql,num,EvaluateBean.class);
        return list !=null&&list.size()>0?list :null;
    }
}
