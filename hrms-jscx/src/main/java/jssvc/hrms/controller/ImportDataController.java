package jssvc.hrms.controller;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.controller.BaseController;
import jssvc.base.exception.BusinessException;
import jssvc.base.util.JSON;
import jssvc.hrms.model.ImportData;
import jssvc.hrms.model.ImportDataVo;
import jssvc.hrms.model.SalaryVo;
import jssvc.hrms.model.filter.ImportDataSearchFilter;
import jssvc.hrms.model.filter.SalarySearchFilter;
import jssvc.hrms.service.ImportDataService;
import jssvc.hrms.service.SalaryService;
import jssvc.user.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@Controller
public class ImportDataController extends BaseController {


    private static Logger logger = LoggerFactory.getLogger(SalaryController.class);

    @Autowired
    ImportDataService importDataService;

    @Autowired
    SalaryService salaryService;

    @ResponseBody
    @RequestMapping("showImportDataList.do")
    private ModelAndView showImportDataList(String id) {
        // 跳转到用户管理页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/hrms/importDataList");
        mv.addObject(ConstantKey.KEY_MENU_ID, id);
        return mv;
    }

    /**
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/importData_getDatas.do")
    private void getDatas(ImportDataSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<ImportDataVo> userVos = importDataService.getDatas(filter);
            // 取得用户总件数
            long count = importDataService.getImportDataCount(filter);
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
    @RequestMapping("showImportDataUpdPop.do")
    private ModelAndView showImportDataUpdPop() {
        // 跳转到用户更新页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/importDataUpdPop");
        return mv;
    }

    /**
     * @description:获取工号列表
     **/
    @ResponseBody
    @RequestMapping("ajax/user_getDahList.do")
    private void getDahList() throws BusinessException {
        try {
            // 取得岗位列表
            List<User> gwList = importDataService.getUserList();
            String json = JSON.Encode(gwList);
            response.getWriter().write(json);
        }
//        catch (SQLException e) {
//            throw new BusinessException(ConstantMessage.ERR00003, e);
//        }
        catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    @ResponseBody
    @RequestMapping("ajax/checkIsExsit.do")
    private void checkIsExsit(String dah,String month) throws BusinessException {
        try {
            // 取得岗位列表
            int count = importDataService.getImportDataByDah(dah,month);
            String json = JSON.Encode(count);
            response.getWriter().write(json);
        }
//        catch (SQLException e) {
//            throw new BusinessException(ConstantMessage.ERR00003, e);
//        }
        catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    @ResponseBody
    @RequestMapping("ajax/import_addImport.do")
    private void addImport(ImportData importData) throws BusinessException {
        try {
            importData.setFlag("1");
            importDataService.addImport(importData);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    @ResponseBody
    @RequestMapping("showImportUpdPop.do")
    private ModelAndView showImportUpdPop() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/importDataUpdPop");
        return mv;
    }


    @ResponseBody
    @RequestMapping("ajax/get_import.do")
    private void getImport(String dah,String month) throws BusinessException {
        try {
            ImportData importData = importDataService.getImportData(dah,month);

            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put("importData", importData);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    @ResponseBody
    @RequestMapping("ajax/user_getUsers_for_import.do")
    private void getUsers(SalarySearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<SalaryVo> userVos = salaryService.getSalaries(filter);
//            // 取得用户总件数
//            long count = userService.getUsersCount(filter);
//            logger.info("用户的总数是："+ count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, userVos);
//            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (SQLException e) {
            throw new BusinessException(ConstantMessage.ERR00003, e);
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
    @RequestMapping("ajax/importData_updateData.do")
    private void updateDate(ImportData condition) throws BusinessException {
        try {
            condition.setFlag("1");
            importDataService.updateDate(condition);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }
}
