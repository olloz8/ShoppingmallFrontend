package eCommerce.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eCommerce.DAO.CartDAO;
import eCommerce.DAO.OrderDAO;
import eCommerce.DAO.ProductDAO;
import eCommerce.model.CartItem;
import eCommerce.model.Product;

@Controller
public class OrderController
{
	@Autowired
	CartDAO cartDAO;
	
	
	@RequestMapping(value="/myorders")
	public String showOrders(Model m , HttpSession session)
	{
		String username=(String)session.getAttribute("username");
        List<CartItem> paidItemList = cartDAO.ConfirmCartItems(username);
		
		m.addAttribute("paidItemList", paidItemList);
		
		m.addAttribute("pageinfo", "My Orders-");
		
		return "MyOrders";
		
	}

}