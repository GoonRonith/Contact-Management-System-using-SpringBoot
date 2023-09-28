package com.example.demo.Controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Entities.Contact;
import com.example.demo.Entities.User;
import com.example.demo.services.ContactService;
import com.example.demo.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ContactController {

	@Autowired
	UserService service;
	

	@Autowired
	ContactService contactService;
	
	@GetMapping("/dashbord/addContact")
	public String showContactAddForm(Model model) {
	
		return "addContact";
	}
	
	@PostMapping("/dashbord/addContact")
	public String processContactAddForm(HttpServletRequest req,Model model,@ModelAttribute("Contact") Contact contact,@RequestParam("image")  MultipartFile file) throws IOException {
//		System.out.println(contact);
		
		HttpSession session=req.getSession();
		String createrEmail=(String)session.getAttribute("email");
		
//		System.out.println(file);
		contact.setImageData(file.getBytes());
		contact.setCreaterEmail(createrEmail);
		contactService.addContact(contact);
		return "redirect:/dashbord";
	}
	
	@GetMapping("/dashbord/delete/{ph_number}")
	public String deleteContact(@PathVariable("ph_number") long ph_number) {
		Contact contact=contactService.getContactByPhn_number(ph_number);
		contactService.deleteContact(contact);
		return "redirect:/dashbord";
	}
	
	
	@GetMapping("/dashbord/update/{ph_number}")
	public String showUpdateContactForm(Model model,@PathVariable("ph_number") long ph_number) {
		Contact contact=contactService.getContactByPhn_number(ph_number);
		model.addAttribute("contact", contact);
		return "updateContact";
	}
	
	@PostMapping("/dashbord/update/{ph_number}")
	public String handle_UpdateContactForm(HttpServletRequest req,Model model,@PathVariable("ph_number") long ph_number,@ModelAttribute("Contact") Contact c,@RequestParam("image") MultipartFile file) throws IOException {
		HttpSession session=req.getSession();
		String createrEmail=(String)session.getAttribute("email");
		c.setCreaterEmail(createrEmail);
		
		if(file.isEmpty()) {
			Contact contact=contactService.getContactByPhn_number(ph_number);
			c.setImageData(contact.getImageData());
			
		}
		
		else {
			c.setImageData(file.getBytes());
		}
		contactService.addContact(c);
		return "redirect:/dashbord";
		
	}
	
	@GetMapping("/dashbord/{ph_number}")
	public ResponseEntity<List<Contact>> getContactByPhnNumber(@PathVariable("ph_number") long ph_number) {
//		System.out.println(ph_number);
		List<Contact> contacts=contactService.getAllContactsByPhnNumber(ph_number);
		System.out.println(contacts);
		return ResponseEntity.ok(contacts);
		
		
	}
	
	
}
