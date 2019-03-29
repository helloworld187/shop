package com.zhangli.shop.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    private Integer commentid;

    private Integer userid;

    private Integer goodsid;

    private String content;

    private Date ccreattime;
    
    private static final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getCcreattime() {
        return df.format(ccreattime);
    }

    public void setCcreattime(Date ccreattime) {
        this.ccreattime = ccreattime;
    }

	@Override
	public String toString() {
		return "Comment [commentid=" + commentid + ", userid=" + userid + ", goodsid=" + goodsid + ", content="
				+ content + ", ccreattime=" + ccreattime + "]";
	}
}