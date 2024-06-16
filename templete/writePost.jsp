<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 로그인되어 있는지 확인합니다.
    if (session.getAttribute("UserID") == null) {
        // 로그인되어 있지 않은 경우, loginAfter.jsp로 이동합니다.
        response.sendRedirect("/YSMarket/user/loginAfter.jsp");
    }
%>
    <form action="/manager/bookManage/bookRegistPro.ma" method="post" name="registForm" 
    		enctype="multipart/form-data">
		<div class="form-row">
            <div class="form-group col-md-4">
                <label>물건 사진</label>
                <div id="uploadResult">
                    <!-- 도서 이미지가 들어가는 곳 -->
                    <img id="itemImage" width="150px;">
                    <!-- 도서 이미지가 들어가는 곳 -->
                </div>
                <div class="custom-file">
                	<input type="file" class="custom-file-input" name="b_image" id="b_image" 
                    		required="required" accept=".jpg,.png" 
                            onchange="setThumbnail(event);">
                	<label class="custom-file-label" for="b_image">파일 선택</label>
                </div>
            </div>

            <div class="form-row col-md-8">
            	<div class="form-group">
                	<label for="b_name">판매할 물건 : </label>
                	<input type="text" class="form-control" placeholder="판매할 물건을 입력하세요" 
                                name="b_name" id="b_name" required="required">
               	</div>
               	<div class="form-group">
                	<label for="b_catgy">카테고리</label>
                	<input type="text" class="form-control" name="b_catgy" id="b_catgy" 
                    		required="required">ㅇㅇㅇㅇ
               	</div>
              	<div class="form-group">
                	<label for="b_price">물건 판매가격 : </label>
                  	<div class="input-group input-group-merge">
                        <input type="text" class="form-control" placeholder="1000"
                               id="b_price">
                        <span class="input-group-text">원</span>
                    </div>
                </div>
                <div class="form-group">
                	<label for="b_writer">판매장소 : </label>
                	<input type="text" class="form-control" placeholder="판매장소를 적어주세요" name="b_writer" id="b_writer">
              	</div>
                </div>
                <div class="form-group">
                	<label for="b_publish_date">물건 구매 날짜</label>
                	<input type="date" class="form-control" value="2024-06-01" 
                                name="b_publish_date" id="b_publish_date" required="required"/>
              	</div>
                <div class="form-group">
                	<label>물건 상태</label>
                  	<select id="inputState" class="form-control">
                      	<option selected>선택하세요</option>
                     	<option>구매는 했지만 상품 미개봉</option>
                      	<option>사용한 흔적이 거의 없음</option>
                      	<option>사용한 흔적이 남아 있음</option>
                      	<option>파손 또는 훼손 흔적 있음</option>
                  	</select>
                </div>
            </div>
      	</div>

        <div class="form-row">
        	<div class="form-group col-xxl-12">
        		<label for="b_content">물건 설명</label>
        		<textarea class="form-control" rows="8" wrap="off" 
                    	id="b_content" name="b_content" required="required"></textarea>
        	</div>
    	</div>
        <button type="reset" class="btn btn-outline-warning btn-lg">초기화</button>
        <button type="button" class="btn btn-outline-info btn-lg" 
                onClick="window.location.href='/manager/bookManage/bookList.ma'">등록된 도서 목록
        </button>
        <button type="submit" class="btn btn-outline-primary btn-lg">등록</button>
    </form>

	<!-- Script -->
	<script src="/js/vendor/jquery-2.2.4.min.js"></script>
 	<!-- YJ -->
  	<script type="text/javascript">
    	function setThumbnail(event) {
          var reader = new FileReader();

          reader.onload = function(event) {
              var img = $("#bookImage");
              img.attr("src", event.target.result);
              img.attr("class", "img-fluid rounded mx-auto d-block");
              $("#uploadResult").appendChild(img);
          };

          reader.readAsDataURL(event.target.files[0]);
     	 }
  	</script>

    <label for="b_main_catgy">카테고리 대분류</label>
    <select class="main_select" name="b_main_catgy">
        <option value="">전체</option>
    </select>
    
    <label for="b_middle_catgy">카테고리 중분류</label>
    <select class="middle_select" name="b_middle_catgy">
        <option value="">--</option>
    </select>
    <!-- 책, 문구, 의류, 음식, 가구, 가전제품, 기타물품 -->