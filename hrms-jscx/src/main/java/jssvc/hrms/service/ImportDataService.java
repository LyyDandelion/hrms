package jssvc.hrms.service;

import jssvc.hrms.model.ImportData;
import jssvc.hrms.model.ImportDataVo;
import jssvc.hrms.model.filter.ImportDataSearchFilter;
import jssvc.user.model.User;

import java.util.List;

public interface ImportDataService {
    List<ImportDataVo> getDatas(ImportDataSearchFilter filter);

    int getImportDataCount(ImportDataSearchFilter filter);

    List<User> getUserList();

    int getImportDataByDah(String dah);

    void addImport(ImportData importData);

    ImportData getImportData(String dah);

    void updateDate(ImportData condition);
}
