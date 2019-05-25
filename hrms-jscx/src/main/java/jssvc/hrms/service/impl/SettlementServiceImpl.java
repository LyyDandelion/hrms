package jssvc.hrms.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.dao.ConstantMapper;
import jssvc.base.model.Constant;
import jssvc.hrms.dao.SettlementMapper;
import jssvc.hrms.model.Settlement;
import jssvc.hrms.model.SettlementVo;
import jssvc.hrms.model.filter.SettlementSearchFilter;
import jssvc.hrms.service.SettlementService;
import jssvc.user.dao.UserMapper;
import jssvc.user.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SettlementServiceImpl implements SettlementService {

    @Autowired
    SettlementMapper settlementMapper;
    @Autowired
    private UserMapper userDao;

    @Autowired
    private ConstantMapper constantDao;

    @Override
    public List<SettlementVo> getDatas(SettlementSearchFilter filter) {
        List<Settlement> Settlements = settlementMapper.selectSettlement(filter);
        List<SettlementVo> SettlementVoList = new ArrayList<>();
        SettlementVo SettlementVo;
        for (int i = 0; i < Settlements.size(); i++) {
            Settlement s = Settlements.get(i);
            SettlementVo = new SettlementVo();
            BeanUtils.copyProperties(s, SettlementVo);
            //TODO 填充一些Vo特殊的属性
            // 取得姓名
            User u = userDao.selectByPrimaryKey(s.getDah());
            SettlementVo.setName(u.getYgxm());

            // 取得岗位列表
            List<Constant> gwList = constantDao.selectByType(ConstantKey.KEY_POSITION);
             int   postLevel=(int)settlementMapper.selectPost(u.getDah());
           Constant constant = gwList.get(postLevel);
            SettlementVo.setPost(constant.getName());

            SettlementVoList.add(SettlementVo);
        }
        return SettlementVoList;
    }

    @Override
    public int getSettlementCount(SettlementSearchFilter filter) {
        return settlementMapper.selectSettlementCount(filter);
    }

    @Override
    public void addSettlement(Settlement settlement) {
        settlement.setUpdateDate(new Date());
        settlement.setIsGrant("N");
        settlement.setFlag("1");
        settlementMapper.insertSelective(settlement);
    }

    @Override
    public int getImportDataByDah(String dah) {
        return settlementMapper.selectByDah(dah);
    }

    @Override
    public Settlement getSettlement(String dah) {
        return settlementMapper.getSettlement(dah);
    }

    @Override
    public void updateSettlement(Settlement settlement) {
        settlement.setUpdateDate(new Date());
        settlementMapper.updateByDah(settlement);
    }

    @Override
    public List<Settlement> getSettlementByChoice(SettlementSearchFilter filter) {
        List<String> list=settlementMapper.selectSettlementByChoice(filter);
        List<Settlement> settlementList=new ArrayList<>();
        for (String dah:list) {
            Settlement settlement=new Settlement();
            settlement.setDah(dah);
            settlementList.add(settlement);
        }
        return settlementList;
    }
}
