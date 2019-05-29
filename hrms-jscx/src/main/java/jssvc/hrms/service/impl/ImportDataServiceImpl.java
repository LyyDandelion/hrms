package jssvc.hrms.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.dao.ConstantMapper;
import jssvc.base.model.Constant;
import jssvc.hrms.dao.ImportDataMapper;
import jssvc.hrms.dao.SalaryMapper;
import jssvc.hrms.model.ImportData;
import jssvc.hrms.model.ImportDataVo;
import jssvc.hrms.model.Salary;
import jssvc.hrms.model.filter.ImportDataSearchFilter;
import jssvc.hrms.service.ImportDataService;
import jssvc.user.dao.UserMapper;
import jssvc.user.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ImportDataServiceImpl implements ImportDataService {

    @Autowired
    ImportDataMapper importDataMapper;
    @Autowired
    SalaryMapper salaryMapper;
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

            List<Salary> salaryList=salaryMapper.selectByDah(s.getDah());
            if(salaryList.size()<1)
            {
                return null;
            }
            Constant constant=new Constant();
            // 取得岗位列表
            List<Constant> gwList = constantDao.selectByType(ConstantKey.KEY_POSITION);
            for(int k=0;k<gwList.size();k++)
            {
                if(salaryList.get(0).getPostLevel().intValue()==Integer.parseInt(gwList.get(k).getEnKey()))
                {
                    constant = gwList.get(k);
                }
            }
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

    @Override
    public ImportData getImportData(String dah, String month) {
        Map map =new HashMap<>();
        map.put("dah",dah);
        map.put("month",month);
        return importDataMapper.selectImportDataForMap(map);
    }

    @Override
    public void updateDate(ImportData condition) {
        importDataMapper.updateByDah(condition);
    }

    @Override
    public int getImportDataByDah(String dah, String month) {
        Map map =new HashMap<>();
        map.put("dah",dah);
        map.put("month",month);
        return importDataMapper.selectByMap(map);
    }

}
