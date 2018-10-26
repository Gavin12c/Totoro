package com.hy.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hy.bean.Journal;
import com.hy.bean.PageBean;
import com.hy.service.JournalService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("hostAction")
@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/")
// @Results ��������� ȫ��
public class HostAction extends ActionSupport implements ModelDriven<Journal> {

	private Journal journal;

	private int page = 1;
	private int rows = 5;

	public void setPage(int page) {
		this.page = page;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	@Autowired
	private JournalService journalService;

	private Map<String, Object> map;

	public Map<String, Object> getMap() {
		return map;
	}

	/**
	 * ���ҽ���
	 */
	@Action(value="hostAction_speed",results={@Result(name="find_success",location="/index.jsp")})
	public String findSpeed() {
		Double s = journalService.findSpeed(DetachedCriteria.forClass(Journal.class));
		ServletActionContext.getRequest().getSession().setAttribute("actionMessages", s + "");
		return "find_success";
	}

	/**
	 * ս��¼��
	 */
	@Action(value = "hostAction_save", results = { @Result(name = "save_success", location = "/addcom.jsp") })
	public String save() {
		System.out.println("������ save ����");
		
		journalService.save(journal, DetachedCriteria.forClass(Journal.class));
		// �ٷֱ���ʾ
		Double s = journalService.findSpeed(DetachedCriteria.forClass(Journal.class));
		ServletActionContext.getRequest().getSession().setAttribute("actionMessages", s + "");
		
		return "save_success";
	}

	@Action(value = "hostAction_findByPage", results = {
	@Result(name = "page02", params = { "root", "map" }, type = "json") })
	public String findByPage() {
		System.out.println("������findByPage����..");

		PageBean<Journal> pageBean = journalService.findByPage(DetachedCriteria.forClass(Journal.class), page, rows);

		// �ٷֱ���ʾ
		Double s = journalService.findSpeed(DetachedCriteria.forClass(Journal.class));
		ServletActionContext.getRequest().getSession().setAttribute("actionMessages", s + "");

		// ���easyuiҪ��json �й̶���ʽ�� json Ҫ�������total \ rows

		map = new HashMap<>();
		map.put("total", pageBean.getTotalSize());
		map.put("rows", pageBean.getList());
		System.out.println(map);
		return "page02";
	}

	@Override
	public Journal getModel() {
		if (journal == null) {
			journal = new Journal();
		}
		return journal;
	}

}
