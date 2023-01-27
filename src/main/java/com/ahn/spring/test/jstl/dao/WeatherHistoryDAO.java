package com.ahn.spring.test.jstl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ahn.spring.test.jstl.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {

	public List<WeatherHistory> weatherInfo();
	
	public int weatherAdd(WeatherHistory weatherHistory);
}
