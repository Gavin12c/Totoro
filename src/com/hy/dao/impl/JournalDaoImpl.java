package com.hy.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.hy.bean.Journal;
import com.hy.dao.JournalDao;

@Repository("journalDao")
public class JournalDaoImpl implements JournalDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public void save(Journal journal) {
		hibernateTemplate.save(journal);
	}

	@Override
	public int findCount(DetachedCriteria forClass) {
		forClass.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) hibernateTemplate.findByCriteria(forClass);
		return list.size()>0 ? list.get(0).intValue() : 0;
	}

	@Override
	public List<Journal> findByPage(DetachedCriteria forClass, int page, int rows) {
		forClass.setProjection(null);
		return (List<Journal>) hibernateTemplate.findByCriteria(forClass, (page-1)*rows, rows);
	}

	@Override
	public Double findTotal(DetachedCriteria forClass) {
		forClass.setProjection(Projections.sum("getmoney"));
		
		List<Double> findByCriteria = (List<Double>) hibernateTemplate.findByCriteria(forClass);
		return findByCriteria.size()>0 ? findByCriteria.get(0) : 0 ;
		
	}

	@Override
	public Double findSpeed(DetachedCriteria detachedCriteria) {
		detachedCriteria.setProjection(Projections.sum("getmoney"));
		
		List<Double> findByCriteria = (List<Double>) hibernateTemplate.findByCriteria(detachedCriteria);
		
		return findByCriteria.size()>0 && findByCriteria != null ? findByCriteria.get(0) : 0;
		
	} 

}
