<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            cursor: pointer;
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
            visibility: visible;
            border: 1px solid black;
            border-radius: 5px;
            position: relative;
            width: 100%;
            height: 550px;
            overflow: auto;
        }

        div.menuList {
            margin: 1%;
            width: 100%;
            overflow: auto;
            padding: 0 1%;
            overflow: auto;
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
            width: 80px;
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
            width: 200px;
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
            max-height: 250px;
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
            width: 100%;
        }

        div.pagination a {
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
    정렬 기준 :
    <div class="optionContainer">
        <div class="listMethod">가격 낮은순</div>
        |
        <div class="listMethod">가격 높은순</div>
    </div>
</div>
<div class="container">
    <div class="menuPage">
        <div class="menuList" style="height: 500px;">
            <c:forEach var="dto" items="${list}">
                <div class="menu" menuId=${dto.menuId} restaurantId=${dto.restaurantId}>
                    <div class="content text">
                        <span class="foodName">${dto.name}</span>
                        <span class="description">${dto.description}</span>
                        <div style="display: inline-block">
                            <div class="price">${dto.price}원</div>
                            <div class="review">리뷰</div>
                        </div>
                    </div>
                    <c:if test="${dto.image!=''}">
                        <div class="content img">
                            <img class="menuImg" src="${dto.image}">
                        </div>
                    </c:if>
                </div>
                <hr>
            </c:forEach>
        </div>
        <div class="pagination">
            <c:if test="${startPage>1}">
                <li class="page-item">
                    <a class="page-link" href="./list?pageNum=${startPage-1}">Prev</a>
                </li>
            </c:if>
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${pp==pageNum}">
                    <li class="page-item active">
                        <a class="page-link" href="./list?pageNum=${pp}">${pp}</a>
                    </li>
                </c:if>
                <c:if test="${pp!=pageNum}">
                    <li class="page-item">
                        <a class="page-link" href="./list?pageNum=${pp}">${pp}</a>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${endPage<totalPage}">
                <li class="page-item">
                    <a class="page-link" href="./list?pageNum=${endPage+1}">Next</a>
                </li>
            </c:if>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/restaurant/random",
                success: function (res) {
                    $("span.title").text(res.title);
                    $("img.thumbnail").attr("src", res.image);
                    $.ajax({
                        type: "get",
                        dataType: "json",
                        url: "/menu/restaurant/" + res.restaurantId,
                        success: function (res) {
                            let s = "";
                            $.each(res, function (idx, ele) {
                                let name = ele.name;
                                let price = ele.price;
                                let image = ele.image;
                                let description = ele.description;
                                s += `
                                <div class="menu">
                                    <div class="content text">
                                        <span class="foodName">`+name+`</span>
                                        <span class="description">`+description+`</span>
                                        <div style="display: inline-block">
                                            <div class="price">`+price+`원</div>
                                            <div class="review">리뷰</div>
                                        </div>
                                    </div>
                                `;
                                if(image!=""){
                                    s+=`
                                    <div class="content img">
                                        <img class="menuImg" src="`+image+`">
                                    </div>
                                    `;
                                }
                                s+=`</div>
                                <hr>`;
                                $("div.restaurant div.menuList").html(s);
                            });
                        }
                    });
                }
            });
        });
        $("div.menu").click(function () {
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/restaurant/" + $(this).attr("restaurantId"),
                success: function (res) {
                    $("span.title").text(res.title);
                    $("img.thumbnail").attr("src", res.image);
                    $.ajax({
                        type: "get",
                        dataType: "json",
                        url: "/menu/restaurant/" + $(this).attr("restaurantId"),
                        success: function (res) {
                            let s = "";
                            $.each(res, function (idx, ele) {
                                let name = ele.name;
                                let price = ele.price;
                                let image = ele.image;
                                let description = ele.description;
                                s += `
                                <div class="menu">
                                    <div class="content text">
                                        <span class="foodName">`+name+`</span>
                                        <span class="description">`+description+`</span>
                                        <div style="display: inline-block">
                                            <div class="price">`+price+`원</div>
                                            <div class="review">리뷰</div>
                                        </div>
                                    </div>
                                `;
                                if(image!=""){
                                    s+=`
                                    <div class="content img">
                                        <img class="menuImg" src="`+image+`">
                                    </div>
                                    `;
                                }
                                s+=`</div>
                                <hr>`;
                                $("div.restaurant div.menuList").html(s);
                            });
                        }
                    });
                }
            });
        });
    </script>
    <div class="restaurant">
        <div class="thumbnail">
            <img class="thumbnail"
                 src="https://search.pstatic.net/common/?src=https%3A%2F%2Fnaverbooking-phinf.pstatic.net%2F20240405_160%2F17123206563219hooW_JPEG%2F%25B6%25BC%25BC%25A6.jpg">
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







