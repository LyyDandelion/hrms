package jssvc.base.service;

import jssvc.base.model.filter.ConfigSearchFilter;
import jssvc.hrms.model.SalaryConfig;

import java.util.List;

public interface SalaryConfigService {
    List<SalaryConfig> getDatas(ConfigSearchFilter filter);

    int getCount(ConfigSearchFilter filter);

    void addCondition(SalaryConfig condition);

    SalaryConfig getConfig(String enKey);

    int getRecordByEnKey(String enKey);

    void updateDate(SalaryConfig condition);
}
