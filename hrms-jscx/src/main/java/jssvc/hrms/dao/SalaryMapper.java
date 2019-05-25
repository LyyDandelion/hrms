package jssvc.hrms.dao;

import jssvc.hrms.model.Salary;
import jssvc.hrms.model.filter.SalarySearchFilter;

import java.util.List;

public interface SalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Salary record);

    int insertSelective(Salary record);

    Salary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Salary record);

    int updateByPrimaryKey(Salary record);

    List<Salary> selectSalaries(SalarySearchFilter filter);

    int selectSalariesCount(SalarySearchFilter filter);

    List<Salary> selectByDah(String dah);

    boolean updateByDah(Salary salary);

    List<String> selectSalariesByChoice(SalarySearchFilter filter);

    int selectSalariesCountByChoice(SalarySearchFilter filter);
}