package com.eu.sams.dao.impl;

import com.eu.sams.dao.ICurriseDao;
import com.eu.sams.entity.CurriseBean;
import com.eu.sams.utils.BaseDaoutil;

import java.util.List;

/**
 * Created by pc on 2017/6/12.
 */
public class CurriseDao extends BaseDaoutil implements ICurriseDao {

    public List<CurriseBean> currise_find() {
        String sql="SELECT * FROM currise;";
        List<CurriseBean> curriseBeans=super.query(sql,null,CurriseBean.class);
        return curriseBeans!=null&&curriseBeans.size()>0?curriseBeans:null;
    }

    public void currise_insert(CurriseBean curriseBean) {
        String sql="INSERT INTO currise (c_name) VALUES (?);";
        Object []num={ curriseBean.getC_name()};
        super.update(sql,num);
    }

    public void currise_delete(int c_id) {
        String sql="DELETE FROM currise WHERE c_id=?";
        Object [] num={c_id};
        super.update(sql,num);
    }

    public void currise_update(CurriseBean curriseBean) {
        String sql="UPDATE currise SET c_name=? WHERE c_id=?";
        Object []num={ curriseBean.getC_name(),curriseBean.getC_id()};
        System.out.println(333);
        super.update(sql,num);

    }

    public List<CurriseBean> currise_idfind(int c_id) {
        String sql="SELECT * FROM currise where c_id=?";
        Object [] num={c_id};
        List<CurriseBean> curriseBeans=super.query(sql,num,CurriseBean.class);
        return curriseBeans!=null&&curriseBeans.size()>0?curriseBeans:null;
    }
}
