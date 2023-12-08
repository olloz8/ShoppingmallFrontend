package eCommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import eCommerce.DAO.UserDAO;
import eCommerce.model.UserDetail;

@Controller
public class RegisterController 
{
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerUser(@RequestParam("username")String username,@RequestParam("customerName")String customerName, @RequestParam("email")String email, 
			@RequestParam("customerAddr")String customerAddr, @RequestParam("password")String password)
	{
		UserDetail user = new UserDetail();
		user.setUserName(username);
		user.setCustomerAddr(customerAddr);
		user.setCustomerName(customerName);
		user.setEmail(email);
		user.setPassword(password);
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		userDAO.registerUser(user);
	
		return "Success";
	}
	
	@RequestMapping(value="/success")
	public String showSuccessPage()
	{
		return "Success";
	}

}

