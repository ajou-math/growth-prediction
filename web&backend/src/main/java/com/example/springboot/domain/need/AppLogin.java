package com.example.springboot.domain.need;

public class AppLogin {
    private String childid;
    private String childpw;

    public String getChildid() {
        return childid;
    }

    public void setChildid(String childid) {
        this.childid = childid;
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
                + ", childpw='"
                + childpw
                + '}';
    }

}
