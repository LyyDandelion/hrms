package jssvc.hrms.service;

import jssvc.hrms.model.Settlement;
import jssvc.hrms.model.SettlementVo;
import jssvc.hrms.model.filter.SettlementSearchFilter;

import java.util.List;

public interface SettlementService {
    List<SettlementVo> getDatas(SettlementSearchFilter filter);

    int getSettlementCount(SettlementSearchFilter filter);

    void addSettlement(Settlement settlement);

    int getImportDataByDah(String dah);

    Settlement getSettlement(String dah);

    void updateSettlement(Settlement settlement);

    List<Settlement> getSettlementByChoice(SettlementSearchFilter filter);
}
