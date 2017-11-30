package model;

import java.util.ArrayList;
import java.util.List;

public class MakeWebTools {
	public List<String> makeWebTool(String largeType, String smallType, String qAmount) {
		int amount = Integer.parseInt(qAmount);
		List<String> result = new ArrayList<String>();
		// 선다형
		if(largeType.equals("lType1")) {
			if(smallType.equals("sType1")) {// 4지선다 ①②③④⑤
				try {
				for(int i = 0; i < amount; i++) {
					result.add(i, "<div><b>Question " + (i+1) +")"+ " <input type=\"text\" class=\"stype\" name=\"questionNumber" + (i+1) + "\"" +"</b>"
									+"<br/><br/>① " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\">"
									+"<br/>② " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_2\">"
									+"<br/>③ " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_3\">"
									+"<br/>④ " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_4\">" + "<br/><br/><br/>" +
									"</div>");
				}
				} catch(ArrayIndexOutOfBoundsException e) {
					System.out.println("배열 참조 에러 발생" + e);
				}
			} else { // 5지선다
				try {
					for(int i = 0; i < amount; i++) {
						result.add(i, "<div><b>Question " + (i+1) +")"+ " <input type=\"text\" class=\"stype\" name=\"questionNumber" + (i+1) + "\"" +"</b>"
										+"<br/><br/>① " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\">"
										+"<br/>② " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\">"
										+"<br/>③ " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_2\">"
										+"<br/>④ " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_3\">"
										+"<br/>⑤ " + "<input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_4\">" + "<br/><br/><br/>" +
										"</div>");
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
						result.add(i, "<div><b>Question " + (i+1) +")"+ " <input type=\"text\" class=\"stype2\" name=\"questionNumber" + (i+1) +"\"</b>"
										+"<br/><br/>" 
								//+ "ans. <input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\" onkeyup=\"chkword(this, 20)\">" 
										+"</div>");
					}
					} catch(ArrayIndexOutOfBoundsException e) {
						System.out.println("배열 참조 에러 발생" + e);
					}
			} else { //
				try {
					for(int i = 0; i < amount; i++) {
						result.add(i, "<div><b>Question " + (i+1) +")"+ " <input type=\"text\" class=\"stype2\" name=\"questionNumber" + (i+1) +"\"</b>"
								//+"<br/><br/>" + "ans. <input type=\"textarea\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\">" 
								+"</div>");
					}
					} catch(ArrayIndexOutOfBoundsException e) {
						System.out.println("배열 참조 에러 발생" + e);
					}
			}
		}
		return result;
	}

}
