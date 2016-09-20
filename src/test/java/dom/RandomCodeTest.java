package dom;

import org.junit.Test;
import org.nv.dom.util.RandomCodeUtil;
import org.nv.dom.util.RandomCodeUtil.CodeType;

public class RandomCodeTest {
	
	@Test
	public void test(){
		String code = RandomCodeUtil.createRandomCode(6, CodeType.LETTER_NUMBER);
		System.out.println(code);
	}

}
