package model;

import java.util.ArrayList;
import java.util.List;

public class GetResearch {
	public List<String> getResearch(String largeType, String smallType, String qAmount) {
		int amount = Integer.parseInt(qAmount);
		List<String> result = new ArrayList<String>();
		// 선다형
		if(largeType.equals("lType1")) {
			// 4지선다 ①②③④⑤
			if(smallType.equals("sType1")) {
				try {
				for(int i = 0; i < amount; i++) {
					result.add(i, "<div><b>Q " + (i+1) +")"+ " 질문이 입력되어 있습니다. </b><br/><br/>"
									+ "<input type=\"radio\" name=\"group_" + i+1 + "\" checked=\"checked\">" + " 선택지가 입력되어 있습니다.<br/>"
									+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다.<br/>"
									+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다.<br/>"
									+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다."
									+ "</div>");
				}
				} catch(ArrayIndexOutOfBoundsException e) {
					System.out.println("배열 참조 에러 발생" + e);
				}
			} else { // 5지선다
				try {
					for(int i = 0; i < amount; i++) {
						result.add(i, "<div><b>Q " + (i+1) +")"+ " 질문이 입력되어 있습니다. </b><br/><br/>"
										+ "<input type=\"radio\" name=\"group_" + i+1 + "\" checked=\"checked\">" + " 선택지가 입력되어 있습니다.<br/>"
										+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다.<br/>"
										+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다.<br/>"
										+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다.<br/>"
										+ "<input type=\"radio\" name=\"group_" + i+1 + "\">" + " 선택지가 입력되어 있습니다."
										+ "</div>");
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
						result.add(i, "<div><b>Q " + (i+1) +")"+ " 질문이 입력되어 있습니다. </b><br/>"
										+"<br/><br/>" 
								+ "ans. <input type=\"text\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\" onkeyup=\"chkword(this, 20)\">" 
										+"</div>");
					}
					} catch(ArrayIndexOutOfBoundsException e) {
						System.out.println("배열 참조 에러 발생" + e);
					}
			} else { //
				try {
					for(int i = 0; i < amount; i++) {
						result.add(i, "<div><b>Q " + (i+1) +")"+ " 질문이 입력되어 있습니다. </b><br/>"
								+"<br/><br/>" + "ans. <input type=\"textarea\" class=\"stype\" name=\"answerNumber" + (i+1)+ "_1\" >" 
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
