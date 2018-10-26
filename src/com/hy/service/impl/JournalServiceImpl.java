package com.hy.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hy.bean.Journal;
import com.hy.bean.PageBean;
import com.hy.dao.JournalDao;
import com.hy.service.JournalService;
import com.hy.utils.SpeedUtils;


@Transactional
@Service("journalService")
public class JournalServiceImpl implements JournalService{

	@Autowired
	private JournalDao journalDao;
	@Override
	public Double save(Journal journal,DetachedCriteria forClass) {
		
		//totalmoney
		Double totalmoney= journalDao.findTotal(forClass);
		//进度算法
		Double speed = Double.valueOf(SpeedUtils.myPercent(2800, journal.getGetmoney()));
		Double speedtotal = Double.valueOf(SpeedUtils.myPercent(2800, totalmoney));
		System.out.println(totalmoney+"===");
		journal.setTotalmoney(totalmoney+journal.getGetmoney());
		journal.setSpeed(speed+speedtotal);
		
		journalDao.save(journal);
		return speed;
	}
	@Override
	public PageBean<Journal> findByPage(DetachedCriteria forClass, int page, int rows) {
		//总条数
		
		int totalSize = journalDao.findCount(forClass);
		
		//list
		List<Journal> list = journalDao.findByPage(forClass,page,rows);
		PageBean<Journal> pageBean = new PageBean<Journal>();
		
		pageBean.setTotalSize(totalSize);
		pageBean.setPageSize(rows);
		pageBean.setCurrentPage(page);
		pageBean.setTotalPage((int) Math.ceil(totalSize * 1.0 / page) );
		pageBean.setList(list);
		
		return pageBean;
	}
	
	@Override
	public Double findSpeed(DetachedCriteria detachedCriteria) {
		//totalmoney
		Double totalmoney= journalDao.findSpeed(detachedCriteria);
		//进度算法
		return Double.valueOf(SpeedUtils.myPercent(2800, totalmoney));
	}
	
}
