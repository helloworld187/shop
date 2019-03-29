package com.zhangli.shop.pojo;

public class Address {
    private Integer addressid;

    private Integer userid;

    private String addressinfo;

    private String zipcode;

    private String telephone;

    private String name;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getAddressinfo() {
        return addressinfo;
    }

    public void setAddressinfo(String addressinfo) {
        this.addressinfo = addressinfo == null ? null : addressinfo.trim();
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode == null ? null : zipcode.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

	@Override
	public String toString() {
		return "Address [addressid=" + addressid + ", userid=" + userid + ", addressinfo=" + addressinfo + ", zipcode="
				+ zipcode + ", telephone=" + telephone + ", name=" + name + "]";
	}
}