package jssvc.base.service;

import jssvc.base.model.Constant;
import jssvc.base.model.filter.PositionSearchFilter;

import java.util.List;

public interface PositionService {
    List<Constant> getDatas(PositionSearchFilter filter);

    long getCount(PositionSearchFilter filter);

    Constant getPosition(String enKey);

    void addPosition(Constant condition);

    void updateDate(Constant condition);

    int getRecordByEnKey(String enKey);
}
