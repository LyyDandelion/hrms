package jssvc.hrms.model;

public class ImportData {
    private Integer id;

    private String dah;

    private Integer month;

    private Integer sickDays;

    private Integer compassionateDays;

    private Integer lateTimes;

    private Integer overtimeDays;

    private Double replenishment;

    private String flag;

    private String note1;

    private String sort;

    public ImportData(Integer id, String dah, Integer month, Integer sickDays, Integer compassionateDays, Integer lateTimes, Integer overtimeDays, Double replenishment, String flag, String note1, String sort) {
        this.id = id;
        this.dah = dah;
        this.month = month;
        this.sickDays = sickDays;
        this.compassionateDays = compassionateDays;
        this.lateTimes = lateTimes;
        this.overtimeDays = overtimeDays;
        this.replenishment = replenishment;
        this.flag = flag;
        this.note1 = note1;
        this.sort = sort;
    }

    public ImportData() {
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

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getSickDays() {
        return sickDays;
    }

    public void setSickDays(Integer sickDays) {
        this.sickDays = sickDays;
    }

    public Integer getCompassionateDays() {
        return compassionateDays;
    }

    public void setCompassionateDays(Integer compassionateDays) {
        this.compassionateDays = compassionateDays;
    }

    public Integer getLateTimes() {
        return lateTimes;
    }

    public void setLateTimes(Integer lateTimes) {
        this.lateTimes = lateTimes;
    }

    public Integer getOvertimeDays() {
        return overtimeDays;
    }

    public void setOvertimeDays(Integer overtimeDays) {
        this.overtimeDays = overtimeDays;
    }

    public Double getReplenishment() {
        return replenishment;
    }

    public void setReplenishment(Double replenishment) {
        this.replenishment = replenishment;
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