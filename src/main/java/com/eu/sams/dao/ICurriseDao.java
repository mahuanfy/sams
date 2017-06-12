package com.eu.sams.dao;

import com.eu.sams.entity.CurriseBean;

import java.util.List;

/**
 * Created by pc on 2017/6/12.
 */
public interface ICurriseDao {
    /**
     * 查找课程
     * */
    List<CurriseBean> currise_find();
    /**
     * 增加课程
     * */
    void currise_insert(CurriseBean curriseBean);
    /**
     * 删除课程
     * */
    void currise_delete(int c_id);
    /**
     * 修改课程
     * */
    void  currise_update(CurriseBean curriseBean);
    /**
     * 通过id查找课程
     * */
    List<CurriseBean> currise_idfind(int c_id);
}
