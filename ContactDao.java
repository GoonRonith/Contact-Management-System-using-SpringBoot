package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.Entities.Contact;

public interface ContactDao extends CrudRepository<Contact, Long>{

	@Query(value="select * from contact where createremail=:email",nativeQuery = true)
	public List<Contact> getAllContacts( @Param("email") String email);
	
	@Query(value="select * from contact where ph_number=:number",nativeQuery = true)
	public Contact getContactByPh_number(@Param("number") long number);
	
	@Query(value="select * from contact where ph_number like %:number%",nativeQuery = true)
	public List<Contact> getAllContactsByPhnNumber(@Param("number") long number);
	
}
