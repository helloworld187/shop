package com.zhangli.shop.pojo;

public class Shopcart {
    private Integer shopcartid;

    private Integer goodsid;

    private Integer userid;

    public Integer getShopcartid() {
        return shopcartid;
    }

    public void setShopcartid(Integer shopcartid) {
        this.shopcartid = shopcartid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

	@Override
	public String toString() {
		return "Shopcart [shopcartid=" + shopcartid + ", goodsid=" + goodsid + ", userid=" + userid + "]";
	}
}