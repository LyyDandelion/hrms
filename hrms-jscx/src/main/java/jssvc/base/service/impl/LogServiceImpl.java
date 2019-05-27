package jssvc.base.service.impl;

import jssvc.base.constant.ConstantKey;
import jssvc.base.constant.ConstantMessage;
import jssvc.base.dao.LogMapper;
import jssvc.base.exception.BusinessException;
import jssvc.base.model.Log;
import jssvc.base.service.LogService;
import jssvc.base.util.DateUtil;
import jssvc.base.vo.LogVo;
import jssvc.base.vo.filter.LogSearchFilter;
import jssvc.hrms.model.SettlementVo;
import jssvc.hrms.utlis.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * @Description 日志service实现
 * 
 * @author 唐振平 @date 2016-08-03 @reason 新增
 * @Updated-By   dandelion
 * @Update-date  2019-05-27
 */
@Service("logService")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logDao;

    public List<LogVo> getLogs(LogSearchFilter filter) {
        List<LogVo> logs = logDao.selectLogs(filter);
        return logs;

    }

    public int getLogsCount(LogSearchFilter filter) {
        int count = logDao.selectLogsCount(filter);
        return count;
    }

    public boolean createLog(Log log) throws BusinessException {
        boolean flag = true;
        try {
            logDao.insert(log);
        } catch (Exception e) {
            throw new BusinessException(ConstantMessage.ERR00014, e);
        }
        return flag;
    }

    @Override
    public void backups() {
        LogSearchFilter filter= new LogSearchFilter();
        filter.setSortField("datetime");
        filter.setSortOrder("DESC");
        List<LogVo> list = getLogs(filter);
        if(list==null)
        {
            return ;
        }
        try {
//        //excel标题
            String[] title = {"序号", "用户ID", "用户姓名", "机构", "时间", "IP", "操作", "对象"};
//        //excel文件名
            String fileName = "日志-" + DateUtil.getChinaDateString(new Date()) + ".xls";
//        //sheet名
            String sheetName = "日志";
            String[][] content = new String[list.size()][8];
            for (int i = 0; i < list.size(); i++) {
                LogVo logVo = list.get(i);
                content[i][0] = String.valueOf(i + 1);
                content[i][1] = logVo.getDah();
                content[i][2] = logVo.getYgxm();
                content[i][3] = logVo.getJgmc();
                content[i][4] = logVo.getDatetime().toString();
                content[i][5] = String.valueOf(logVo.getIp());
                content[i][6] = String.valueOf(logVo.getType());
                content[i][7] = String.valueOf(logVo.getObject());
            }
            //创建HSSFWorkbook
            HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
            File file = new File(ConstantKey.EXPORT_PATH);
            OutputStream stream = new FileOutputStream(new File(file, fileName));
            wb.write(stream);
            stream.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

}
