package com.zhangli.shop.pojo;

public class Picture {
    private Integer pictureid;

    private Integer goodsid;

    private String path;

    private Integer userid;

    public Integer getPictureid() {
        return pictureid;
    }

    public void setPictureid(Integer pictureid) {
        this.pictureid = pictureid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

	@Override
	public String toString() {
		return "Picture [pictureid=" + pictureid + ", goodsid=" + goodsid + ", path=" + path + ", userid=" + userid
				+ "]";
	}
}