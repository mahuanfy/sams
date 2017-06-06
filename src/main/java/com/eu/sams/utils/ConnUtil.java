package com.eu.sams.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.junit.Test;

import java.sql.*;

/**
 * Created by 马欢欢 on 2017/6/5.
 */
public class ConnUtil{
    @Test
    public static Connection getConnextion()  {
        PreparedStatement pstmt;
        //创建连接池核心工具类
        //自动加载根目录下面的c3p0配置文件【c3p0-config.xml】
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        //从连接池对象中获取连接对象
        Connection conn=null;
        try {
            conn = dataSource.getConnection();
            if(null!=conn){//判断是否连接成功！
                System.out.println("恭喜！数据库连接成功！");
            }
        } catch (SQLException e) {
            System.out.println("很遗憾！数据库连接失败！");
            e.printStackTrace();
        }
        return conn;

    }

//关闭连接1
    public static void close(Statement stmt, Connection conn){
        if(null!=stmt){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }if(null!=conn){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.print("关闭成功");
    }

    //关闭连接2
    public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if (null!=rs){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }if (null!=pstmt){
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }if (null!=conn){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}