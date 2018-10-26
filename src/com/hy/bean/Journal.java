package com.hy.bean;

import java.util.Date;

public class Journal {

	//序号
	private Long id;
	//战斗日期
	private Date mydate;
	//战斗目标
	private String target;
	//获得金额
	private Double getmoney;
	//已完成储蓄
	private Double totalmoney;
	//进度
	private Double speed;
	//战斗过程日志
	private String event;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public Date getMydate() {
		return mydate;
	}
	public void setMydate(Date mydate) {
		this.mydate = mydate;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public Double getGetmoney() {
		return getmoney;
	}
	public void setGetmoney(Double getmoney) {
		this.getmoney = getmoney;
	}
	public Double getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(Double totalmoney) {
		this.totalmoney = totalmoney;
	}
	public Double getSpeed() {
		return speed;
	}
	public void setSpeed(Double speed) {
		this.speed = speed;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	
	
}
