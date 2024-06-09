<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 카테고리 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <title>중단</title>
</head>
<body>
    <section>
        <div class="mainCategoryDiv">
            <div class="cate1">
                <a href="board.jsp">
                    <div class="categoryLink">
                        <div class="categoryBgAll">
                            <ion-icon class="cateIcon" name="star"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">전체물품</span>
                        </div>
                    </div>
                </a>
                <a href="index.jsp?categoryname=책">
                    <div class="categoryLink">
                        <div class="categoryBg">
                            <ion-icon class="cateIcon" name="book"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">책</span>
                        </div>
                    </div>
                </a>
                <a href="index.jsp?categoryname=문구">
                    <div class="categoryLink">
                        <div class="categoryBg">
                            <ion-icon class="cateIcon" name="pencil"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">문구</span>
                        </div>
                    </div>
                </a>
                <a href="index.jsp?categoryname=의류">
                    <div class="categoryLink">
                        <div class="categoryBg">
                            <ion-icon class="cateIcon" name="shirt"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">의류</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="cate2">
                <a href="index.jsp?categoryname=음식">
                    <div class="categoryLink">
                        <div class="categoryBg">
                            <ion-icon class="cateIcon" name="fast-food"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">음식</span>
                        </div>
                    </div>
                </a>
                <a href="index.jsp?categoryname=가구">
                    <div class="categoryLink">
                        <div class="categoryBg">
                            <ion-icon class="cateIcon" name="bed"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">가구</span>
                        </div>
                    </div>
                </a> 
                <a href="index.jsp?categoryname=가전제품">
                    <div class="categoryLink">
                        <div class="categoryBg">
                            <ion-icon class="cateIcon" name="desktop"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">가전제품</span>
                        </div>
                    </div>
                </a>
                <a href="index.jsp?categoryname=기타상품">
                    <div class="categoryLink">
                        <div class="categoryBgDif">
                            <ion-icon class="cateIcon" name="desktop"></ion-icon>
                        </div>
                        <div class="spanDiv">
                            <span class="categoryTitle">기타물품</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </section>
</body>
    </html>