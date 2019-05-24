package jssvc.hrms.model;

import java.util.Date;

public class Settlement {
    private Integer id;

    private String dah;

    private Integer month;

    private Double sickDeduction;

    private Integer compassionateDeduction;

    private Double lateDeduction;

    private Double overtimeSalary;

    private Double ownerEndowmentInsurance;

    private Double companyEndowmentInsurance;

    private Double ownerMedicalInsurance;

    private Double companyMedicalInsurance;

    private Double ownerAccumulationFund;

    private Double companyAccumulationFund;

    private Date updateDate;


    private Double base;
    private Double realWages;

    private String isGrant;

    private String flag;

    private String note1;

    private String sort;

    public Settlement(Integer id, String dah, Integer month, Double sickDeduction, Integer compassionateDeduction, Double lateDeduction, Double overtimeSalary, Double ownerEndowmentInsurance, Double companyEndowmentInsurance, Double ownerMedicalInsurance, Double companyMedicalInsurance, Double ownerAccumulationFund, Double companyAccumulationFund, Date updateDate,Double base,Double realWages, String isGrant, String flag, String note1, String sort) {
        this.id = id;
        this.dah = dah;
        this.month = month;
        this.sickDeduction = sickDeduction;
        this.compassionateDeduction = compassionateDeduction;
        this.lateDeduction = lateDeduction;
        this.overtimeSalary = overtimeSalary;
        this.ownerEndowmentInsurance = ownerEndowmentInsurance;
        this.companyEndowmentInsurance = companyEndowmentInsurance;
        this.ownerMedicalInsurance = ownerMedicalInsurance;
        this.companyMedicalInsurance = companyMedicalInsurance;
        this.ownerAccumulationFund = ownerAccumulationFund;
        this.companyAccumulationFund = companyAccumulationFund;
        this.updateDate = updateDate;
        this.base=base;
        this.realWages=realWages;
        this.isGrant = isGrant;
        this.flag = flag;
        this.note1 = note1;
        this.sort = sort;
    }


    public Settlement() {
        super();
    }

    public Double getBase() {
        return base;
    }

    public void setBase(Double base) {
        this.base = base;
    }

    public Double getRealWages() {
        return realWages;
    }

    public void setRealWages(Double realWages) {
        this.realWages = realWages;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDah() {
        return dah;
    }

    public void setDah(String dah) {
        this.dah = dah == null ? null : dah.trim();
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Double getSickDeduction() {
        return sickDeduction;
    }

    public void setSickDeduction(Double sickDeduction) {
        this.sickDeduction = sickDeduction;
    }

    public Integer getCompassionateDeduction() {
        return compassionateDeduction;
    }

    public void setCompassionateDeduction(Integer compassionateDeduction) {
        this.compassionateDeduction = compassionateDeduction;
    }

    public Double getLateDeduction() {
        return lateDeduction;
    }

    public void setLateDeduction(Double lateDeduction) {
        this.lateDeduction = lateDeduction;
    }

    public Double getOvertimeSalary() {
        return overtimeSalary;
    }

    public void setOvertimeSalary(Double overtimeSalary) {
        this.overtimeSalary = overtimeSalary;
    }

    public Double getOwnerEndowmentInsurance() {
        return ownerEndowmentInsurance;
    }

    public void setOwnerEndowmentInsurance(Double ownerEndowmentInsurance) {
        this.ownerEndowmentInsurance = ownerEndowmentInsurance;
    }

    public Double getCompanyEndowmentInsurance() {
        return companyEndowmentInsurance;
    }

    public void setCompanyEndowmentInsurance(Double companyEndowmentInsurance) {
        this.companyEndowmentInsurance = companyEndowmentInsurance;
    }

    public Double getOwnerMedicalInsurance() {
        return ownerMedicalInsurance;
    }

    public void setOwnerMedicalInsurance(Double ownerMedicalInsurance) {
        this.ownerMedicalInsurance = ownerMedicalInsurance;
    }

    public Double getCompanyMedicalInsurance() {
        return companyMedicalInsurance;
    }

    public void setCompanyMedicalInsurance(Double companyMedicalInsurance) {
        this.companyMedicalInsurance = companyMedicalInsurance;
    }

    public Double getOwnerAccumulationFund() {
        return ownerAccumulationFund;
    }

    public void setOwnerAccumulationFund(Double ownerAccumulationFund) {
        this.ownerAccumulationFund = ownerAccumulationFund;
    }

    public Double getCompanyAccumulationFund() {
        return companyAccumulationFund;
    }

    public void setCompanyAccumulationFund(Double companyAccumulationFund) {
        this.companyAccumulationFund = companyAccumulationFund;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getIsGrant() {
        return isGrant;
    }

    public void setIsGrant(String isGrant) {
        this.isGrant = isGrant == null ? null : isGrant.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public String getNote1() {
        return note1;
    }

    public void setNote1(String note1) {
        this.note1 = note1 == null ? null : note1.trim();
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }
}