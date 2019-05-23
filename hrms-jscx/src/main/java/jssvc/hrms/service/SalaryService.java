package jssvc.hrms.service;

import jssvc.base.exception.BusinessException;
import jssvc.hrms.model.Salary;
import jssvc.hrms.model.SalaryVo;
import jssvc.hrms.model.filter.SalarySearchFilter;
import jssvc.user.model.*;
import jssvc.user.model.filter.UserSearchFilter;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 薪酬相关的服务
 * @Author: redcomet
 * @Date: 2019-03-25-14:34
 */

public interface SalaryService {

    List<SalaryVo> getSalaries(SalarySearchFilter filter) throws SQLException;

    int getSalariesCount(SalarySearchFilter filter) throws SQLException;

    int createSalary(Salary salary) throws BusinessException;

    boolean updateSalary(Salary salary) throws BusinessException;

    SalaryVo getSalary(String dah);

}
