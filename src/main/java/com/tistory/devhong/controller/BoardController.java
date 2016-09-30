package com.tistory.devhong.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tistory.devhong.service.BoardService;
import com.tistory.devhong.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.setViewName("board/boardList");
		List<BoardVO> list = service.listAll();
		mav.addObject("result",list);
		System.out.println(list);
		return mav;
	}
	
	@RequestMapping(value="/boardWrite", method = RequestMethod.GET)
	public String writeBoard() throws Exception{
		return "board/boardWrite";
	}
	
	
	@RequestMapping(value="/boardRegist", method = RequestMethod.POST)
	public ModelAndView registArticle(BoardVO vo)throws Exception{
		int success = 0;
		ModelAndView mav = new ModelAndView("jsonView");
		success = service.regist(vo);
		if(success>0){
			mav.addObject("result","S");
		} else{
			mav.addObject("result","F");
		}
		return mav;
	}
	
	@RequestMapping(value = "/boardRead", method = RequestMethod.GET)
	public ModelAndView boardRead(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		String getBnoParam = request.getParameter("bno");
		int bno = -1;
		mav.setViewName("board/boardRead");
		if(getBnoParam!=null && !getBnoParam.equals("")){
			bno = Integer.parseInt(getBnoParam);
		}
		System.out.println("bno : " + bno);
		BoardVO vo = service.read(bno);
		mav.addObject("result", vo);
		System.out.println(vo);
		return mav;
	}
	
}
