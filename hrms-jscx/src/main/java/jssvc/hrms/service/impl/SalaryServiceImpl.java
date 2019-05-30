package jssvc.hrms.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.dao.ConstantMapper;
import jssvc.base.exception.BusinessException;
import jssvc.base.model.Constant;
import jssvc.hrms.dao.SalaryMapper;
import jssvc.hrms.model.Salary;
import jssvc.hrms.model.SalaryVo;
import jssvc.hrms.model.filter.SalarySearchFilter;
import jssvc.hrms.service.SalaryService;
import jssvc.user.dao.UserMapper;
import jssvc.user.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service("salaryService")
public class SalaryServiceImpl implements SalaryService {

    @Autowired
    private SalaryMapper salaryDao;
    @Autowired
    private UserMapper userDao;
    @Autowired
    private ConstantMapper constantDao;

    private static Logger logger = LoggerFactory.getLogger(SalaryServiceImpl.class);

    @Override
    public List<SalaryVo> getSalaries(SalarySearchFilter filter) throws SQLException {
        String pah=salaryDao.selectByLoginPah(filter);
        List<Salary> salaries=new ArrayList<Salary>();
        if(pah==null||pah.equals("")){
            salaries = salaryDao.selectSalaries(filter);
        }else{
            salaries = salaryDao.selectSalariesByAdmin(filter);
        }
        List<SalaryVo> salaryVos = new ArrayList<>();
        SalaryVo salaryVo;
        for(int i=0; i<salaries.size(); i++){
            Salary s = salaries.get(i);
            salaryVo = new SalaryVo();
            BeanUtils.copyProperties(s, salaryVo);
            //TODO 填充一些Vo特殊的属性

            // 取得姓名
            User u = userDao.selectByPrimaryKey(s.getDah());
            salaryVo.setName(u.getYgxm());
            Constant constant=new Constant();
            // 取得岗位列表
            List<Constant> gwList = constantDao.selectByType(ConstantKey.KEY_POSITION);
            for(int k=0;k<gwList.size();k++)
            {
                if(s.getPostLevel().intValue()==Integer.parseInt(gwList.get(k).getEnKey()))
                {
                    constant = gwList.get(k);
                }
            }
            salaryVo.setPost(constant.getName());

            salaryVos.add(salaryVo);
        }
        return salaryVos;
    }


    public SalaryVo getSalary(String dah)  {
        List<Salary> list = salaryDao.selectByDah(dah);
        if(list.size()>0) {
            Salary s = list.get(0);
            SalaryVo salaryVo = new SalaryVo();
            BeanUtils.copyProperties(s, salaryVo);

            List<Constant> gwList = constantDao.selectByType(ConstantKey.KEY_POSITION);
            Constant constant = gwList.get(s.getPostLevel().intValue()-1);
            salaryVo.setPost(constant.getName());
            return salaryVo;
        }
        else
            return null;
    }

    @Override
    public List<String> getUsersByChoice(SalarySearchFilter filter) {
        return salaryDao.selectSalariesByChoice(filter);
    }

    @Override
    public int getUsersCountByChoice(SalarySearchFilter filter) {
        return salaryDao.selectSalariesCountByChoice(filter);
    }

    @Override
    public int getSalariesCount(SalarySearchFilter filter) throws SQLException {
        int salariesCount = salaryDao.selectSalariesCount(filter);
        return salariesCount;
    }

    @Override
    @Transactional
    public int createSalary(Salary salary) throws BusinessException {
        int result = 0;
        try {
            result = salaryDao.insert(salary);
        } catch (RuntimeException e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            throw new BusinessException(ConstantMessage.ERR00010, e);
        }
        return result;
    }

    @Override
    public boolean updateSalary(Salary salary) throws BusinessException {
        return salaryDao.updateByDah(salary);
    }

    public Salary getSalary(Integer id) {
        Salary s = salaryDao.selectByPrimaryKey(id);
        return s;
    }
}
