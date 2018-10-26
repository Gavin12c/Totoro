package com.hy.utils;

import java.text.DecimalFormat;

public class SpeedUtils {
	
	
	/**
	 * @param total
	 * @param current
	 * @return 百分比进度
	 */
	public static String myPercent(double total,double current){
		DecimalFormat dFormat = new DecimalFormat("##.000");
		String format = dFormat.format((current/total)*100);
		System.out.println(format);
		return format;
	}
	
	public static void main(String[] args) {
		myPercent(2000, 100);
	}
	
}
