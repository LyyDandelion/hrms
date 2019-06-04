package jssvc.hrms.dao;

import jssvc.base.model.filter.ConfigSearchFilter;
import jssvc.hrms.model.SalaryConfig;

import java.util.List;

public interface SalaryConfigMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SalaryConfig record);

    int insertSelective(SalaryConfig record);

    SalaryConfig selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SalaryConfig record);

    int updateByPrimaryKey(SalaryConfig record);

    List<SalaryConfig> selectConfig(ConfigSearchFilter filter);

    int selectConfigCount(ConfigSearchFilter filter);

    int getRecordByEnKey(String enKey);
}