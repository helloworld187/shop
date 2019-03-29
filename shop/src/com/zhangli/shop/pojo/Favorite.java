package com.zhangli.shop.pojo;

public class Favorite {
    private Integer favoriteid;

    private Integer goodsid;

    private Integer userid;

    public Integer getFavoriteid() {
        return favoriteid;
    }

    public void setFavoriteid(Integer favoriteid) {
        this.favoriteid = favoriteid;
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
		return "Favorite [favoriteid=" + favoriteid + ", goodsid=" + goodsid + ", userid=" + userid + "]";
	}
}