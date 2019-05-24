package jssvc.hrms.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.dao.ConstantMapper;
import jssvc.base.model.Constant;
import jssvc.hrms.dao.ImportDataMapper;
import jssvc.hrms.model.ImportData;
import jssvc.hrms.model.ImportDataVo;
import jssvc.hrms.model.filter.ImportDataSearchFilter;
import jssvc.hrms.service.ImportDataService;
import jssvc.user.dao.UserMapper;
import jssvc.user.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ImportDataServiceImpl implements ImportDataService {

    @Autowired
    ImportDataMapper importDataMapper;

    @Autowired
    private UserMapper userDao;
    @Autowired
    private ConstantMapper constantDao;

    @Override
    public List<ImportDataVo> getDatas(ImportDataSearchFilter filter) {
        List<ImportData> importDatas = importDataMapper.selectImportData(filter);
        List<ImportDataVo> importDataVoList = new ArrayList<>();
        ImportDataVo importDataVo;
        for (int i = 0; i < importDatas.size(); i++) {
            ImportData s = importDatas.get(i);
            importDataVo = new ImportDataVo();
            BeanUtils.copyProperties(s, importDataVo);
            //TODO 填充一些Vo特殊的属性
            // 取得姓名
            User u = userDao.selectByPrimaryKey(s.getDah());
            importDataVo.setName(u.getYgxm());

            // 取得岗位列表
            List<Constant> gwList = constantDao.selectByType(ConstantKey.KEY_POSITION);
            Constant constant = gwList.get(importDataMapper.selectPost(u.getDah()));
            importDataVo.setPost(constant.getName());

            importDataVoList.add(importDataVo);
        }
        return importDataVoList;
    }

    @Override
    public int getImportDataCount(ImportDataSearchFilter filter) {
        return importDataMapper.selectImportDataCount(filter);
    }

    @Override
    public List<User> getUserList() {
        return importDataMapper.getUserList();
    }

    @Override
    public int getImportDataByDah(String dah) {
        return importDataMapper.selectByDah(dah);
    }

    @Override
    public void addImport(ImportData importData) {
        importDataMapper.insert(importData);
    }

    @Override
    public ImportData getImportData(String dah) {
        return importDataMapper.selectImportDataForDah(dah);
    }

}
