package jssvc.hrms.controller;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.controller.BaseController;
import jssvc.base.exception.BusinessException;
import jssvc.base.util.JSON;
import jssvc.hrms.model.Salary;
import jssvc.hrms.model.SalaryVo;
import jssvc.hrms.model.filter.SalarySearchFilter;
import jssvc.hrms.service.SalaryService;
import jssvc.user.model.UserVo;
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
public class SalaryController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(SalaryController.class);


    @Autowired
    protected SalaryService salaryService;

    /**
     * 展示薪酬页面
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("showSalaryList.do")
    private ModelAndView showSalaryList(String id) {
        // 跳转到用户管理页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/salaryList");
        mv.addObject(ConstantKey.KEY_MENU_ID, id);
        return mv;
    }

    @ResponseBody
    @RequestMapping("showSalaryUpdPop.do")
    private ModelAndView showSalaryUpdPop() {
        // 跳转到用户更新页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/salaryUpdPop");
        return mv;
    }

    @ResponseBody
    @RequestMapping("ajax/salary_addSalary.do")
    private void addSalary(Salary salary) throws BusinessException {
        try {
            // 新增用户
            if (salaryService.getSalary(salary.getDah()) != null) {
                response.getWriter().write(ConstantKey.FAIL);
            } else {
                salary.setFlag("1");
                salaryService.createSalary(salary);
                response.getWriter().write(ConstantKey.SUCCESS);
            }
        }  catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    @ResponseBody
    @RequestMapping("ajax/salary_getSalary.do")
    private void getSalary(String dah) throws BusinessException {
        try {
            Salary salary = salaryService.getSalary(dah);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put("salary", salary);
            hashmap.put("level", salary.getPostLevel());
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        }  catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    /**
     * 获取工资资金列表
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/salary_getSalaries.do")
    private void getSalaries(SalarySearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<SalaryVo> userVos = salaryService.getSalaries(filter);
            // 取得用户总件数
            long count = salaryService.getSalariesCount(filter);
            logger.info("工资基金的总数是："+ count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, userVos);
            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        }
        catch (SQLException e) {
            throw new BusinessException(ConstantMessage.ERR00003, e);
        }
        catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }
}
