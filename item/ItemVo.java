package item;

public class ItemVo {
	private String m_name;			// 물건 이름
	private String m_place;			// 물건 판매장소
	private int m_price;			// 물건 가격
	private String m_image;			// 물건 사진
	private String m_buy_date;	    // 물건 구매일
	private String m_content;		// 물건 설명
	private int m_readcount;		// 조회수
	private int m_main_catgory;		// 책 대분류
	
	public ItemVo(String m_name, String m_place, int m_price, String m_image, String m_publish_date, String m_content,
			int m_readcount, int m_main_catgory) {
		this.m_name = m_name;
		this.m_place = m_place;
		this.m_price = m_price;
		this.m_image = m_image;
		this.m_buy_date = m_publish_date;
		this.m_content = m_content;
		this.m_readcount = m_readcount;
		this.m_main_catgory = m_main_catgory;
	}

	@Override
	public String toString() {
		return "ItemVo [m_name=" + m_name + ", m_seller=" + m_place + ", m_price=" + m_price + ", m_image=" + m_image
				+ ", m_publish_date=" + m_buy_date + ", m_content=" + m_content + ", m_readcount=" + m_readcount
				+ ", m_main_catgory=" + m_main_catgory + "]";
	}
}
