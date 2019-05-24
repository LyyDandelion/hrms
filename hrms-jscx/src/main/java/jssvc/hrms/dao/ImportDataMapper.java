package jssvc.hrms.dao;

import jssvc.hrms.model.ImportData;
import jssvc.hrms.model.Salary;
import jssvc.hrms.model.filter.ImportDataSearchFilter;
import jssvc.user.model.User;

import java.util.List;

public interface ImportDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ImportData record);

    int insertSelective(ImportData record);

    ImportData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ImportData record);

    int updateByPrimaryKey(ImportData record);

    List<ImportData> selectImportData(ImportDataSearchFilter filter);

    int selectImportDataCount(ImportDataSearchFilter filter);
    int selectPost(String dah);

    List<User> getUserList();

    int selectByDah(String dah);

    ImportData selectImportDataForDah(String dah);
}