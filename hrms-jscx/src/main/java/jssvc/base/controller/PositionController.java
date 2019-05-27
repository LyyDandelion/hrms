package jssvc.base.controller;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.constant.SystemConstant;
import jssvc.base.exception.BusinessException;
import jssvc.base.model.Constant;
import jssvc.base.model.filter.PositionSearchFilter;
import jssvc.base.service.PositionService;
import jssvc.base.util.JSON;
import jssvc.hrms.model.ImportData;
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
public class PositionController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(PositionController.class);

    @Autowired
    PositionService positionService;

    @RequestMapping("/showPositionList.do")
    @ResponseBody
    private ModelAndView showPositionList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("base/positionList");
        return mv;
    }

    //ajax/position_getPositions.do
    @ResponseBody
    @RequestMapping("ajax/position_getPositions.do")
    private void getDatas(PositionSearchFilter filter) throws BusinessException {
        try {
            // 用户查询条件
            filter.setOffset();
            filter.setLimit();
            filter.setLoginDah(getSessionUser().getDah());
            filter.setSortField(ConstantKey.EN_KEY);
            // 取得岗位列表
            filter.setType(ConstantKey.POSITION);

            List<Constant> userVos = positionService.getDatas(filter);
            // 取得用户总件数
            long count = positionService.getCount(filter);
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

    // /
    @ResponseBody
    @RequestMapping("showPositionUpdPop.do")
    private ModelAndView showPositionUpdPop() {
        // 跳转到更新页面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("base/positionUpdPop");
        return mv;
    }


    @ResponseBody
    @RequestMapping("ajax/position_add.do")
    private void addPosition(Constant condition) throws BusinessException {
        try {
//            condition.setType("position");
            positionService.addPosition(condition);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }


    //
    @ResponseBody
    @RequestMapping("ajax/position_get.do")
    private void getPosition(String enKey) throws BusinessException {
        try {
            Constant condition = positionService.getPosition(enKey);

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
    @RequestMapping("ajax/position_update.do")
    private void updateData(Constant condition) throws BusinessException {
        try {
            positionService.updateDate(condition);
            response.getWriter().write(ConstantKey.SUCCESS);
        } catch (NullPointerException e) {
            throw new BusinessException(ConstantMessage.ERR00004, e);
        } catch (IOException e) {
            throw new BusinessException(ConstantMessage.ERR00005, e);
        }
    }

    //
    @ResponseBody
    @RequestMapping("ajax/enKeyIsExsit.do")
    private void checkIsExsit(String enKey) throws BusinessException {
        try {
            // 取得岗位列表
            int count = positionService.getRecordByEnKey(enKey);
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
}
