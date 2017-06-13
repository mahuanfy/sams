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
        String sql = " SELECT * FROM evaluate WHERE e_teacherid=? AND e_discern=? order by e_id desc; ";
        Object[] num={evaluateBean.getE_teacherid(),evaluateBean.getE_discern()};
        List <EvaluateBean> list = super.query(sql,num,EvaluateBean.class);
        return list !=null&&list.size()>0?list :null;
    }
    public void studentMessage(EvaluateBean evaluateBean) {
        String sql="INSERT INTO evaluate(e_sudent_t,e_teacherid,e_studentid,e_time,e_discern.e_studentname) VALUE(?,?,?,?,?,?);";
        Object[] eva={evaluateBean.getE_sudent_t(),evaluateBean.getE_teacherid(),
                evaluateBean.getE_studentid(),evaluateBean.getE_time(),evaluateBean.getE_discern(),evaluateBean.getE_studentname()};
        super.update(sql,eva);
    }

    public List<EvaluateBean> find_studentMessage(String e_studentid) {
        String sql="SELECT * FROM evaluate WHERE e_studentid=? order by e_id desc ;";
        Object[] num={e_studentid};
        List<EvaluateBean> evaluateBeans =super.query(sql,num,EvaluateBean.class);
        return evaluateBeans!=null && evaluateBeans.size()>0 ? evaluateBeans:null;
    }

    public List<EvaluateBean> findStudentToTeacherEvaluate(EvaluateBean evaluateBean) {
        String sql = " SELECT * FROM evaluate WHERE e_teacherid=? AND e_discern=? order by e_id desc ; ";
        Object [] num= {evaluateBean.getE_teacherid(),evaluateBean.getE_discern()};
        List <EvaluateBean> evaluateBeans = super.query(sql,num,EvaluateBean.class);
        return evaluateBeans !=null && evaluateBeans.size()>0 ?evaluateBeans:null;
    }
    public List<EvaluateBean> find_teacherMessage(String e_discern) {
        String sql="SELECT * FROM evaluate WHERE e_discern=? order by e_id desc ;";
        Object [] num={e_discern};
        List<EvaluateBean> evaluateBeans=super.query(sql,num,EvaluateBean.class);
        return evaluateBeans!=null&& evaluateBeans.size()>0?evaluateBeans:null;
    }
}
