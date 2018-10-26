package com.hy.service;

import org.hibernate.criterion.DetachedCriteria;

import com.hy.bean.Journal;
import com.hy.bean.PageBean;

public interface JournalService {


	PageBean<Journal> findByPage(DetachedCriteria forClass, int page, int rows);

	Double save(Journal journal, DetachedCriteria forClass);

	Double findSpeed(DetachedCriteria detachedCriteria);

}
