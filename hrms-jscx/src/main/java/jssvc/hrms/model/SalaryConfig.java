package jssvc.hrms.model;

public class SalaryConfig {
    private Integer id;

    private String type;

    private String enKey;

    private String name;

    private Double postSalary;

    private Double yearSalary;

    private Double floatSalary;

    private Double award;

    private Double telAllowrance;

    private Double trafficAllowrance;

    private Double lunchAllowrance;

    private Double workYear;

    private Double numAttr1;

    private Double numAttr2;

    private Double numAttr3;

    private String strAttr1;

    private String strAttr2;

    private String strAttr3;

    private String flag;

    private String note1;

    private String sort;

    public SalaryConfig(Integer id, String type, String enKey, String name, Double postSalary, Double yearSalary, Double floatSalary, Double award, Double telAllowrance, Double trafficAllowrance, Double lunchAllowrance, Double workYear, Double numAttr1, Double numAttr2, Double numAttr3, String strAttr1, String strAttr2, String strAttr3, String flag, String note1, String sort) {
        this.id = id;
        this.type = type;
        this.enKey = enKey;
        this.name = name;
        this.postSalary = postSalary;
        this.yearSalary = yearSalary;
        this.floatSalary = floatSalary;
        this.award = award;
        this.telAllowrance = telAllowrance;
        this.trafficAllowrance = trafficAllowrance;
        this.lunchAllowrance = lunchAllowrance;
        this.workYear = workYear;
        this.numAttr1 = numAttr1;
        this.numAttr2 = numAttr2;
        this.numAttr3 = numAttr3;
        this.strAttr1 = strAttr1;
        this.strAttr2 = strAttr2;
        this.strAttr3 = strAttr3;
        this.flag = flag;
        this.note1 = note1;
        this.sort = sort;
    }

    public SalaryConfig() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getEnKey() {
        return enKey;
    }

    public void setEnKey(String enKey) {
        this.enKey = enKey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Double getWorkYear() {
        return workYear;
    }

    public void setWorkYear(Double workYear) {
        this.workYear = workYear;
    }

    public Double getNumAttr1() {
        return numAttr1;
    }

    public void setNumAttr1(Double numAttr1) {
        this.numAttr1 = numAttr1;
    }

    public Double getNumAttr2() {
        return numAttr2;
    }

    public void setNumAttr2(Double numAttr2) {
        this.numAttr2 = numAttr2;
    }

    public Double getNumAttr3() {
        return numAttr3;
    }

    public void setNumAttr3(Double numAttr3) {
        this.numAttr3 = numAttr3;
    }

    public String getStrAttr1() {
        return strAttr1;
    }

    public void setStrAttr1(String strAttr1) {
        this.strAttr1 = strAttr1 == null ? null : strAttr1.trim();
    }

    public String getStrAttr2() {
        return strAttr2;
    }

    public void setStrAttr2(String strAttr2) {
        this.strAttr2 = strAttr2 == null ? null : strAttr2.trim();
    }

    public String getStrAttr3() {
        return strAttr3;
    }

    public void setStrAttr3(String strAttr3) {
        this.strAttr3 = strAttr3 == null ? null : strAttr3.trim();
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