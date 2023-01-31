package com.ahn.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.spring.test.ajax.model.Booking;

@Repository
public interface PensionDAO {

	public List<Booking> bookingList();
	
	public int deleteList(@Param("id") int id);
	
	public int insertReserve(Booking booking);
}
