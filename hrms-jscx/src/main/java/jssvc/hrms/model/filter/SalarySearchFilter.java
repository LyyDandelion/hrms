package jssvc.hrms.model.filter;

import jssvc.base.vo.Pagination;

public class SalarySearchFilter extends Pagination {

    private static final long serialVersionUID = -6695265793178343058L;

    private String loginDah;

    private String dah;

    private String jgh;

    private String ygxm;

    private String flag;

    private String roleName;

    private String name;

    private String startDate;

    private String endDate;

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getDah() {
        return dah;
    }

    public String getLoginDah() {
        return loginDah;
    }

    public void setLoginDah(String loginDah) {
        this.loginDah = loginDah;
    }

    public void setDah(String dah) {
        this.dah = dah;
    }

    public String getJgh() {
        return jgh;
    }

    public void setJgh(String jgh) {
        this.jgh = jgh;
    }

    public String getYgxm() {
        return ygxm;
    }

    public void setYgxm(String ygxm) {
        this.ygxm = ygxm;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
