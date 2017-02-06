package com.fannimae.springmvc.dao;

import java.util.List;

import com.fannimae.springmvc.model.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
