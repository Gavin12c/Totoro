package com.hy.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hy.bean.Journal;

public interface JournalDao {

	void save(Journal journal);

	int findCount(DetachedCriteria forClass);

	List<Journal> findByPage(DetachedCriteria forClass, int page, int rows);

	Double findTotal(DetachedCriteria forClass);

	Double findSpeed(DetachedCriteria detachedCriteria);

}
