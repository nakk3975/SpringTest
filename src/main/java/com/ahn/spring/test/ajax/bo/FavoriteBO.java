package com.ahn.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.ajax.dao.FavoriteDAO;
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
	
	public int checkUrl(String url) {
		return favoriteDAO.checkUrl(url);
	}

	public int favoriteDelete(int id) {
		return favoriteDAO.favoriteDelete(id);
	}
	
}
