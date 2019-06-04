package jssvc.hrms.model;


public class TotalSheetVo {

    private int month;
    private String dept;
    private double monthTotal;
    private double deptTotal;

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public double getMonthTotal() {
        return monthTotal;
    }

    public void setMonthTotal(double monthTotal) {
        this.monthTotal = monthTotal;
    }

    public double getDeptTotal() {
        return deptTotal;
    }

    public void setDeptTotal(double deptTotal) {
        this.deptTotal = deptTotal;
    }
}
