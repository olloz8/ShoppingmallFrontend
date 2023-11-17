package eCommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import eCommerce.DAO.BoardDAO;
import eCommerce.DAO.CommentDAO;
import eCommerce.model.Comment;

@Controller
public class CommentController {

	@Autowired
	private CommentDAO commentDAO;

	@PostMapping("/addComment")
	public String addComment(@ModelAttribute("comment") Comment comment) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentCustomerName = authentication.getName();
		comment.setCustomerName(currentCustomerName); // 현재 로그인한 사용자의 이름을 댓글 작성자로 설정
		boolean isAdded = commentDAO.addComment(comment);
		if (isAdded) {
			return "redirect:/boardView?boardId=" + comment.getBoardId();
		} else {
			return "ErrorPage";
		}
	}

	@PostMapping("/updateComment")
	public String updateComment(@ModelAttribute("comment") Comment comment, @RequestParam("boardId") int boardId,
			@RequestParam("customerName") String customerName, RedirectAttributes redirectAttributes) {
		comment.setCustomerName(customerName);
		boolean isUpdated = commentDAO.updateComment(comment);
		if (isUpdated) {
			redirectAttributes.addAttribute("boardId", boardId);
			return "redirect:/boardView";
		} else {
			return "redirect:/boardView";
		}
	}

	@PostMapping("/deleteComment")
	public String deleteComment(@RequestParam("commentId") int commentId, @RequestParam("boardId") int boardId,
			RedirectAttributes redirectAttributes) {
		boolean isDeleted = commentDAO.deleteComment(commentId);
		if (isDeleted) {
			redirectAttributes.addAttribute("boardId", boardId);
			return "redirect:/boardView";
		} else {
			return "redirect:/boardView";
		}
	}

}



