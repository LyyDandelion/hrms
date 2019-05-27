package jssvc.base.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.dao.ConstantMapper;
import jssvc.base.model.Constant;
import jssvc.base.model.filter.PositionSearchFilter;
import jssvc.base.service.PositionService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl  implements PositionService {

    @Autowired
    ConstantMapper constantMapper;

    @Override
    public List<Constant> getDatas(PositionSearchFilter filter) {
        List<Constant> list=constantMapper.selectPosition(filter);
        return list;
    }

    @Override
    public long getCount(PositionSearchFilter filter) {
        return (long) constantMapper.selectPositionCount(filter);
    }

    @Override
    public Constant getPosition(String enKey) {
        if(!StringUtils.isNotBlank(enKey))
            return null;
        return constantMapper.getPositionByEnKey(enKey);
    }

    @Override
    public void addPosition(Constant condition) {
        condition.setType(ConstantKey.POSITION);
        constantMapper.insert(condition);
    }

    @Override
    public void updateDate(Constant condition) {
        condition.setType(ConstantKey.POSITION);
        constantMapper.updateNameByTypeAndEnKey(condition);
    }

    @Override
    public int getRecordByEnKey(String enKey) {
        return constantMapper.selectIsExist(enKey);
    }
}
