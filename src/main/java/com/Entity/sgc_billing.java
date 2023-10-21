
package com.Entity;

import java.util.Date;



public class sgc_billing {
    
    private int userId;
    private String Username;
    private Date Date;
    private int sub;
    private int del;
    private String setup;

    public sgc_billing(int userId, String Username, Date Date, int sub, int del, String setup) {
        this.userId = userId;
        this.Username = Username;
        this.Date = Date;
        this.sub = sub;
        this.del = del;
        this.setup = setup;
    }

    public sgc_billing(String Username, Date Date, int sub, int del, String setup) {
        this.Username = Username;
        this.Date = Date;
        this.sub = sub;
        this.del = del;
        this.setup = setup;
    }

    public sgc_billing() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }

    public int getSub() {
        return sub;
    }

    public void setSub(int sub) {
        this.sub = sub;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }

    public String getSetup() {
        return setup;
    }

    public void setSetup(String setup) {
        this.setup = setup;
    }

    @Override
    public String toString() {
        return "sgc_billing{" + "userId=" + userId + ", Username=" + Username + ", Date=" + Date + ", sub=" + sub + ", del=" + del + ", setup=" + setup + '}';
    } 
    
}
