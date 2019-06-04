package jssvc.hrms.service;

import jssvc.hrms.model.TotalSheetVo;
import jssvc.hrms.model.filter.SettlementSearchFilter;

import java.util.List;

public interface TotalSheetService {
    List<TotalSheetVo> getDatas(SettlementSearchFilter filter);

    List<TotalSheetVo> getTotalSheetByMonthDept(SettlementSearchFilter filter);
}
