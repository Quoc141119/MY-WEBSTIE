package com.shopdongho.validate;



import java.util.regex.Pattern;



public class ProductValidate {
	public Boolean validate(String soluong) {
		String regex  = "[+-]?[0-9][0-9]*";
		if(Pattern.matches(regex, soluong)) {
			return true;
		}
		return false;
	}
}
