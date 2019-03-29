package com.zhangli.shop.pojo;

import java.util.Date;

public class Category {
    private Integer categoryid;

    private String categoryname;

    private String cdescription;

    private Date creattime;

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname == null ? null : categoryname.trim();
    }

    public String getCdescription() {
        return cdescription;
    }

    public void setCdescription(String cdescription) {
        this.cdescription = cdescription == null ? null : cdescription.trim();
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

	@Override
	public String toString() {
		return "Category [categoryid=" + categoryid + ", categoryname=" + categoryname + ", cdescription="
				+ cdescription + ", creattime=" + creattime + "]";
	}
}