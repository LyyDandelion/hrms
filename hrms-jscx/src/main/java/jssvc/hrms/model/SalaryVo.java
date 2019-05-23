package jssvc.hrms.model;

public class SalaryVo extends  Salary {
    private String post;

    private String name;

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
