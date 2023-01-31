package com.ahn.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.ajax.dao.FavoriteDAO;
import com.ahn.spring.test.ajax.model.Booking;
import com.ahn.spring.test.ajax.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public List<Favorite> favoriteList() {
		return favoriteDAO.favoriteList();
	}
	
	public int favoriteAdd(
			String name
			, String url
			) {
		return favoriteDAO.favoriteAdd(name, url);
	}
	
	public boolean checkUrl(String url) {
		int count = favoriteDAO.checkUrl(url);
		if(count == 0) {
			return false; 
		} else {
			return true;
		}
	}

	public boolean favoriteDelete(int id) {
		int count = favoriteDAO.favoriteDelete(id);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	
	
}
