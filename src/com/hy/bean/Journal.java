package com.hy.bean;

import java.util.Date;

public class Journal {

	//���
	private Long id;
	//ս������
	private Date mydate;
	//ս��Ŀ��
	private String target;
	//��ý��
	private Double getmoney;
	//����ɴ���
	private Double totalmoney;
	//����
	private Double speed;
	//ս��������־
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
