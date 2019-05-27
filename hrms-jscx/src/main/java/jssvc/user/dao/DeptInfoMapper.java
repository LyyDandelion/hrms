package jssvc.user.dao;

import jssvc.hrms.model.filter.SettlementSearchFilter;
import jssvc.user.model.DeptInfo;
import jssvc.user.model.DeptUser;
import jssvc.user.model.DeptUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptInfoMapper {
    int countByExample(DeptUserExample example);

    int deleteByExample(DeptUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(DeptUser record);

    List<DeptUser> selectByExample(DeptUserExample example);

    DeptUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DeptUser record, @Param("example") DeptUserExample example);

    int updateByExample(@Param("record") DeptUser record, @Param("example") DeptUserExample example);

    int updateByPrimaryKeySelective(DeptUser record);

    int updateByPrimaryKey(DeptUser record);

    int insert(DeptUser record);

    int deleteByDah(String dah);

    //查询全部
    List<DeptInfo> selectAll(SettlementSearchFilter filter);
    //根据部门号查询
    List<DeptInfo> selectDeptInfoByDeptName(@Param("jgmc") String jgmc);
    //根据部门编号查询,返回部门名
    String  selectDeptInfoByDeptId(@Param("jgh") String jgh);
}