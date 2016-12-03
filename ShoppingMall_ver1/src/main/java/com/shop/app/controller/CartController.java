package com.shop.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.app.domain.BuyerVO;
import com.shop.app.domain.CartVO;
import com.shop.app.domain.OrderVO;
import com.shop.app.service.BuyerService;
import com.shop.app.service.CartService;
import com.shop.app.service.OrderService;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartService cartService;
	
	@Autowired
	BuyerService buyerService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="insertCart", method=RequestMethod.GET)
	public String insertCart(CartVO vo){
		logger.info("insertCart 컨트롤러 실행");
		cartService.insertCart(vo);
		logger.info("카트 인서트 성공");
		return "redirect:selectCart";
	}
	
	@RequestMapping(value="selectCart", method=RequestMethod.GET)
	public String selectCart(Model model){
		logger.info("selectCart 컨트롤러 실행");
		// TODO: 로그인 세션으로 b_id 줘야함.. 임시로 aaaa해놈
		String b_id="aaaa";
		List<CartVO> list = cartService.read(b_id);
		if (list.size()!=0){
			list.get(0).getBuy_cnt();
			model.addAttribute("cartList", list);
			return "test_cart";	
		} else {
			logger.info("장바구니빔... 예외처리 추가 필요함");
			return "test_emptyCart";
		}
		
	}
	
	////////////////////////////////////////////////////////////////
	@RequestMapping(value="selectCart2", method=RequestMethod.GET)
	public String selectCart2(Model model){
		logger.info("selectCart 컨트롤러 실행");
		// TODO: 로그인 세션으로 b_id 줘야함.. 임시로 aaaa해놈
		String b_id="aaaa";
		List<CartVO> list = cartService.read(b_id);
		list.get(0).getBuy_cnt();
		model.addAttribute("cartList", list);
	//	return "test_cart";
		return "sudo_cart2";
	}
	/////////////////////////////////////////////////////////////////

	@RequestMapping(value="deleteCart", method=RequestMethod.POST)
	public void deleteCart(@RequestBody int c_no, HttpServletResponse response) throws IOException{
		logger.info("deleteCart 컨트롤러 실행");
		logger.info("c_no : "+c_no);
		int result = cartService.deleteCart(c_no);
		if (result==1){
			response.getWriter().print(1);
			logger.info("장바구니 삭제 성공");
		} else {
			response.getWriter().print(2);
			logger.info("장바구니 삭제 실패");
		}
	}
	
	@RequestMapping(value="updateCartBuyCnt", method=RequestMethod.GET)
	public void updateCart(int c_no, int buy_cnt, HttpServletResponse response) throws IOException{
		cartService.updateBuyCnt(c_no, buy_cnt);
		logger.info("수량 업데이트 성공");
		CartVO vo = cartService.readCart(c_no);
		int count = vo.getBuy_cnt(); 
		int price = vo.getP_price();
		int totalPricePerItem = count*price;
		logger.info("updated : "+totalPricePerItem);
		response.getWriter().print(totalPricePerItem);
	}
	
	@RequestMapping(value="cartTossOrder", method=RequestMethod.POST)
	public String tossToOrder(String c_no, Model model) throws IOException{
		int totalPriceForOrder = 0; // 리스트 합계금액 저장하는변수
		int shippingCharge = 3000; // 배송비(임의로 정함 나중에 수정 필요)
		logger.info("분리될 C_NO들 : "+c_no);
		String[] listCNO = c_no.split(",");
		for (String x : listCNO){
			logger.info("분리된 값 : "+x);
		}
		// 카트에서 선택된 아이템들을 리스트로 넘김
		List<CartVO> cartList = new ArrayList<>();
		for (int i = 0; i<listCNO.length; i++){
			CartVO vo = cartService.readCart(Integer.parseInt(listCNO[i])); // 인트로변환
			totalPriceForOrder +=  vo.getBuy_cnt()*vo.getP_price(); // 총계산
			if (vo != null) {
				cartList.add(vo);
			}
		} 
		
		// 주문자 정보 가져옴 ( 임시로 asdf 아이디로 해놓음, 나중에 세션으로 바꾸기)
		String buyerID = "asdf";
		BuyerVO vo = buyerService.read(buyerID);
		String registedZipCode = vo.getB_zip();
		String registedAddr1 = vo.getB_addr1();
		String registedAddr2 = vo.getB_addr2();
		
		model.addAttribute("ListForOrder", cartList);
		model.addAttribute("totalCountForOrder", cartList.size());
		model.addAttribute("totalProductPriceForOrder", totalPriceForOrder);
		model.addAttribute("miledTobeAdded", totalPriceForOrder*0.01);
		model.addAttribute("Shipping", shippingCharge);
		model.addAttribute("FinalPriceForOrder", shippingCharge+totalPriceForOrder);
		model.addAttribute("registedZip", registedZipCode);
		model.addAttribute("registedAddr1", registedAddr1);
		model.addAttribute("registedAddr2", registedAddr2);
		model.addAttribute("buyerNAME", vo.getB_name());
		model.addAttribute("buyerHP", vo.getB_phone());
		model.addAttribute("buyerEmail", vo.getB_email());
		model.addAttribute("b_id", vo.getB_id());
		return "test_order";	
	}
	
	@RequestMapping(value="readyForBill", method=RequestMethod.POST)
		public String openBill(String c_no, Model model, OrderVO vo, HttpServletResponse response, HttpServletRequest request) throws IOException{
		int buyNO = 0;
		// 뒤로가기 버튼 누르고 다시 submit 해서 중복 주문 방지하는거 방지용 session
		// 참고 - OrderInterceptor 클래스
		
		logger.info("주문 받은 c_no : " +c_no);
			// 주문번호를 생성하기위해 OrderVO객체를 s_tbl_order 테이블에 넣음
			int result = orderService.insertOrder(vo);
			logger.info("Order 테이블에 insert 성공!");
			if (result == 1){ // 성공하면
				// (로그인했다고 가정한)사용자의 아이디를 이용해서 s_tbl_order 테이블에서 생성된 buyNO를 얻음
				buyNO = orderService.getBuyNo(vo.getB_id());
				logger.info("Order 테이블에서 buyNO 불러오기 성공! 불러온 주문번호(buy_no) : "+buyNO );
				if (buyNO>=0){ // 성공하면
					String[] listCNO = c_no.split(","); // 주문정보에서 얻은 c_no배열을 쪼개고 배열화
					for (int i=0; i<listCNO.length; i++){ // 배열의 길이만큼
						cartService.updateBuyNo(buyNO, Integer.parseInt(listCNO[i])); // 장바구니에 주문번호를넣음
						logger.info("Cart 테이블에 buy_no 업데이트 성공!");
					}
				}
			}
			HttpSession session = request.getSession();
			session.setAttribute("ordered", "ordered");
			logger.info("주문 성공!, 주문번호 : "+buyNO );
			return "test_order_complete";
		}
	
	@RequestMapping(value="test_bill", method=RequestMethod.GET)
	public String billPop(HttpServletRequest request) {
		// 이중 submit 방지용 세션
		HttpSession session = request.getSession();
		Object id = session.getAttribute("ordered");
		logger.info("세션 "+id);
		if (id=="ordered"){
			// 세션이 ordered면
			return "test_xbill"; // 이미 주문됨.
		} else {
			// 세션이 ordered가 아니면 
			return "test_bill";  // 주문성공
		}
	}
	
}
