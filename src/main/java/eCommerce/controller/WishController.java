package eCommerce.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eCommerce.DAO.ProductDAO;
import eCommerce.DAO.WishDAO;
import eCommerce.model.Product;
import eCommerce.model.WishItem;

@Controller
public class WishController 
{
	@Autowired
	WishDAO wishDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping(value="/wish")
	public String showWish(Model m , HttpSession session)
	{
		String username=(String)session.getAttribute("username");
        List<WishItem> wishItemList = wishDAO.listWishItems(username);
		
		m.addAttribute("wishItemList", wishItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(wishItemList));
		m.addAttribute("pageinfo", "My Wish-");
		
		return "Wish";
		
	}
	
	@RequestMapping(value="/addToWish/{productId}")
	
	public String addToWish(@PathVariable("productId")int productId, @RequestParam("quantity")int quantity, HttpSession session,Model m)
	{
		Product product = productDAO.getProduct(productId);
		
		String username=(String)session.getAttribute("username");
		
		WishItem wishItem = new WishItem();
		wishItem.setProductId(product.getProductId());
		wishItem.setProductName(product.getProductName());
		wishItem.setQuantity(quantity);
		wishItem.setPrice(product.getPrice());
		wishItem.setPaymentStatus("NP");
		wishItem.setUsername(username);
		
		wishDAO.addWishItem(wishItem);
		
		List<WishItem> wishItemList = wishDAO.listWishItems(username);
		
		m.addAttribute("wishItemList", wishItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(wishItemList));
		m.addAttribute("pageinfo", "My Wish-");
		
		
		return "Wish";
	}
	
	@RequestMapping(value="/updateWishItem/{wishItemId}")
	public String updateWishItem(@PathVariable("wishItemId")int wishItemId , @RequestParam("quantity")int quantity,Model m , HttpSession session)
	{
		WishItem wishItem = wishDAO.getWishItem(wishItemId);
		wishItem.setQuantity(quantity);
		wishDAO.updateWishItem(wishItem);
		
		String username=(String)session.getAttribute("username");
		List<WishItem> wishItemList = wishDAO.listWishItems(username);
		
		m.addAttribute("wishItemList", wishItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(wishItemList));
		m.addAttribute("pageinfo", "My Wish-");
		
		
		return "Wish";
	}
	
	@RequestMapping(value="/deleteWishItem/{wishItemId}")
	public String updateWishItem(@PathVariable("wishItemId")int wishItemId ,Model m , HttpSession session)
	{
		WishItem wishItem = wishDAO.getWishItem(wishItemId);
		
		wishDAO.deleteWishItem(wishItem);
		
		String username=(String)session.getAttribute("username");
		List<WishItem> wishItemList = wishDAO.listWishItems(username);
		
		m.addAttribute("wishItemList", wishItemList);
		m.addAttribute("grandTotal", this.getGrandTotal(wishItemList));
		m.addAttribute("pageinfo", "My Wish-");
		
		
		return "Wish";
	}
	
	public int getGrandTotal(List<WishItem> wishList)
	{
		int grandTotal=0,count=0;
		
		while(count<wishList.size())
		{
			grandTotal=grandTotal+(wishList.get(count).getQuantity()*wishList.get(count).getPrice());
			count++;
		}
		
		return grandTotal;
	}

}
