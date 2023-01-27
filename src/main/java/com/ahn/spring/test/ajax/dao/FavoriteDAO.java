package com.ahn.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahn.spring.test.ajax.model.Favorite;

public interface FavoriteDAO {

	public List<Favorite> favoriteList();
	
	public int favoriteAdd(
			@Param("name") String name
			, @Param("url") String url
			);
	
	public int checkUrl(@Param("url") String url);
	
	public int favoriteDelete(@Param("id") int id);
}
