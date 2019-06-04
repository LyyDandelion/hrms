package jssvc.hrms.service.impl;

import jssvc.hrms.dao.SettlementMapper;
import jssvc.hrms.model.TotalSheetVo;
import jssvc.hrms.model.filter.SettlementSearchFilter;
import jssvc.hrms.service.TotalSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TotalSheetServiceImpl implements TotalSheetService {

    @Autowired
    SettlementMapper settlementMapper;
    @Override
    public List<TotalSheetVo> getDatas(SettlementSearchFilter filter) {
        return settlementMapper.getTotalSheet(filter);
    }

    @Override
    public List<TotalSheetVo> getTotalSheetByMonthDept(SettlementSearchFilter filter) {
        return settlementMapper.getTotalSheetByMonthDept(filter);
    }
}
