package org.nv.dom.util;

import java.util.Arrays;
import java.util.List;

import org.apdplat.word.WordSegmenter;
import org.apdplat.word.dictionary.DictionaryFactory;
import org.apdplat.word.segmentation.Word;
import org.apdplat.word.util.WordConfTools;

/**
 * <p>文本工具类（主要用于nv文本处理）</p>
 * 2016年8月10日上午3:27:27
 * @author: jack3173
 */
public class TextUtil {
	
	private static String filePath = ConfigUtil.getVersionConfigProperty("img.filepath");
	
	private static List<String> word = Arrays.asList("一","二","三","四","五","六","七","八","九","十");
	
	/**
	 * <p>统计字数</p>
	 * 
	 */
	
	public static Integer wordCount(String content){
		WordConfTools.set("dic.path", filePath+"nv_dict.txt");
        DictionaryFactory.reload();
        List<Word> words = WordSegmenter.segWithStopWords(content);
        return words.size();
	}
	
	public static int strToNum(String str){
		return str.length() == 1 ? word.indexOf(str) + 1 : word.indexOf(str.substring(str.length()-1, str.length())) + 11;
	}
	
	public static String numToStr(int num){
		return num <= 10 ? word.get(num-1) : "十" + word.get(num-11);
	}
	
	public static String numToLetter(int num){
		return (char) (num + 65) + "";
	}

}
