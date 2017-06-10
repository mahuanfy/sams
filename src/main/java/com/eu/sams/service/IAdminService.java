package com.eu.sams.service;

import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/10.
 */
public interface IAdminService {
    /**
     * 查询所有老师的信息
     */
    List<TeacherBean> findTeacherInfo();
    /**
     *添加老师信息
     */
    void insertTeacher(TeacherBean teacherBean);
    /**
     * 删除老师信息
     */
    void deleteTeacher(int t_id);
    /**
     * 更新老师信息
     */
    void updataTeacher(TeacherBean teacherBean);
    /**
     * 通过老师id查找老师信息
     */
    List<TeacherBean> findTeacherToId(int t_id);

    /**
     * 查看学生信息
     */
    List<StudentBean> Admin_StudentInfo();

    /**
     * 添加学生信息
     */
    void Admin_addInfo(StudentBean studentBean);
    /**
     * 删除学生信息
     * */
    void Admin_deleteInfo(int s_id);
    /**
     * 编辑学生信息
     * */
    void Admin_updateInfo(StudentBean studentBean);
    /**
     * 根据s_id查找学生信息
     * */
    List<StudentBean> findStudentToId(int s_id);
}
