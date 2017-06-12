package com.eu.sams.dao.impl;

import com.eu.sams.dao.IAdminDao;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/10.
 */
public class AdminDao extends BaseDaoutil implements IAdminDao {
    public List<TeacherBean> findTeacherInfo() {
        String sql = " SELECT * FROM teacher  ";
        List <TeacherBean> teacherBeans =super.query(sql,null,TeacherBean.class);
        return teacherBeans!=null && teacherBeans.size()>0 ? teacherBeans : null;
    }

    public void insertTeacher(TeacherBean teacherBean) {
        String sql = " INSERT INTO teacher(t_teacherid,t_username,t_password,t_sex,t_tipsay)VALUES (?,?,?,?,?); ";
        Object[] num = {teacherBean.getT_teacherid(),teacherBean.getT_username(),teacherBean.getT_password(),teacherBean.getT_sex(),teacherBean.getT_tipsay()};
        super.update(sql,num);
    }

    public void deleteTeacher(int t_id) {
        String sql =" DELETE FROM teacher WHERE t_id=? ";
        Object[]num ={t_id};
        super.update(sql,num);
    }

    public void updataTeacher(TeacherBean teacherBean) {
        String sql =" UPDATE teacher SET t_teacherid=?,t_username=?,t_password=?,t_sex=?,t_tipsay=? where t_id=?";
        Object[] num={teacherBean.getT_teacherid(),teacherBean.getT_username(),teacherBean.getT_password(),teacherBean.getT_sex(),teacherBean.getT_tipsay(),teacherBean.getT_id()};
        super.update(sql,num);
    }

    public List<TeacherBean> findTeacherToId(int t_id) {
        System.out.println(22222);
        String sql="SELECT * FROM teacher WHERE t_id=?";
        Object[] num={t_id};
         List<TeacherBean> teacherBeans = super.query(sql,num,TeacherBean.class);
        System.out.println(222333);
        return teacherBeans!=null && teacherBeans.size()>0 ? teacherBeans : null;

    }
    public List<StudentBean> Admin_StudentInfo() {
        String sql="SELECT * FROM students";
        List<StudentBean> studentBean=super.query(sql,null,StudentBean.class);
        return studentBean!=null && studentBean.size()>0?studentBean:null;
    }

    public void Admin_addInfo(StudentBean studentBean) {
        String sql="INSERT INTO students(s_studentid,s_username,s_password,s_sex,s_class) VALUES (?,?,?,?,?);";
        Object[] num={studentBean.getS_studentid(),studentBean.getS_username(),studentBean.getS_password(),studentBean.getS_sex(),studentBean.getS_class()};
        super.update(sql,num);
    }

    public void Admin_deleteInfo(int s_id) {
        String sql="DELETE  FROM students WHERE s_id=?";
        Object[] num={s_id};
        super.update(sql,num);
    }

    public void Admin_updateInfo(StudentBean studentBean) {
        String sql="UPDATE students SET s_studentid=?,s_username=?,s_password=?,s_sex=?,s_class=? WHERE s_id=?;";
        Object [] num={studentBean.getS_studentid(),
                studentBean.getS_username(),studentBean.getS_password(),studentBean.getS_sex(),
                studentBean.getS_class(),studentBean.getS_id()};
        super.update(sql,num);
    }

    public List<StudentBean> findStudentToId(int s_id) {
        String sql="SELECT * FROM students where s_id=?";
        Object []  num={s_id};
        List <StudentBean> studentBeans=super.query(sql,num,StudentBean.class);
        return studentBeans != null &&studentBeans.size()>0?studentBeans:null;
    }
}
