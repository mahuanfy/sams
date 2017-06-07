package com.eu.sams.service.impl;

import com.eu.sams.dao.IStudentDao;
import com.eu.sams.dao.impl.StudentDao;
import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.service.IStudentService;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public class StudentService implements IStudentService {
    IStudentDao studentDao = new StudentDao();
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
}
