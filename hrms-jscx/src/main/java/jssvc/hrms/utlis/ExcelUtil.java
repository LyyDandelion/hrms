package jssvc.hrms.utlis;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

public class ExcelUtil {

    /**
     * 导出Excel
     * @param sheetName sheet名称
     * @param title 标题
     * @param values 内容
     * @param wb HSSFWorkbook对象
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbook(String sheetName,String []title,String [][]values, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i][j]);
            }
        }
        return wb;
    }
    /**
     * 导出Excel 针对工资条
     * @param sheetName sheet名称
     * @param values 内容
     * @param wb HSSFWorkbook对象
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbookForSalary(String sheetName,String [][]values, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);
        HSSFRow row1 = sheet.createRow(1);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        //声明列对象
        HSSFCell cell = null;

        //创建标题
/*        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }*/
        setCell(cell,row,style,0,"序号");
        setCell(cell,row,style,1,"姓名");
        setCell(cell,row,style,2,"基本工资");
        setCell(cell,row,style,3,"应发工资");
        setCell(cell,row1,style,3,"加班工资");
/*        setCell(cell,row1,style,4,"月奖金");
        setCell(cell,row1,style,5,"通讯补贴");
        setCell(cell,row1,style,6,"用餐补贴");*/
        setCell(cell,row1,style,4,"合计");
        setCell(cell,row,style,5,"应扣工资");
        setCell(cell,row1,style,5,"事假扣款");
        setCell(cell,row1,style,6,"迟到扣款");
        setCell(cell,row1,style,7,"病假扣款");
        setCell(cell,row,style,8,"应（代）扣金额");
        setCell(cell,row1,style,8,"养老保险");
        setCell(cell,row1,style,9,"医疗保险");
        setCell(cell,row1,style,10,"公积金");
        setCell(cell,row,style,11,"实发工资");
        sheet.addMergedRegion(mergeCells(0,1,0,0));
        sheet.addMergedRegion(mergeCells(0,1,1,1));
        sheet.addMergedRegion(mergeCells(0,1,2,2));
        sheet.addMergedRegion(mergeCells(0,0,3,4));
        sheet.addMergedRegion(mergeCells(0,0,5,7));
        sheet.addMergedRegion(mergeCells(0,0,8,10));
        sheet.addMergedRegion(mergeCells(0,1,11,11));
        //创建内容从第三行开始
        for(int i=1;i<=values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i-1].length;j++){
                //将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i-1][j]);
            }
        }
        return wb;
    }
    /**
     * @deprecated  合并单元格
     * @param firstRow   开始列值
     * @param lastRow   结束列值
     * @param firstCol    开始行值
     * @param lastCol    结束行值
     * @return
     */
    private static CellRangeAddress mergeCells(int firstRow, int lastRow, int firstCol, int lastCol){
        CellRangeAddress region = new CellRangeAddress(firstRow, lastRow, firstCol, lastCol);
        return region;
    }

    /**
     * @deprecated  设置标题头
     * @param cell
     * @param row
     * @param style
     * @param cellIndex
     * @param cellValue
     */
    private static void setCell(HSSFCell cell,HSSFRow row,HSSFCellStyle style,int cellIndex,String cellValue){
        cell = row.createCell(cellIndex);
        cell.setCellValue(cellValue);
        cell.setCellStyle(style);
    }
}
