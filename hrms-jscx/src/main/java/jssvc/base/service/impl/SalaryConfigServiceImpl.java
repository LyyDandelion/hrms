package jssvc.base.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.SystemConstant;
import jssvc.base.dao.ConstantMapper;
import jssvc.base.model.Constant;
import jssvc.base.model.filter.ConfigSearchFilter;
import jssvc.base.service.SalaryConfigService;
import jssvc.hrms.dao.SalaryConfigMapper;
import jssvc.hrms.model.SalaryConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalaryConfigServiceImpl implements SalaryConfigService {

    @Autowired
    SalaryConfigMapper salaryConfigMapper;
    @Autowired
    ConstantMapper constantMapper;

    @Override
    public List<SalaryConfig> getDatas(ConfigSearchFilter filter) {
        List<SalaryConfig> list=salaryConfigMapper.selectConfig(filter);
        return list;
    }

    @Override
    public int getCount(ConfigSearchFilter filter) {
        return salaryConfigMapper.selectConfigCount(filter);
    }

    @Override
    public void addCondition(SalaryConfig condition) {
       Constant constant=constantMapper.getPositionByEnKey(condition.getName());
        condition.setEnKey(constant.getEnKey());
        condition.setName(constant.getName());
        condition.setFlag(ConstantKey.DEFUALT_FLAG);
        condition.setType(ConstantKey.POSITION);
        salaryConfigMapper.insert(condition);
    }

    @Override
    public SalaryConfig getConfig(String enKey) {
        ConfigSearchFilter filter=new ConfigSearchFilter();
        filter.setEnKey(enKey);
        return salaryConfigMapper.selectConfig(filter).get(0);
    }

    @Override
    public int getRecordByEnKey(String enKey) {
        return salaryConfigMapper.getRecordByEnKey(enKey);
    }

    @Override
    public void updateDate(SalaryConfig condition) {
        ConfigSearchFilter filter=new ConfigSearchFilter();
        filter.setEnKey(condition.getEnKey());
        SalaryConfig salaryConfig= salaryConfigMapper.selectConfig(filter).get(0);
        condition.setId(salaryConfig.getId());
        salaryConfigMapper.updateByPrimaryKeySelective(condition);
    }
}
