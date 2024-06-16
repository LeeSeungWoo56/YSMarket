package java.market.board;

import java.sql.Date;

public class Report {
	private int reportNo;			//신고번호
	private String reportWriter;	//신고 작성자
	private String reportTitle;		//신고 제목
	private String reportContent;	//신고 댓글
	private Date reportDate;		//신고 날짜
	private String reportCategory;	//신고 카테고리
	private int productId;			//상품 id
	private int tradeId;			//거래 id
	private String completed;		//작성 완료
}