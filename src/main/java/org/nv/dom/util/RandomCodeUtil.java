/**
 * org.rightoo.util
 * RandomCodeUtil.java
 * 2014年12月23日 下午2:33:52
 * @author: z```s
 */
package org.nv.dom.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/**
 * <p></p>
 * 2014年12月23日 下午2:33:52
 * @author: z```s
 */
public class RandomCodeUtil {

	//小写字母集合
	private static String[] lowercase = { "a", "b", "c", "d", "e", "f", "g",
			"h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
			"u", "v", "w", "x", "y", "z" };

	//大写字母集合
	private static String[] capital = { "A", "B", "C", "D", "E", "F", "G", "H",
			"I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
			"V", "W", "X", "Y", "Z" };
	
	//数字集合
	private static String[] number = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
	
	//符号集合
	private static String[] sign = { "~", "!", "@", "#", "$", "%", "^", "&",
			"*", "(", ")", "_", "+", "`", "-", "=", "{", "}", "|", ":", "\"",
			"<", ">", "?", "[", "]", "\\", ";", "'", ",", ".", "/" };
	
	private static String[] defaults = {"1", "2", "3", "a", "b", "b"};
	
	//静态随机数
	private static Random random = new Random();
	
	/**
	 * <p></p>
	 * @param length
	 * @param type
	 * @return
	 * 2014年12月23日 下午5:30:29
	 * @author: z```s
	 */
	public static String createRandomCode(int length, CodeType type) {
		List<String> temp = new ArrayList<String>();
		StringBuilder code = new StringBuilder(length);
		switch (type) {
		case LETTER:
			temp.addAll(Arrays.asList(lowercase));
			break;
		case CAPITAL:
			temp.addAll(Arrays.asList(capital));
			break;
		case NUMBER:
			temp.addAll(Arrays.asList(number));
			break;
		case SIGN:
			temp.addAll(Arrays.asList(sign));
			break;
		case LETTER_CAPITAL:
			temp.addAll(Arrays.asList(lowercase));
			temp.addAll(Arrays.asList(capital));
			break;
		case LETTER_NUMBER:
			temp.addAll(Arrays.asList(lowercase));
			temp.addAll(Arrays.asList(number));
			break;
		case CAPITAL_NUMBER:
			temp.addAll(Arrays.asList(capital));
			temp.addAll(Arrays.asList(number));
			break;
		case LETTER_CAPITAL_NUMBER:
			temp.addAll(Arrays.asList(lowercase));
			temp.addAll(Arrays.asList(capital));
			temp.addAll(Arrays.asList(number));
			break;
		case LETTER_CAPITAL_NUMBER_SIGN:
			temp.addAll(Arrays.asList(lowercase));
			temp.addAll(Arrays.asList(capital));
			temp.addAll(Arrays.asList(number));
			temp.addAll(Arrays.asList(sign));
			break;
		default:
			temp.addAll(Arrays.asList(defaults));
			break;
		}
		for (int i = 0; i < length; i++) {
			code.append(temp.get(random.nextInt(temp.size())));
		}
		return code.toString();
	}
	
	public enum CodeType {
		LETTER, //小写字母型
		CAPITAL, //大写字母型
		NUMBER, //数字型
		SIGN, //符号型
		LETTER_CAPITAL, //小写+大写字母型
		LETTER_NUMBER, //小写字母+数字型
		CAPITAL_NUMBER, //大写字母+数字型
		LETTER_CAPITAL_NUMBER, //小写+大写+数字型
		LETTER_CAPITAL_NUMBER_SIGN //小写+大写+数字+符号型
	}
	
}
