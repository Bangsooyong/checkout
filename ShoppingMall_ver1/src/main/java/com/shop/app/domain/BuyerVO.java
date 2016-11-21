package com.shop.app.domain;

import java.util.Date;

public class BuyerVO {
	
	public BuyerVO(){};
	
	private int b_no;
	private String b_id;//
	private String b_pw;//
	private String b_name;//
	private int b_gender;//
	private String b_birth;//
	private int b_phone;//
	private String b_email;//
	private String b_zip;//
	private String b_addr1;//
	private String b_addr2;//
	private Date b_reg;
	private int b_mile;

	
///////////////////회원 가입을 위한 매개변수 있는 생성자(마일리지 제외)////////////////////
	public BuyerVO(int b_no, String b_id, String b_pw, String b_name, int b_gender, String b_birth, int b_phone,
			String b_email, String b_zip, String b_addr1, String b_addr2, Date b_reg) {
		super();
		this.b_no = b_no;
		this.b_id = b_id;
		this.b_pw = b_pw;
		this.b_name = b_name;
		this.b_gender = b_gender;
		this.b_birth = b_birth;
		this.b_phone = b_phone;
		this.b_email = b_email;
		this.b_zip = b_zip;
		this.b_addr1 = b_addr1;
		this.b_addr2 = b_addr2;
		this.b_reg = b_reg;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////


	public int getB_no() {
		return b_no;
	}


	public void setB_no(int b_no) {
		this.b_no = b_no;
	}


	public String getB_id() {
		return b_id;
	}


	public void setB_id(String b_id) {
		this.b_id = b_id;
	}


	public String getB_pw() {
		return b_pw;
	}


	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}


	public String getB_name() {
		return b_name;
	}


	public void setB_name(String b_name) {
		this.b_name = b_name;
	}


	public int getB_gender() {
		return b_gender;
	}


	public void setB_gender(int b_gender) {
		this.b_gender = b_gender;
	}


	public String getB_birth() {
		return b_birth;
	}


	public void setB_birth(String b_birth) {
		this.b_birth = b_birth;
	}


	public int getB_phone() {
		return b_phone;
	}


	public void setB_phone(int b_phone) {
		this.b_phone = b_phone;
	}


	public String getB_email() {
		return b_email;
	}


	public void setB_email(String b_email) {
		this.b_email = b_email;
	}


	public String getB_zip() {
		return b_zip;
	}


	public void setB_zip(String b_zip) {
		this.b_zip = b_zip;
	}


	public String getB_addr1() {
		return b_addr1;
	}


	public void setB_addr1(String b_addr1) {
		this.b_addr1 = b_addr1;
	}


	public String getB_addr2() {
		return b_addr2;
	}


	public void setB_addr2(String b_addr2) {
		this.b_addr2 = b_addr2;
	}


	public Date getB_reg() {
		return b_reg;
	}


	public void setB_reg(Date b_reg) {
		this.b_reg = b_reg;
	}

	

	
	
	
	
	
	
}
