package com.eu.sams.service.impl;

import com.eu.sams.dao.IStudentDao;
import com.eu.sams.dao.impl.StudentDao;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.service.IStudentService;

import java.util.List;

/**
 * Created by 杨璐鹏 on 2017/6/8.
 */
public class StudentService implements IStudentService {
    IStudentDao studentDao=new StudentDao();
    public List<StudentBean> studentInfo(String s_studentid) {
        try{
            return studentDao.studentInfo(s_studentid);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
