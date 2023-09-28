package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.Entities.Contact;
import com.example.demo.Entities.User;
import com.example.demo.dao.ContactDao;

@Repository
public class ContactService {
	@Autowired
	ContactDao dao;
	
	public void addContact(Contact contact) {
		dao.save(contact);
	}
	
	public List<Contact> getAllContacts(String email) {
		List<Contact> contacts=dao.getAllContacts(email);
		return contacts;
		
	}
	
	public Contact getContactByPhn_number(long number) {
	
		return dao.getContactByPh_number(number);
		
	}
	
	public void deleteContact(Contact contact) {
		dao.delete(contact);
	}
	
	public List<Contact> getAllContactsByPhnNumber(long number) {
		List<Contact> contacts= dao.getAllContactsByPhnNumber(number);
		return contacts;
	}
	
	
	
	
}
