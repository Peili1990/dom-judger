package org.nv.dom.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class RandomUtil {
	
	private static Integer[] arrays = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
            24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,
            44,45,46,47,48,49,50,51,52,53,54};
	
	public static List<Integer> randomList(int length){
		List<Integer> list = Arrays.asList(arrays).subList(0, length);
		Collections.shuffle(list);
		return list;
	}

}
