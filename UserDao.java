package com.example.demo.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.Entities.User;


public interface UserDao extends CrudRepository<User, String> {
	@Query(value="select * from user where email=:e",nativeQuery = true)
	public User isRegistered(@Param("e") String email);
	
	@Query(value="select * from user where email=:e and password=:pwd",nativeQuery = true)
	public User getUserByEmailAndPwd(@Param("e") String email,@Param("pwd") String pwd);
	

	
	
//	@Query(value="select * from user where name=:n",nativeQuery = true)
//	public User getDataByName(@Param("n") String name);
}
