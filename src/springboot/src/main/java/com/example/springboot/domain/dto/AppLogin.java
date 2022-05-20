package com.example.springboot.domain.dto;

public class AppLogin {
    private String childid;
    private String childbirth;
    private String childpw;

    public String getChildid() {
        return childid;
    }

    public void setChildid(String childid) {
        this.childid = childid;
    }

    public String getChildbirth() {
        return childbirth;
    }

    public void setchildbirth(String childbirth) {
        this.childbirth = childbirth;
    }

    public String getChildpw() {
        return childpw;
    }

    public void setChildpw(String childpw) {
        this.childpw = childpw;
    }

    @Override
    public String toString() {
        return "AppLogin {"
                + "childid='"
                + childid
                + '\''
                + ", childbirth='"
                + childbirth
                + '\''
                + ", childpw='"
                + childpw
                + '}';
    }

}
