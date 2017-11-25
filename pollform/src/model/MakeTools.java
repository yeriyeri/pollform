package model;

import java.util.ArrayList;
import java.util.List;

public class MakeTools {
	public List<String> makeTool(String largeType, String smallType, String qAmount) {
		int amount = Integer.parseInt(qAmount);
		List<String> result = new ArrayList<String>();
		// 선다형
		if(largeType.equals("lType1")) {
			// 4지선다 ①②③④⑤
			if(smallType.equals("sType1")) {
				try {
				for(int i = 0; i < amount; i++) {
					result.add(i, "<h5>Question " + (i+1) +")"+ " <input type=\"text\" name=\"questionNumber" + (i+1) + "\"" +"</h5>"
									+"<br/><br/>① " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_1\">"
									+"<br/>② " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_2\">"
									+"<br/>③ " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_3\">"
									+"<br/>④ " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_4\">" + "<br/><br/><br/>"
									);
				}
				} catch(ArrayIndexOutOfBoundsException e) {
					System.out.println("배열 참조 에러 발생" + e);
				}
			} else { // 5지선다
				try {
					for(int i = 0; i < amount; i++) {
						result.add(i, "<h5>Question " + (i+1) +")"+ " <input type=\"text\" name=\"questionNumber" + (i+1) + "\"" +"</h5>"
										+"<br/><br/>① " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_1\">"
										+"<br/>② " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_1\">"
										+"<br/>③ " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_2\">"
										+"<br/>④ " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_3\">"
										+"<br/>⑤ " + "<input type=\"text\" name=\"answerNumber" + (i+1)+ "_4\">" + "<br/><br/><br/>"
										);
					}
					} catch(ArrayIndexOutOfBoundsException e) {
						System.out.println("배열 참조 에러 발생" + e);
					}
			}
		} else { // 서답형
			// 단답형 20자 이내
			if(smallType.equals("sType3")) {
				try {
					for(int i = 0; i < amount; i++) {
						result.add(i, "<h5>Question " + (i+1) +")"+ " <input type=\"text\" name=\"questionNumber" + (i+1) +"\"</h5>"
										+"<br/><br/>" + "ans. <input type=\"text\" name=\"answerNumber" + (i+1)+ "_1\" onkeyup=\"chkword(this, 20)\">"
									);
					}
					} catch(ArrayIndexOutOfBoundsException e) {
						System.out.println("배열 참조 에러 발생" + e);
					}
			} else { //
				try {
					for(int i = 0; i < amount; i++) {
					}
					} catch(ArrayIndexOutOfBoundsException e) {
						System.out.println("배열 참조 에러 발생" + e);
					}
			}
		}
		return result;
	}

}
