package com.ahn.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.jstl.dao.WeatherHistoryDAO;
import com.ahn.spring.test.jstl.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherDAO;
	
	public List<WeatherHistory> weatherInfo() {
		return weatherDAO.weatherInfo();
	}
	
	public int weatherAdd(
			WeatherHistory weatherHistory) {
		return weatherDAO.weatherAdd(weatherHistory);
	}
}
