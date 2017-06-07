package com.eu.sams.service.impl;

import com.eu.sams.dao.IScoreDao;
import com.eu.sams.dao.impl.ScoreDao;
import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.service.IStudentService;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public class StudentService implements IStudentService {
    IScoreDao studentDao = new ScoreDao();
    public List<ScoreBean> score() {
        try {
            return studentDao.score();
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    public List<StudentBean> studentInfo() {
        return null;
    }

    public List<ScoreBean> idscore(String s_studentid){
        try {
            return studentDao.idscore(s_studentid);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
    public List<ScoreBean> idFindscore(int sc_id) {
        try {
            return studentDao.idFindscore(sc_id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void saveById(ScoreBean scoreBean) {
        try {
           studentDao.saveById(scoreBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
