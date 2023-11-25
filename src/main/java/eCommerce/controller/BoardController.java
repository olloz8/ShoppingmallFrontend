package eCommerce.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import eCommerce.DAO.BoardDAO;
import eCommerce.DAO.CommentDAO;
import eCommerce.model.Board;
import eCommerce.model.Comment;

@Controller
public class BoardController {

   @Autowired
   BoardDAO boardDAO;
   @Autowired
   CommentDAO commentDAO;

   // 게시글 리스트 보기
   @RequestMapping("/board")
   public String showBoard(Model m) {

      Board board = new Board();
      m.addAttribute(board);

      List<Board> listBoards = boardDAO.listBoards();
      m.addAttribute("boardList", listBoards);

      return "Board";
   }

   // 게시글 작성 폼
   @RequestMapping("/boardWrite")
   public String showBoardWriteForm(Model m) {
      m.addAttribute("board", new Board());
      return "BoardWrite";
   }

   // 게시글 보기
   @RequestMapping(value = "/boardView", method = RequestMethod.GET)
   public String viewBoard(@RequestParam("boardId") int boardId, Model model) {
      Board board = boardDAO.getBoard(boardId);
      if (board != null) {
         model.addAttribute("board", board);
         
         // 댓글 목록을 가져와서 모델에 추가
         List<Comment> comments = commentDAO.getCommentsByBoardId(boardId);
         model.addAttribute("comments", comments);
         
         return "BoardView";
      } else {
         return "redirect:/board";
      }
   }

   // 게시글 추가
   @PostMapping("/addBoard")
   public String addBoard(@ModelAttribute("board") Board board) {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String currentCustomerName = authentication.getName();
      board.setCustomerName(currentCustomerName); // 현재 로그인한 사용자의 이름을 게시글 작성자로 설정
      boolean isAdded = boardDAO.addBoard(board);
      if (isAdded) {
         return "redirect:/board";
      } else {
         return "redirect:/boardWrite";
      }
   }

   // 게시글 수정 폼 보여주기
   @RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
   public String showUpdateBoardForm(@RequestParam("boardId") int boardId, Model model) {
       Board board = boardDAO.getBoard(boardId);
       if (board != null) {
           model.addAttribute("board", board);
           return "BoardUpdate";
       } else {
           return "redirect:/board";
       }
   }

   // 게시글 수정 처리
   @PostMapping("/updateBoard")
   
   
   public String updateBoard(@ModelAttribute("board") Board board) {
       boolean isUpdated = boardDAO.updateBoard(board);
       if (isUpdated) {
           return "redirect:/boardView?boardId=" + board.getBoardId();
       } else {
           return "ErrorPage";
       }
   }

   // 게시글 삭제
   @RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
   public String deleteBoard(@RequestParam("boardId") int boardId) {
       boolean isDeleted = boardDAO.deleteBoard(boardId);
       if (isDeleted) {
           return "redirect:/board";
       } else {
           return "redirect:/board";
       }
   }
   
}



