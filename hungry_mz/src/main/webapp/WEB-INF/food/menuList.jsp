<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <style>
        body * {
            font-family: 'Jua';
        }
        div.container {
            display: flex;
            justify-content: space-evenly;
            align-items: flex-start;
            width: 100%;
            position: relative;
        }
        div.menu {
            display: flex;
            align-items: center; /* 수직 중앙 정렬 */
            justify-content: space-between; /* 좌우 정렬 */
            width: 100%;
            border: 1px solid gray;
            border-radius: 5px;
            padding: 5px 10px;
        }
        div.text {
            display: flex;
            flex-direction: column; /* 세로 정렬 */
            gap: 5px; /* 각 항목 간 간격 */
            padding: 10px;
            width: 100%;
        }

        div.content {
            border: 1px solid gray;
            border-radius: 5px;
        }
        div.img {
            width: 120px;
            height: 120px;
            margin-left: 10px; /* 여백 추가 */
        }

        img.menuImg {
            width: 100px;
            height: 100px;
            margin: 10px;
        }
        div.restaurant {
            border: 1px solid black;
            border-radius: 5px;
            position: relative;
            height: 550px;
            width: 90%;
            overflow: auto;
        }
        div.menuList {
            margin: 1%;
            width: 100%;
            overflow: auto;
            height: 500px;
            padding: 0 1%;
        }
        div.option {
            position: relative;
            right: 10%;
            width: 70%;
            text-align: center;
            margin-left: 10%;
        }
        div.listMethod {
            display: inline-block;
            width: 50px;
            text-align: center;
        }
        div.price {
            width: 60%;
            font-size: 0.9em;
            display: inline-block;
        }
        div.review {
            width: 30%;
            font-size: 0.9em;
            display: inline-block;
        }
        div.optionContainer {
            display: inline-block;
            width: 120px;
            border: 1px solid black;
            border-radius: 5px;
            text-align: center;
            padding: 2px;
        }
        span.description {
            font-size: 0.9em;
            color: gray;
        }
        img.thumbnail {
            display: flex;
            flex: fit-content;
            width: 60%;
            height: 30%;
            margin: 10px 20% 0;
            border-radius: 5px;
        }
        div.info {
            margin-left: 20px;
            margin-bottom: 5px;
        }
        span.info {
            padding-bottom: 10px;
        }
        span.title {
            font-size: 1.1em;
        }
        div.thumbnail {
            padding-bottom: 10px;
            border-bottom: 1px solid black;
            margin-bottom: 10px;
        }
        div.pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
            width: 500px;
        }
        div.pagination span {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ccc;
            cursor: pointer;
        }
        div.menuPage {
            margin: 1%;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/title.jsp"/>
<div class="option">
    정렬 기준 : <div class="optionContainer"><div class="listMethod">가격순</div>|<div class="listMethod">거리순</div></div>
</div>
<div class="container">
    <div class="menuPage">
        <div class="menuList">
            <div class="menu">
                <div class="content text">
                    <span class="foodName">이름</span>
                    <span class="description">디테일</span>
                    <div style="display: inline-block">
                        <div class="price">가격</div>
                        <div class="review">리뷰</div>
                    </div>
                </div>
                <div class="content img">
                    <img class="menuImg" src="${root}/s4.JPG">
                </div>
            </div>
            <hr>
            <div class="menu">
                <div class="content text">
                    <span class="foodName">이름</span>
                    <span class="description">디테일</span>
                    <div style="display: inline-block">
                        <div class="price">가격</div>
                        <div class="review">리뷰</div>
                    </div>
                </div>
                <div class="content img">
                    <img class="menuImg" src="${root}/s4.JPG">
                </div>
            </div>
            <hr>
            <div class="menu">
                <div class="content text">
                    <span class="foodName">이름</span>
                    <span class="description">디테일</span>
                    <div style="display: inline-block">
                        <div class="price">가격</div>
                        <div class="review">리뷰</div>
                    </div>
                </div>
                <div class="content img">
                    <img class="menuImg" src="${root}/s4.JPG">
                </div>
            </div>
            <hr>
            <div class="menu">
                <div class="content text">
                    <span class="foodName">이름</span>
                    <span class="description">디테일</span>
                    <div style="display: inline-block">
                        <div class="price">가격</div>
                        <div class="review">리뷰</div>
                    </div>
                </div>
                <div class="content img">
                    <img class="menuImg" src="${root}/s4.JPG">
                </div>
            </div>
            <hr>
        </div>
        <div class="pagination">
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
        </div>
    </div>
    <div class="restaurant">
        <div class="thumbnail">
            <img class="thumbnail" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fnaverbooking-phinf.pstatic.net%2F20240405_160%2F17123206563219hooW_JPEG%2F%25B6%25BC%25BC%25A6.jpg">
        </div>
        <div class="info">
            <span class="title">식당 이름</span>
        </div>
        <div class="info">
            리뷰&nbsp;<span>n 개</span>
        </div>
        <div class="info">
            <span>메뉴</span>
        </div>
        <div class="menuList">
            <div class="menu">
                <div class="content text">
                    <span class="foodName">이름</span>
                    <span class="description">디테일</span>
                    <div style="display: inline-block">
                        <div class="price">가격</div>
                        <div class="review">리뷰</div>
                    </div>
                </div>
                <div class="content img">
                    <img class="menuImg" src="${root}/s4.JPG">
                </div>
            </div>
            <hr>
            <div class="menu">
                <div class="content text">
                    <span class="foodName">이름</span>
                    <span class="description">디테일</span>
                    <div style="display: inline-block">
                        <div class="price">가격</div>
                        <div class="review">리뷰</div>
                    </div>
                </div>
                <div class="content img">
                    <img class="menuImg" src="${root}/s4.JPG">
                </div>
            </div>
            <hr>
        </div>
    </div>
</div>
</body>
</html>







