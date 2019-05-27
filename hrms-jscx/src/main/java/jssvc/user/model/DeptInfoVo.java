package jssvc.user.model;

public class DeptInfoVo extends DeptInfo{
    private String superDept;   //上级部门

    public String getSuperDept() {
        return superDept;
    }

    public void setSuperDept(String superDept) {
        this.superDept = superDept;
    }
}
