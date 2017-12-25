package model;

import java.util.ArrayList;
import java.util.List;

public class FindCtg {
	public static List<String> Ctg(String strlCtg, String strsCtg) {
	String lCtg="nothing";
	String sCtg="nothing";
	List<String> strs = new ArrayList<String>();
	if(strlCtg.equals("lCtg1"))
		lCtg = "교육";
	else if(strlCtg.equals("lCtg2"))
		lCtg = "문화";
	else if(strlCtg.equals("lCtg3"))
		lCtg = "매체";
	else if(strlCtg.equals("lCtg4"))
		lCtg = "사회";
	else if(strlCtg.equals("lCtg5"))
		lCtg = "정치";
	else if(strlCtg.equals("lCtg6"))
		lCtg = "경제/산업";
	else if(strlCtg.equals("lCtg7"))
		lCtg = "라이프스타일";
	else if(strlCtg.equals("lCtg8"))
		lCtg = "특수계층조사";
	else if(strlCtg.equals("lCtg9"))
		lCtg = "기타";
	
	if(strsCtg.equals("sCtg1"))
		sCtg = "학교 교육";
	else if(strsCtg.equals("sCtg2"))
	sCtg = "교육 일반";
	else if(strsCtg.equals("sCtg3"))
		sCtg = "문학 도서";
	else if(strsCtg.equals("sCtg4"))
		sCtg = "순수예술";
	else if(strsCtg.equals("sCtg5"))
		sCtg = "영화/가요/연예";
	else if(strsCtg.equals("sCtg6"))
		sCtg = "문화 일반";
	else if(strsCtg.equals("sCtg7"))
		sCtg = "TV";
	else if(strsCtg.equals("sCtg8"))
		sCtg = "라디오";
	else if(strsCtg.equals("sCtg9"))
		sCtg = "신문";
	else if(strsCtg.equals("sCtg10"))
		sCtg = "기타 매체";
	else if(strsCtg.equals("sCtg11"))
		sCtg = "복지";
	else if(strsCtg.equals("sCtg12"))
		sCtg = "자연/환경";
	else if(strsCtg.equals("sCtg13"))
		sCtg = "사회 일반";
	else if(strsCtg.equals("sCtg14"))
		sCtg = "국방";
	else if(strsCtg.equals("sCtg15"))
		sCtg = "국회";
	else if(strsCtg.equals("sCtg16"))
		sCtg = "대통령";
	else if(strsCtg.equals("sCtg17"))
		sCtg = "사법/치안";
	else if(strsCtg.equals("sCtg18"))
		sCtg = "정당";
	else if(strsCtg.equals("sCtg19"))
		sCtg = "정부";
	else if(strsCtg.equals("sCtg20"))
		sCtg = "행정";
	else if(strsCtg.equals("sCtg21"))
		sCtg = "정치 일반";
	else if(strsCtg.equals("sCtg22"))
		sCtg = "건설";
	else if(strsCtg.equals("sCtg23"))
		sCtg = "과학";
	else if(strsCtg.equals("sCtg24"))
		sCtg = "교통";
	else if(strsCtg.equals("sCtg25"))
		sCtg = "금융";
	else if(strsCtg.equals("sCtg26"))
		sCtg = "기업";
	else if(strsCtg.equals("sCtg27"))
		sCtg = "대외경제/무역";
	else if(strsCtg.equals("sCtg28"))
		sCtg = "부동산";
	else if(strsCtg.equals("sCtg29"))
		sCtg = "경제 일반";
	else if(strsCtg.equals("sCtg30"))
		sCtg = "산업 일반";
	else if(strsCtg.equals("sCtg31"))
		sCtg = "가정/결혼";
	else if(strsCtg.equals("sCtg32"))
		sCtg = "관광";
	else if(strsCtg.equals("sCtg33"))
		sCtg = "소비";
	else if(strsCtg.equals("sCtg34"))
		sCtg = "여가";
	else if(strsCtg.equals("sCtg35"))
		sCtg = "정보";
	else if(strsCtg.equals("sCtg36"))
		sCtg = "직장";
	else if(strsCtg.equals("sCtg37"))
		sCtg = "정보/통신";
	else if(strsCtg.equals("sCtg38"))
		sCtg = "기타 일반";
	else if(strsCtg.equals("sCtg39"))
		sCtg = "교포/외국인";
	else if(strsCtg.equals("sCtg40"))
		sCtg = "노인";
	else if(strsCtg.equals("sCtg41"))
		sCtg = "성인";
	else if(strsCtg.equals("sCtg42"))
		sCtg = "아동";
	else if(strsCtg.equals("sCtg43"))
		sCtg = "장애인";
	else if(strsCtg.equals("sCtg44"))
		sCtg = "청소년";
	else if(strsCtg.equals("sCtg45"))
		sCtg = "복지";
	else
		sCtg = "기타";
	
	strs.add(lCtg);
	strs.add(sCtg);
	return (strs);
	}
}
