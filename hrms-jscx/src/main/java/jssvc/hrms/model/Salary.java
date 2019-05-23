package jssvc.hrms.model;

public class Salary {
    private Integer id;

    private String dah;

    private Double postSalary;

    private Double yearSalary;

    private Double floatSalary;

    private Double award;

    private Double telAllowrance;

    private Double trafficAllowrance;

    private Double lunchAllowrance;

    private Double insurance;

    private Double endowmentInsurance;

    private Double medicalInsurance;

    private Double workYear;

    private Double postLevel;

    private String flag;

    private String note1;

    private String sort;

    public Salary(Integer id, String dah, Double postSalary, Double yearSalary, Double floatSalary, Double award, Double telAllowrance, Double trafficAllowrance, Double lunchAllowrance, Double insurance, Double endowmentInsurance, Double medicalInsurance, Double workYear, Double postLevel, String flag, String note1, String sort) {
        this.id = id;
        this.dah = dah;
        this.postSalary = postSalary;
        this.yearSalary = yearSalary;
        this.floatSalary = floatSalary;
        this.award = award;
        this.telAllowrance = telAllowrance;
        this.trafficAllowrance = trafficAllowrance;
        this.lunchAllowrance = lunchAllowrance;
        this.insurance = insurance;
        this.endowmentInsurance = endowmentInsurance;
        this.medicalInsurance = medicalInsurance;
        this.workYear = workYear;
        this.postLevel = postLevel;
        this.flag = flag;
        this.note1 = note1;
        this.sort = sort;
    }

    public Salary() {
        super();
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

    public Double getPostSalary() {
        return postSalary;
    }

    public void setPostSalary(Double postSalary) {
        this.postSalary = postSalary;
    }

    public Double getYearSalary() {
        return yearSalary;
    }

    public void setYearSalary(Double yearSalary) {
        this.yearSalary = yearSalary;
    }

    public Double getFloatSalary() {
        return floatSalary;
    }

    public void setFloatSalary(Double floatSalary) {
        this.floatSalary = floatSalary;
    }

    public Double getAward() {
        return award;
    }

    public void setAward(Double award) {
        this.award = award;
    }

    public Double getTelAllowrance() {
        return telAllowrance;
    }

    public void setTelAllowrance(Double telAllowrance) {
        this.telAllowrance = telAllowrance;
    }

    public Double getTrafficAllowrance() {
        return trafficAllowrance;
    }

    public void setTrafficAllowrance(Double trafficAllowrance) {
        this.trafficAllowrance = trafficAllowrance;
    }

    public Double getLunchAllowrance() {
        return lunchAllowrance;
    }

    public void setLunchAllowrance(Double lunchAllowrance) {
        this.lunchAllowrance = lunchAllowrance;
    }

    public Double getInsurance() {
        return insurance;
    }

    public void setInsurance(Double insurance) {
        this.insurance = insurance;
    }

    public Double getEndowmentInsurance() {
        return endowmentInsurance;
    }

    public void setEndowmentInsurance(Double endowmentInsurance) {
        this.endowmentInsurance = endowmentInsurance;
    }

    public Double getMedicalInsurance() {
        return medicalInsurance;
    }

    public void setMedicalInsurance(Double medicalInsurance) {
        this.medicalInsurance = medicalInsurance;
    }

    public Double getWorkYear() {
        return workYear;
    }

    public void setWorkYear(Double workYear) {
        this.workYear = workYear;
    }

    public Double getPostLevel() {
        return postLevel;
    }

    public void setPostLevel(Double postLevel) {
        this.postLevel = postLevel;
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