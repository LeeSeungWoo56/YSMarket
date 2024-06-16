package java.market.board;

import java.sql.Date;

public class Board {
	private int boardNo;					//게시판 번호
	private String boardWriter;				//게시글 작성자
	private String boardTitle;				//글 제목
	private String boardContent;			
	private Date boardDate;					//글쓴 날짜
	private String boardCategory;			//게시판 카테고리
	private char noticeYn;	
	private String boardOriginalFileName;   //원래 이름
	private String boardRenamedFileName;    //바꾼 이름
}