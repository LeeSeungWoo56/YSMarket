package java.market.board;

import java.sql.Date;

public class BoardComment {
	private int commentNo;			//댓글 번호
	private String commentWriter;   //댓글 작성자
	private int boardNo;			//게시판 번호
	private Date commentDate;		//댓글 단 날짜
	private int commentNoFK;		//댓글 추가
	private String commentContent;  //답글
}