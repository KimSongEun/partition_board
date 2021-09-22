package kh.my.jo.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.my.jo.board.model.service.BoardService;
import kh.my.jo.board.model.vo.Board;
import kh.my.jo.common.Command;

public class BoardContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		// bno 를 가지고 DB에서 하나 읽어와야 함.  
		int bno = Integer.parseInt(no);
		// bno는 pk 로 결과는 Board 모양 1개일 것임.
		Board vo = new BoardService().getBoard(bno);
		request.setAttribute("boardvo", vo);		
	}

}
