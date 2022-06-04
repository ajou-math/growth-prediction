package com.example.springboot.domain.need;

public class ResultDTO {
    private String childname;
    private String childid;
    private String doctorid;
    private String childgender;
    private String childbirth;
    private float childheight;
    private float childweight;

    public String getChildname() {
        return childname;
    }

    public void setChildname(String childname) {
        this.childname = childname;
    }

    public String getChildid() {
        return childid;
    }

    public void setChildid(String childid) {
        this.childid = childid;
    }

    public String getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(String doctorid) {
        this.doctorid = doctorid;
    }

    public String getChildgender() {
        return childgender;
    }

    public void setChildgender(String childgender) {
        this.childgender = childgender;
    }

    public String getChildbirth() {
        return childbirth;
    }

    public void setChildbirth(String childbirth) {
        this.childbirth = childbirth;
    }

    public float getChildheight() {
        return childheight;
    }

    public void setChildheight(float childheight) {
        this.childheight = childheight;
    }

    public float getChildweight() {
        return childweight;
    }

    public void setChildweight(float childweight) {
        this.childweight = childweight;
    }

}
