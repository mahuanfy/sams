package com.eu.sams.service.impl;

import com.eu.sams.dao.ITeacherDao;
import com.eu.sams.dao.impl.TeacherDao;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.service.IAdminService;
import com.eu.sams.service.ITeacherService;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/13.
 */
public class TeacherService implements ITeacherService {
ITeacherDao teacherDao =new TeacherDao();
    public List<TeacherBean> teacherInfo(String t_teacherid) {
        try{
            return teacherDao.teacherInfo(t_teacherid);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
