package com.shop.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class EmailCertifyController {

	private static final Logger logger = LoggerFactory.getLogger(EmailCertifyController.class);

	@Autowired
	private JavaMailSenderImpl mailSender;

	
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public void openEmail(Model model) {
	}

	// 회원가입 양식 호출!!
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String openIndex(Model model) {
		return "login1";
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String checkEmail(Model model, String email) {
		
		// 4자리 인증번호 생성
		// 1. 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)
		// 2. 다섯자리가 넘어가면 1000을 빼준다.			
		int code = (int) (Math.random() * 10000 + 1000); 
		if (code > 10000){
			code = code - 1000;
		}
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); // 받는 이메일 등록
		
			logger.info("메일 주소 : " + email);
		
		message.setSubject("쇼핑몰 인증번호");  // 이메일 제목
		message.setText("인증번호 : " + code);  // 이메일 내용
		
			logger.info("보낸 코드 : " + code);
		
		mailSender.send(message);  // 이메일 전송
		model.addAttribute("code", code);
		
		return "email_result";
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////


}
