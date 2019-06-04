package jssvc.base.controller;


import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.exception.BusinessException;
import jssvc.base.model.Constant;
import jssvc.base.model.filter.ConfigSearchFilter;
import jssvc.base.service.SalaryConfigService;
import jssvc.base.util.JSON;
import jssvc.hrms.model.SalaryConfig;
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
public class SalaryConfigController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(SalaryConfigController.class);

    @Autowired
    SalaryConfigService salaryConfigService;

    @RequestMapping("/showSalaryConfig.do")
    @ResponseBody
    private ModelAndView showSalaryConfig() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("base/salaryConfig");
        return mv;
    }

    //ajax/config_getConfigs.do
    @ResponseBody
    @RequestMapping("ajax/config_getConfigs.do")
    private void getDatas(ConfigSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            filter.setSortField(ConstantKey.EN_KEY);
            // 取得岗位列表
            filter.setType(ConstantKey.POSITION);

            List<SalaryConfig> userVos = salaryConfigService.getDatas(filter);
            // 取得用户总件数
            int count = salaryConfigService.getCount(filter);
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

    // /showSalaryConfigUpdPop.do
    @ResponseBody
    @RequestMapping("showSalaryConfigUpdPop.do")
    private ModelAndView showUpdPop() {
        // 跳转到更新页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("base/salaryConfigUpdPop");
        return mv;
    }

    //ajax/config_add.do
    @ResponseBody
    @RequestMapping("ajax/config_add.do")
    private void addPosition(SalaryConfig condition) throws BusinessException {
        try {
//            condition.setType("position");
            salaryConfigService.addCondition(condition);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    // ajax/config_get.do
    @ResponseBody
    @RequestMapping("ajax/config_get.do")
    private void getConfig(String enKey) throws BusinessException {
        try {
            SalaryConfig condition = salaryConfigService.getConfig(enKey);

            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put("condition", condition);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    /**
     * 更新
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/config_update.do")
    private void updateData(SalaryConfig condition) throws BusinessException {
        try {
            salaryConfigService.updateDate(condition);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

//    //ajax/configEnKeyIsExsit.do
    @ResponseBody
    @RequestMapping("ajax/configEnKeyIsExsit.do")
    private void checkIsExsit(String enKey) throws BusinessException {
        try {
            // 取得岗位列表
            int count = salaryConfigService.getRecordByEnKey(enKey);
            String json = JSON.Encode(count);
            response.getWriter().write(json);
        }
        catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }
}
