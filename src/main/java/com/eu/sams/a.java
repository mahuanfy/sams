package com.eu.sams;


import com.eu.sams.entity.CurriseBean;
import com.eu.sams.utils.BaseDaoutil;
import org.junit.Test;

import java.util.*;
import java.sql.SQLException;

/**
 * Created by 马欢欢 on 2017/6/5.
 */
public class a extends BaseDaoutil{
    @Test
    public void testXml() throws SQLException {
        String sql =" select * from currise where c_id =?";
        Object [] pra = {1};
       List<CurriseBean> list =  super.query(sql,pra,CurriseBean.class);
        System.out.println(list.get(0).getC_name());
    }
}
