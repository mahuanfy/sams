package com.eu.sams.dao.impl;

import com.eu.sams.dao.IUserDao;
import com.eu.sams.entity.AdminBean;
import com.eu.sams.entity.StudentBean;
import com.eu.sams.entity.TeacherBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public class UserDao extends BaseDaoutil  implements IUserDao{
    public List<StudentBean> Slogin(StudentBean studentBean) {
        String sql =" SELECT * FROM students WHERE s_studentid=? AND s_password =?; ";
        Object[] num={studentBean.getS_username(),studentBean.getS_password()};
        List <StudentBean> slist =super.query(sql,num,StudentBean.class);
        return  (slist!=null && slist.size()>0 ? slist : null);
    }

    public List<TeacherBean> Tlogin(TeacherBean teacherBean) {
        String sql="SELECT * FROM teacher WHERE t_teacherid=? AND t_password=?;";
        Object[] tea={teacherBean.getT_username(),teacherBean.getT_password()};
        List<TeacherBean> tlist=super.query(sql,tea,TeacherBean.class);
        return (tlist!=null&&tlist.size()>0?tlist:null);
    }

    public List<AdminBean> Alogin(AdminBean adminBean) {
        String sql="SELECT * FROM admin WHERE a_nameid=? AND a_password=?";
        Object[] adm={adminBean.getA_nameid(),adminBean.getA_password()};
        List<AdminBean> alist=super.query(sql,adm,AdminBean.class) ;
        return(alist!=null&&alist.size()>0?alist:null);
    }
}
