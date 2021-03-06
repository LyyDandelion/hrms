package jssvc.base.dao;

import java.util.List;
import jssvc.base.model.Constant;
import jssvc.base.model.ConstantExample;
import jssvc.base.model.filter.PositionSearchFilter;
import org.apache.ibatis.annotations.Param;

public interface ConstantMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Constant record);

    int insertSelective(Constant record);

    Constant selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Constant record);

    int updateByPrimaryKey(Constant record);

    List<Constant> selectByType(String type);

    String selectValueByTypeAndKey(String type, String enKey);

    String selectValueByTypeAndName(String type, String name);

    int updateNameByTypeAndEnKey(Constant record);

    List<Constant> selectPosition(PositionSearchFilter filter);

    int selectPositionCount(PositionSearchFilter filter);

    Constant getPositionByEnKey(String enKey);

    int selectIsExist(String enKey);
}