package com.example.demo.services;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.Entities.User;

import com.example.demo.dao.UserDao;


@Repository
public class UserService {
	@Autowired
	UserDao dao;

	public void saveUser(User user) {
		dao.save(user);
	}
	
	public boolean isRegistered(String email) {
		User user=dao.isRegistered(email);
//		System.out.println(user);
		if(user==null) return false;
		return true;
	}
	
	 public  String generateSHA256Hash(String email) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] hashBytes = md.digest(email.getBytes());
	            return Base64.getEncoder().encodeToString(hashBytes).substring(0,7);
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

	 
	 public User getUserByEmailAndPwd(String email,String pwd) {
		 User user=dao.getUserByEmailAndPwd(email, pwd);
		 return user;
	 }
	 
	 public boolean isCorrectEmailAndpwd(String uEmal,String uPWd,User user) {
		 if(user!=null) {
			 if(user.getEmail().equals(uEmal) && user.getPassword().equals(uPWd)) {
				 return true;
			 }
		 }
		 
		 return false;
	 }
	 
//	 public void setUserLogin(User_login u) {
//		loginDao.save(u);
//	 }
//	 public String getHidByEmail(String email) {
//		 User_login ul=loginDao.getUserByEmail(email);
//		 return ul.getHid();
//	 }
//	 
//	 public User_login getCurrUserByEmail(String email) {
//		 User_login ul=loginDao.getUserByEmail(email);
//		 return ul;
//	 }
//	
//	 public void deleteCurrentLoginUser(User_login u) {
//		 loginDao.delete(u);;
//	 }
	 
	 public User getUserByEmail(String email){
		 User u=dao.isRegistered(email);
		 byte[] t=u.getImageData();
		 System.out.println(t);
		 return u;
	 }
	
}
