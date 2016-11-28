package com.shop.app.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.shop.app.domain.SellerVO;
import com.shop.app.service.SellerService;

@Controller
@RequestMapping(value="/seller")
public class SellerController {

private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	SellerService sellerService;

	/* ----------------------------------------------------------------------------------------------------- */ 
	
	// ### 회원가입 메인
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainCheckout(Model model){
		
		logger.info("checkout 실행");

	// return "sudo_checkout2";
	return "/login/register_seller";
	}	
	
	/* ----------------------------------------------------------------------------------------------------- */
	
	// 아이디 중복체크 
	@RequestMapping(value="/s_checkid", method=RequestMethod.POST)
	public void checkid(@RequestBody String userid, HttpServletResponse response) throws IOException{
		
		logger.info("checkid 실행");
		logger.info("userid" + userid);
		
		// 필요없는 문자열을 제거
		String b_id = userid.substring(0, userid.length()-1);
		
		// DB에서 입력한 문자열 검색
		SellerVO vo = sellerService.read(b_id);
		
		// DB에 있다면 중복...
		if (vo!=null){
			String selectedID = vo.getS_id();
			logger.info("selectedID"+selectedID);
			response.getWriter().print(1);
		}
	}
	
	/* ----------------------------------------------------------------------------------------------------- */
	
	// 이메일 인증번호 발송
	@RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	public void checkEmail(@RequestBody String email, HttpServletResponse response) throws IOException {
		logger.info("email: " + email);
		
		// @ converted to %40 in HTTPPost request
		String convert_email = URLDecoder.decode(email, "UTF-8"); 
		
		// 필요없는 문자열을 제거
		String b_email = convert_email.substring(0, convert_email.length()-1);
		
		// 4자리 인증번호 생성
		// 1. 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)
		// 2. 다섯자리가 넘어가면 1000을 빼준다.			
		int code = (int) (Math.random() * 10000 + 1000); 
		if (code > 10000){
			code = code - 1000;
		}
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(b_email); // 받는 이메일 등록
		
			logger.info("메일 주소 : " + b_email);
		
		message.setSubject("쇼핑몰 인증번호");  // 이메일 제목
		message.setText("본인인증번호는 [ " + code + " ] 입니다. 정확히 입력해주세요");  // 이메일 내용
		
		logger.info("보낸 코드 : " + code);
		mailSender.send(message);  // 이메일 전송
		// model.addAttribute("code", code);
		
		response.getWriter().print(code);
		//return "email_result";
	}
	
	/* ----------------------------------------------------------------------------------------------------- */
	// 회원가입 완료
	@RequestMapping(value="/s_register_result", method=RequestMethod.POST)
	public String login_result(SellerVO vo){
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		sellerService.insert(vo);
		logger.info("회원가입 성공! ");
		return "login_result";
	}
	
	/* ----------------------------------------------------------------------------------------------------- */
	
	// TODO
	
	@RequestMapping(value="s_login", method=RequestMethod.POST)
	public String login(String b_id, String b_pw, HttpServletRequest request, String query){	
		logger.info("login 컨트롤러 실행");
		logger.info("b_id : "+b_id+" , b_pw : "+b_pw);
		if (sellerService.isValidUser(b_id, b_pw)){
			logger.info("로그인 성공");
			HttpSession session = request.getSession(true);
			session.setAttribute("login_id", b_id);
			logger.info("세션 저장 성공! key:login_id, 값 : "+b_id);
			return "redirect:/index";
		} else {
			logger.info("로그인 실패");
			return "redirect:/register";
		}
	}
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("login_id");
		session.invalidate();	
		logger.info("세션 비우기 성공!");
		return "redirect:/"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}
	
	
	
	/* ----------------------------------------------------------------------------------------------------- */
	

	
	
} // end SellerController class