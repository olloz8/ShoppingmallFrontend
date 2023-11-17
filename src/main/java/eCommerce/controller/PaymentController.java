package eCommerce.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import eCommerce.DAO.CartDAO;
import eCommerce.DAO.OrderDAO;
import eCommerce.DAO.ProductDAO;
import eCommerce.DAO.UserDAO;
import eCommerce.model.CartItem;
import eCommerce.model.OrderDetail;
import eCommerce.model.UserDetail;

@Controller
public class PaymentController 
{
	@Autowired 
	CartDAO cartDAO;
	
	@Autowired 
	ProductDAO productDAO;
	
	@Autowired 
	UserDAO userDAO;
	
	@Autowired
	OrderDAO orderDAO;
	
	@RequestMapping("/checkout")
	public String checkOut(Model m, HttpSession session)
	{
		String username=(String)session.getAttribute("username");
        List<CartItem> cartItemList = cartDAO.listCartItems(username);
		
		m.addAttribute("cartItemList", cartItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(cartItemList));
		
		UserDetail userDetail = userDAO.getUser(username);
		
		String address = userDetail.getCustomerAddr();
		m.addAttribute("addr", address);
		
		m.addAttribute("pageinfo", "My Cart-");
		
		
		return "OrderConfirm";
	}
	
	@RequestMapping(value="/updateAddress", method=RequestMethod.POST)
	public String updateAddress(@RequestParam("addr")String addr, Model m,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
        List<CartItem> cartItemList = cartDAO.listCartItems(username);
		
		m.addAttribute("cartItemList", cartItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(cartItemList));
		
		UserDetail userDetail = userDAO.getUser(username);
		userDetail.setCustomerAddr(addr);
		userDAO.updateAddress(userDetail);
		
		String address = userDetail.getCustomerAddr();
		m.addAttribute("addr", address);
		
		m.addAttribute("pageinfo", "My Cart-");
		
		return "OrderConfirm";
	}
	
	@RequestMapping(value="/payment")
	public String paymentPage(Model m , HttpSession session)
	{
		m.addAttribute("pageinfo", "Payment-");
		return "Payment";
	}
	
	@RequestMapping(value="/receipt", method=RequestMethod.POST)
	public String generateReceipt(@RequestParam("pmode")String pmode,Model m , HttpSession session)
	{
		String username=(String) session.getAttribute("username");
		
		OrderDetail orderDetail = new OrderDetail();
		
		orderDetail.setOrderDate(new java.util.Date());
		orderDetail.setShippingAddr(userDAO.getUser(username).getCustomerAddr());
        orderDetail.setTranType(pmode);
        orderDetail.setUserName(username);
        
        List<CartItem> cartItemList = cartDAO.listCartItems(username);
		
		m.addAttribute("cartItemList", cartItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(cartItemList));
		
		UserDetail userDetail = userDAO.getUser(username);
        
        orderDetail.setTotalAmount(this.getGrandTotal(cartDAO.listCartItems(username)));
        
        orderDAO.saveOrder(orderDetail);
        orderDAO.updateCart(username);
        
        m.addAttribute("orderDetail", orderDetail);
        
        m.addAttribute("pageinfo", "Receipt-");
		
		return "Receipt";
	}
	
	public int getGrandTotal(List<CartItem> cartList)
	{
		int grandTotal=0,count=0;
		
		while(count<cartList.size())
		{
			grandTotal=grandTotal+(cartList.get(count).getQuantity()*cartList.get(count).getPrice());
			count++;
		}
		
		return grandTotal;
	}

}