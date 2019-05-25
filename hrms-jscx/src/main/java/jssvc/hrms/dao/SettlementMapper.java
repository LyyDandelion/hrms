package jssvc.hrms.dao;

import jssvc.hrms.model.Settlement;
import jssvc.hrms.model.filter.SettlementSearchFilter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SettlementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Settlement record);

    int insertSelective(Settlement record);

    Settlement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Settlement record);

    int updateByPrimaryKey(Settlement record);

    List<Settlement> selectSettlement(SettlementSearchFilter filter);

    double selectPost(String dah);

    int selectSettlementCount(SettlementSearchFilter filter);

    int selectByDah(String dah);

    Settlement getSettlement(String dah);
    int updateByDah(Settlement record);

    List<String> selectSettlementByChoice(SettlementSearchFilter filter);

    List<Settlement> querySettlement(SettlementSearchFilter filter);

    String queryDeptInfo(@Param("dah") String dah);
}