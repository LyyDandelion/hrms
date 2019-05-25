package jssvc.hrms.controller;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.controller.BaseController;
import jssvc.base.exception.BusinessException;
import jssvc.base.util.DateUtil;
import jssvc.base.util.JSON;
import jssvc.hrms.model.Salary;
import jssvc.hrms.model.SalaryVo;
import jssvc.hrms.model.SettlementVo;
import jssvc.hrms.model.filter.SalarySearchFilter;
import jssvc.hrms.model.filter.SettlementSearchFilter;
import jssvc.hrms.service.SalaryService;
import jssvc.hrms.service.SettlementService;
import jssvc.hrms.utlis.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class SalaryController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(SalaryController.class);


    @Autowired
    protected SalaryService salaryService;
    @Autowired
    protected SettlementService settlementService;
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
        } catch (SQLException e) {
            throw new BusinessException(ConstantMessage.ERR00003, e);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    /**
     * 工資查詢報表
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("salaryStatements.do")
    private ModelAndView salaryStatements(String id) {
        // 跳转到工资报表查询
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/salaryStatements");
        mv.addObject(ConstantKey.KEY_MENU_ID, id);
        return mv;
    }

    /**
     * 工资条查询
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("salarySheetQuery.do")
    private ModelAndView salarySheetQuery(String id) {
        // 跳轉到工資報表
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/salarySheet");
        mv.addObject(ConstantKey.KEY_MENU_ID, id);
        return mv;
    }
    /**
     * 工资报表查询
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/getsalaryList.do")
    private void getSalaryList(SalarySearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<SalaryVo> userVos = salaryService.getSalaries(filter);
            // 取得用户总件数
            long count = salaryService.getSalariesCount(filter);
            logger.info("工资报表数据："+ count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, userVos);
            hashmap.put(ConstantKey.KEY_TOTAL, count);
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
     * 工资报表导出本地，默认是桌面
     * @param all
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/printStament.do")
    private String printStament(String all) throws BusinessException {
        SalarySearchFilter salarySearchFilter=new SalarySearchFilter();
        try {
            // 取得用户列表
            List<SalaryVo> userVos = salaryService.getSalaries(salarySearchFilter);
            //excel标题
            String[] title = {"序号","工号","岗位","岗位工资","工龄工资","浮动工资","绩效奖金","通讯补贴","交通补贴","用餐补贴","社保"};
            //excel文件名
            String fileName = "员工工资报表"+ DateUtil.getChinaDateString(new Date()) +".xls";
            //sheet名
            String sheetName = "工资报表";
            String[][] content = new String[title.length][11];
            for (int i = 0; i < userVos.size(); i++) {
                SalaryVo salaryVo=userVos.get(i);
                content[i][0] =String.valueOf(i+1);
                content[i][1] =salaryVo.getDah();
                content[i][2] =salaryVo.getName();
                content[i][3] =salaryVo.getPost();
                content[i][4] =String.valueOf(salaryVo.getPostSalary());
                content[i][5] =String.valueOf(salaryVo.getFloatSalary());
                content[i][6] =String.valueOf(salaryVo.getAward());
                content[i][7] =String.valueOf(salaryVo.getTelAllowrance());
                content[i][8] =String.valueOf(salaryVo.getTrafficAllowrance());
                content[i][9] =String.valueOf(salaryVo.getLunchAllowrance());
                content[i][10] =String.valueOf(salaryVo.getInsurance());
            }
            //创建HSSFWorkbook
            HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
            File file=new File("C:\\Users\\Administrator\\Desktop\\");
            OutputStream stream=new FileOutputStream(new File(file, fileName));
            wb.write(stream);
            stream.close();
            // 取得用户总件数
        } catch (SQLException e) {
            throw new BusinessException(ConstantMessage.ERR00003, e);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }
    /**
     * 工资报表查询
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/getSalarySheetList.do")
    private void getSalarySheetList(SettlementSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得工资列表
            List<SettlementVo> settlementVos = settlementService.getDatas(filter);
            // 取得用户总件数
            long count = settlementService.getSettlementCount(filter);
            logger.info("工资条报表数据："+ count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, settlementVos);
            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }
    /**
     * 工资条导出本地，默认是桌面
     * @param all
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/printSalarySheet.do")
    private String printSalarySheet(String all) throws BusinessException {
        SettlementSearchFilter settlementSearchFilter=new SettlementSearchFilter();
        try {
            // 取得工资列表
            List<SettlementVo> settlementVos = settlementService.getDatas(settlementSearchFilter);
            //excel文件名
            String fileName = "员工工资条"+ DateUtil.getChinaDateString(new Date()) +".xls";
            //sheet名
            String sheetName = "工资条";
            String[][] content = new String[12][12];
            for (int i = 0; i < settlementVos.size(); i++) {
                SettlementVo settlementVo=settlementVos.get(i);
                content[i][0] =String.valueOf(i+1);
                content[i][1] =settlementVo.getDah();
                content[i][2] =settlementVo.getName();
                content[i][3] =String.valueOf(settlementVo.getBase());
                content[i][4] =String.valueOf(settlementVo.getOvertimeSalary());
                content[i][5] =String.valueOf(settlementVo.getCompassionateDeduction());
                content[i][6] =String.valueOf(settlementVo.getLateDeduction());
                content[i][7] =String.valueOf(settlementVo.getSickDeduction());
                content[i][8] =String.valueOf(settlementVo.getOwnerEndowmentInsurance());
                content[i][9] =String.valueOf(settlementVo.getOwnerMedicalInsurance());
                content[i][10] =String.valueOf(settlementVo.getOwnerAccumulationFund());
                content[i][11] =String.valueOf(settlementVo.getRealWages());
            }
            //创建HSSFWorkbook
            HSSFWorkbook wb = ExcelUtil.getHSSFWorkbookForSalary(sheetName, content, null);
            File file=new File("C:\\Users\\Administrator\\Desktop\\");
            OutputStream stream=new FileOutputStream(new File(file, fileName));
            wb.write(stream);
            stream.close();
            // 取得用户总件数
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }


    @ResponseBody
    @RequestMapping("ajax/salary_updateSalary.do")
    private void updateSalary(Salary condition) throws BusinessException {
        try {
            condition.setFlag("1");

            salaryService.updateSalary(condition);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e)
        {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e)
        {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    /***
     * 获取用户工号，且去除已经导入的
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/salary_getDahsBychoice.do")
    private void getDahsBychoice(SalarySearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 取得用户列表
            List<Salary> salaryList=new ArrayList<>();
            List<String> list = salaryService.getUsersByChoice(filter);
            for (String dah:list) {
                Salary s=new Salary();
                s.setDah(dah);
                salaryList.add(s);
            }
            // 取得用户总件数
            int count = salaryService.getUsersCountByChoice(filter);
            logger.info("用户的总数是："+ count);

            //筛选
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, salaryList);
            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        }
        catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }
    /**
     * 工资统计报表
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("salaryStatistics.do")
    private ModelAndView salaryStatistics(String id) {
        // 跳转到工资统计报表
        ModelAndView mv = new ModelAndView();
        mv.setViewName("hrms/salaryStatistics");
        mv.addObject(ConstantKey.KEY_MENU_ID, id);
        return mv;
    }
    /**
     * 工资统计报表查询
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/getSalaryStatistics.do")
    private void getSalaryStatistics(SettlementSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 工资详情
            List<SettlementVo> settlementVos = settlementService.qurerySettlement(filter);
            // 取得用户总件数
            long count = settlementService.getSettlementCount(filter);
            logger.info("工资统计报表数据："+ count);
            HashMap<String, Object> hashmap = new HashMap<String, Object>();
            hashmap.put(ConstantKey.KEY_DATA, settlementVos);
            hashmap.put(ConstantKey.KEY_TOTAL, count);
            String json = JSON.Encode(hashmap);
            response.getWriter().write(json);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }
    /**
     * 工资统计报表导出
     * @param filter
     * @throws BusinessException
     */
    @ResponseBody
    @RequestMapping("ajax/getSalaryStatisticsPrint.do")
    private String getSalaryStatisticsPrint(SettlementSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            // 工资详情
            List<SettlementVo> settlementVos = settlementService.qurerySettlement(filter);
            //excel标题
            String[] title = {"序号","工号","部门","姓名","基本工资","加班工资","事假扣款","迟到扣款","病假扣款","养老保险","医疗保险","公积金","实发工资"};
            //excel文件名
            String fileName = "工资统计报表"+ DateUtil.getChinaDateString(new Date()) +".xls";
            //sheet名
            String sheetName = "工资统计报表";
            String[][] content = new String[title.length][13];
            for (int i = 0; i < settlementVos.size(); i++) {
                SettlementVo salaryVo=settlementVos.get(i);
                content[i][0] =String.valueOf(i+1);
                content[i][1] =salaryVo.getDah();
                content[i][2] =salaryVo.getJgmc();
                content[i][3] =salaryVo.getName();
                content[i][4] =String.valueOf(salaryVo.getBase());
                content[i][5] =String.valueOf(salaryVo.getOvertimeSalary());
                content[i][6] =String.valueOf(salaryVo.getCompassionateDeduction());
                content[i][7] =String.valueOf(salaryVo.getLateDeduction());
                content[i][8] =String.valueOf(salaryVo.getSickDeduction());
                content[i][9] =String.valueOf(salaryVo.getOwnerEndowmentInsurance());
                content[i][10] =String.valueOf(salaryVo.getOwnerMedicalInsurance());
                content[i][11] =String.valueOf(salaryVo.getOwnerAccumulationFund());
                content[i][12] =String.valueOf(salaryVo.getRealWages());
            }
            //创建HSSFWorkbook
            HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
            File file=new File("C:\\Users\\Administrator\\Desktop\\");
            OutputStream stream=new FileOutputStream(new File(file, fileName));
            wb.write(stream);
            stream.close();
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
        return "success";
    }
}
