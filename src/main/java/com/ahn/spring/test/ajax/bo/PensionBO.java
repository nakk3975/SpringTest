package com.ahn.spring.test.ajax.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.ajax.dao.PensionDAO;
import com.ahn.spring.test.ajax.model.Booking;

@Service
public class PensionBO {

	@Autowired
	private PensionDAO pensionDAO;

	public List<Booking> bookingList() {
		return pensionDAO.bookingList();
	}

	public boolean deleteList(int id) {
		int count = pensionDAO.deleteList(id);
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	public boolean insertReserve(Booking booking) {
		int count = pensionDAO.insertReserve(booking);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
}
