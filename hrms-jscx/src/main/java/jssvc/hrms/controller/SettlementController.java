package jssvc.hrms.controller;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.controller.BaseController;
import jssvc.base.exception.BusinessException;
import jssvc.base.util.JSON;
import jssvc.hrms.model.ImportData;
import jssvc.hrms.model.SalaryVo;
import jssvc.hrms.model.Settlement;
import jssvc.hrms.model.SettlementVo;
import jssvc.hrms.model.filter.SettlementSearchFilter;
import jssvc.hrms.service.ImportDataService;
import jssvc.hrms.service.SalaryService;
import jssvc.hrms.service.SettlementService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
public class SettlementController extends BaseController {


    private static Logger logger = LoggerFactory.getLogger(SettlementController.class);

    @Autowired
    SettlementService settlementService;

    @Autowired
    SalaryService salaryService;

    @Autowired
    ImportDataService importDataService;

    @ResponseBody
    @RequestMapping("showSettlementList.do")
    private ModelAndView showSettlementList(String id) {
        // 跳转到用户管理页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/hrms/settlementList");
        mv.addObject(ConstantKey.KEY_MENU_ID, id);
        return mv;
    }

    /**
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/settlement_getDatas.do")
    private void getDatas(SettlementSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<SettlementVo> userVos = settlementService.getDatas(filter);
            // 取得用户总件数
            long count = settlementService.getSettlementCount(filter);
            logger.info("导入数据总数是：" + count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, userVos);
            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        }
//        catch (SQLException e) {
//            throw new BusinessException(ConstantMessage.ERR00003, e);
//        }
        catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    @ResponseBody
    @RequestMapping("showSettlementUpdPop.do")
    private ModelAndView showSettlementUpdPop() {
        // 跳转到用户更新页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/settlementUpdPop");
        return mv;
    }

    //

    @ResponseBody
    @RequestMapping("ajax/settlement_addSettlement.do")
    private void addSettlement(ImportData importData) throws BusinessException {
        try {
            //工资结算
            //获取固定工资
            String dah = importData.getDah();
            SalaryVo salaryVo = salaryService.getSalary(dah);

            ImportData newImportData = importDataService.getImportData(dah);
            //设置基本工资
            double base_salary = salaryVo.getPostSalary() + salaryVo.getYearSalary() + salaryVo.getAward() + salaryVo.getTrafficAllowrance() + salaryVo.getTelAllowrance() + salaryVo.getLunchAllowrance();

            Settlement settlement = new Settlement();
            //基本工资
            settlement.setBase(base_salary);
            //计算三险一金
            settlement.setDah(dah);
            settlement.setMonth(importData.getMonth());
            //养老保险
            settlement.setOwnerEndowmentInsurance(base_salary * 0.08);
            settlement.setCompanyEndowmentInsurance(base_salary * 0.08);
            //公积金
            settlement.setOwnerAccumulationFund(base_salary * 0.10);
            settlement.setCompanyAccumulationFund(base_salary * 0.10);
            //医疗保险
            settlement.setOwnerMedicalInsurance(base_salary * 0.10);
            settlement.setCompanyMedicalInsurance(base_salary * 0.10);

            //病假扣款
            settlement.setSickDeduction(newImportData.getSickDays() * 20.0);
            //事假
            settlement.setCompassionateDeduction(newImportData.getCompassionateDays() * 50);
            //迟到
            settlement.setLateDeduction(newImportData.getLateTimes() * 10.0);
            //加班工资
            settlement.setOvertimeSalary(newImportData.getOvertimeDays() * 100.0);

            //计算实发工资
            //实发=基本+加班-病假-事假-迟到-个人养老保险-医疗保险-公积金
            double real = base_salary + settlement.getOvertimeSalary() - settlement.getSickDeduction() - settlement.getCompassionateDeduction() - settlement.getLateDeduction() - settlement.getOwnerEndowmentInsurance() - settlement.getOwnerMedicalInsurance() - settlement.getOwnerAccumulationFund();
            settlement.setRealWages(real);
            settlementService.addSettlement(settlement);
//            importDataService.addImport(importData);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    @ResponseBody
    @RequestMapping("ajax/settlement_checkIsExsit.do")
    private void checkIsExsit(String dah) throws BusinessException {
        try {
            int count = settlementService.getImportDataByDah(dah);
            String json = JSON.Encode(count);
            response.getWriter().write(json);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    //
    @ResponseBody
    @RequestMapping("settlementUpdPop.do")
    private ModelAndView showImportUpdPop() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/settlementUpd");
        return mv;
    }

    @ResponseBody
    @RequestMapping("ajax/get_settlement.do")
    private void getSettlement(String dah) throws BusinessException {
        try {
            Settlement settlement = settlementService.getSettlement(dah);

            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put("settlement", settlement);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    //ajax/settlement_updateSettlement.do
    @ResponseBody
    @RequestMapping("ajax/settlement_updateSettlement.do")
    private void updateSettlement(Settlement settlement) throws BusinessException {
        try {
//            importData.setFlag("1");

            settlementService.updateSettlement(settlement);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    @ResponseBody
    @RequestMapping("ajax/salary_getDahsSettleBychoice.do")
    private void getDahsSettleBychoice(SettlementSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<Settlement> userVos = settlementService.getSettlementByChoice(filter);
            // 取得用户总件数
//            long count = userService.getUsersCount(filter);
//            logger.info("用户的总数是："+ count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, userVos);
//            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


}
