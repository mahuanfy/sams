package com.eu.sams.service.impl;

import com.eu.sams.dao.ICurriseDao;
import com.eu.sams.dao.impl.CurriseDao;
import com.eu.sams.entity.CurriseBean;
import com.eu.sams.service.ICurriseService;

import java.util.List;

/**
 * Created by pc on 2017/6/12.
 */
public class CurriseService implements ICurriseService {
    ICurriseDao curriseDao=new CurriseDao();

    public List<CurriseBean> currise_find() {
        try {
            return curriseDao.currise_find();
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void currise_insert(CurriseBean curriseBean) {
        try {
            curriseDao.currise_insert(curriseBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void currise_delete(int c_id) {
        try {
            curriseDao.currise_delete(c_id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public void currise_update(CurriseBean curriseBean) {
        try {
            curriseDao.currise_update(curriseBean);
            System.out.println(22);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public List<CurriseBean> currise_idfind(int c_id) {
        try {
            return curriseDao.currise_idfind(c_id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }

    }
}
