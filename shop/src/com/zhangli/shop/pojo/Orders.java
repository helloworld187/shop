package com.zhangli.shop.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Orders {
    private Integer ordersid;

    private Integer userid;

    private Date ordertime;
    
    private static final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    private Integer addressid;

    private Double totalprice;

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getOrdertime() {
        return df.format(ordertime);
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

	@Override
	public String toString() {
		return "Orders [ordersid=" + ordersid + ", userid=" + userid + ", ordertime=" + ordertime + ", addressid="
				+ addressid + ", totalprice=" + totalprice + "]";
	}
}