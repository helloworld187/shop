package com.zhangli.shop.pojo;

public class Orderdetails {
    private Integer orderdetailesid;

    private Integer ordersid;

    private Integer goodsid;

    private Integer counts;

    private Integer userid;

    public Integer getOrderdetailesid() {
        return orderdetailesid;
    }

    public void setOrderdetailesid(Integer orderdetailesid) {
        this.orderdetailesid = orderdetailesid;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getCounts() {
        return counts;
    }

    public void setCounts(Integer counts) {
        this.counts = counts;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

	@Override
	public String toString() {
		return "Orderdetails [orderdetailesid=" + orderdetailesid + ", ordersid=" + ordersid + ", goodsid=" + goodsid
				+ ", counts=" + counts + ", userid=" + userid + "]";
	}
    
}