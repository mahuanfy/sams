package com.eu.sams.service;

import com.eu.sams.entity.ScoreBean;
import com.eu.sams.entity.StudentBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/6/6.
 */
public interface IScoreService {
    /**
     * 查找学生成绩
     */
    List<ScoreBean> score ();
    /**
     *根据学生学号查询成绩
     */
    List<ScoreBean> idscore(String s_studentid);

    /**
     * 根据id查找学生成绩信息
     */
    List<ScoreBean> idFindscore(int sc_id);
    /**
     * 根据学生学号保存学生数据
     */
    void saveById(ScoreBean scoreBean);

    /**
     * 根据学生学号id删除学生成绩
     */
    void sc_idDelete(int sc_id);  /**
     * 添加学生成绩
     */
    void addStudentResult(ScoreBean scoreBean);

}
