package com.eu.sams.service.impl;

import com.eu.sams.dao.IEvaluateDao;
import com.eu.sams.dao.impl.EvaluateDao;
import com.eu.sams.entity.EvaluateBean;
import com.eu.sams.service.IEvaluateService;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/9.
 */
public class EvaluateService implements IEvaluateService {
    private IEvaluateDao evaluateDao = new EvaluateDao();
    public void teacherEvaluateStudent(EvaluateBean evaluateBean) {
        try {
            evaluateDao.teacherEvaluateStudent(evaluateBean);
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    public List<EvaluateBean> findteacherEvaluateStudent(EvaluateBean evaluateBean) {
        try {
            return  evaluateDao.findteacherEvaluateStudent(evaluateBean);
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }
    public void studentMessage(EvaluateBean evaluateBean) {
        try{
            evaluateDao.studentMessage(evaluateBean);
        }catch (Exception e){
            throw new RuntimeException(e);

        }
    }

    public List<EvaluateBean> find_studentMessage(String e_studentid) {
        try{
            System.out.println("222222");
            return evaluateDao.find_studentMessage(e_studentid);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
