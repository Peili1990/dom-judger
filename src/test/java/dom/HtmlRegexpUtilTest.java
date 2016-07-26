package dom;

import org.junit.Test;
import org.nv.dom.util.HtmlRegexpUtil;

public class HtmlRegexpUtilTest {
	
	@Test
	public void test(){
		String str = "本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”";
		String output = HtmlRegexpUtil.replaceTag(str);
		System.out.println(output);
	}
	
	@Test
	public void test1(){
		String str = "本市西部仅&lt两站&lt;br&gt;维多利亚讯&";
		String output = HtmlRegexpUtil.recoverTag(str);
		System.out.println(output);
	}

}