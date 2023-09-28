package com.example.demo.Controllers;

import java.io.IOException;
import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Entities.Contact;
import com.example.demo.Entities.User;
import com.example.demo.services.ContactService;
import com.example.demo.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	UserService service;
	@Autowired
	ContactService contactService;
	
	@GetMapping("/")
	public String gethomePage() {
		return "home";
	}
	
	
	@GetMapping("/register")
	public String showRegisterForm() {
		return "Register";
	}
	
	
	
	@PostMapping("/register")
	public String registerProcess(Model model,@ModelAttribute("User") User user,@RequestParam("image") MultipartFile file) throws IOException {
		System.out.println(user);
//		System.out.println(file.isEmpty());
		user.setImageData(file.getBytes());
//		System.out.println(user.getImageData());
//		System.out.println(user);
		
		//checking for user is already registered or not
		if(service.isRegistered(user.getEmail())) { //if yes then show a proper message
			System.out.println("already have an account!!");
			model.addAttribute("alredayRegisteredError", "Already a registration is done with this email id...");
			return "Register";
		}
		else { //if no then register or save the user in our database
			service.saveUser(user);
		}
		
		model.addAttribute("msg", "Thank you for registration... Now you can login..");
		return "Register";
		
	}
	
	
	
	@GetMapping("/login")
	public String showLoginForm() {
		return "Login";
	}
	
	@PostMapping("/loginProcess")
	public String loginProcess(RedirectAttributes redirectAttributes,HttpServletRequest req,Model model,@RequestParam("name") String name,@RequestParam("email") String email,@RequestParam("password") String pwd) {
		System.out.println(name+email+pwd);
		
		
		User user=service.getUserByEmailAndPwd(email, pwd);
		System.out.println(user);
		
		if(service.isCorrectEmailAndpwd(email, pwd, user)) {
//			String hid=service.generateSHA256Hash(email);
//			User_login u=new User_login();
//			u.setEmail(email);
//			u.setHid(hid);
////			System.out.println(hid);
//			service.setUserLogin(u);
			HttpSession session=req.getSession();
			session.setAttribute("email",email);
			return "redirect:/dashbord";
			}
		
		
		redirectAttributes.addFlashAttribute("LoginError", "Invalid Credentials..");
//		model.addAttribute("LoginError", "Invalid Credentials..");
		return "redirect:/login";
		
	}
	
	
	
	
	@GetMapping("/dashbord")
	public String showDashbord(Model model,HttpServletRequest req,HttpServletResponse res) {
	
		HttpSession session=req.getSession();
		String user_email=(String) session.getAttribute("email");
		User u=service.getUserByEmail(user_email);
		String base64Image = Base64.getEncoder().encodeToString(u.getImageData());
		model.addAttribute("user_image", base64Image);
		
		List<Contact> contacts=contactService.getAllContacts(user_email);
		
//		System.out.println(contacts);
		model.addAttribute("contacts", contacts);
		
		
		return "dashbord";
	}
	
	
	
	

	
	
	@GetMapping("/logout")
	public String Logut(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		String user_email=(String) session.getAttribute("email");
//		User_login curr_user=service.getCurrUserByEmail(user_email);
//		service.deleteCurrentLoginUser(curr_user);
		session.removeAttribute("email");
		return "redirect:/login";
	}
	
	
	
	
}
