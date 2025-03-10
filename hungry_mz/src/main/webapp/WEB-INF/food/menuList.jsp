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

        div.reviewButton {
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
        div.review {
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        div.reviewContent {
            display: flex;
            flex-direction: column;
            gap: 5px;
            padding: 10px;
            border: 1px solid gray;
            border-radius: 5px;
            width: 350px;
        }
        button.review {
            background: white;
            border: none;
        }
        div.reviewImg {
            display: flex;
            justify-content: center;
            padding: 10px;
        }
        div.reviewImg > img {
            position: relative;
            right: 0%;
            width: 100px;
            height: 100px;
        }
        .modal-body {
            position: relative;
        }

        .writeReview {
            width: 100%;
            position: absolute;
            display: flex;
            justify-content: space-between; /* 좌우로 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            margin: 10px 0;
        }
        div.clicked {
            background-color: lightgray;
            border-radius: 10px;
        }
        div.restaurantName {
            margin-left: 20px;
        }
        div.reviewList {
            margin-top: 10px;
            width: 100%;
            margin-top: 60px;
            overflow: auto;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<script>
    let isPriceDesc = false;
</script>
<body>
<jsp:include page="../layout/title.jsp"/>
<div class="option">
    정렬 기준 :
    <div class="optionContainer">
        <div class="listMethod" id="priceDesc"><a href="./list?pageNum=${pageNum}&orderMethod=priceAsc">가격 낮은순</a></div>
        |
        <div class="listMethod clicked" id="priceAsc"><a href="./list?pageNum=${pageNum}&orderMethod=priceDesc">가격 높은순</a></div>
        |
        <div class="listMethod" id="starDesc"><a href="./list?pageNum=${pageNum}&orderMethod=starDesc">별점순</a></div>
        <c:if test="${orderMethod == 'priceAsc'}">
            <script>
                $("div.clicked").removeClass("clicked");
                $("div#priceAsc").addClass("clicked")
            </script>
        </c:if>
        <c:if test="${orderMethod == 'priceDesc'}">
            <script>
                $("div.clicked").removeClass("clicked");
                $("div#priceDesc").addClass("clicked")
            </script>
        </c:if>
        <c:if test="${orderMethod == 'starDesc'}">
            <script>
                $("div.clicked").removeClass("clicked");
                $("div#starDesc").addClass("clicked")
            </script>
        </c:if>
    </div>
</div>
<div class="container">
    <div class="menuPage">
        <div class="menuList" style="height: 500px;">
            <c:forEach var="dto" items="${list}">
                <div class="menu" menuId=${dto.menuId} restaurantId="${dto.restaurantId}">
                    <div class="content text">
                        <span class="foodName">${dto.name}</span>
                        <span class="description">${dto.description}</span>
                        <div style="display: inline-block">
                            <div class="price">${dto.price}원</div>
                            <div class="reviewButton">리뷰</div>
                            <span class="menuReviewCount">${dto.reviewCount}</span>
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
                    <a class="page-link" href="./list?pageNum=${startPage-1}&isPriceDesc=${isPriceDesc}">Prev</a>
                </li>
            </c:if>
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${pp==pageNum}">
                    <li class="page-item active">
                        <a class="page-link" href="./list?pageNum=${pp}&isPriceDesc=${isPriceDesc}">${pp}</a>
                    </li>
                </c:if>
                <c:if test="${pp!=pageNum}">
                    <li class="page-item">
                        <a class="page-link" href="./list?pageNum=${pp}&isPriceDesc=${isPriceDesc}">${pp}</a>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${endPage<totalPage}">
                <li class="page-item">
                    <a class="page-link" href="./list?pageNum=${endPage+1}&isPriceDesc=${isPriceDesc}">Next</a>
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
                    $("div.restaurant").attr("restaurantId", res.restaurantId);
                    $("span.title").text(res.title);
                    $("img.thumbnail").attr("src", res.image);
                    $("span#restaurantReviewCount").text(res.reviewCount);
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
                                let reviewCount = ele.reviewCount;
                                s += `
                                <div class="menu">
                                    <div class="content text">
                                        <span class="foodName">`+name+`</span>
                                        <span class="description">`+description+`</span>
                                        <div style="display: inline-block">
                                            <div class="price">`+price+`원</div>
                                            <button type="button" class="review" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰</button>
                                            <span id="restaurantReviewCount">` + reviewCount + `</span>
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
            let restaurantId = $(this).attr("restaurantId");
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/restaurant/" + restaurantId,
                success: function (res) {
                    $("div.restaurant").attr("restaurantId", restaurantId);
                    $("span.title").text(res.title);
                    $("img.thumbnail").attr("src", res.image);
                    $("span#restaurantReviewCount").text(res.reviewCount);
                    $.ajax({
                        type: "get",
                        dataType: "json",
                        url: "/menu/restaurant/" + restaurantId,
                        success: function (res) {
                            let s = "";

                            $.each(res, function (idx, ele) {
                                let name = ele.name;
                                let price = ele.price;
                                let image = ele.image;
                                let description = ele.description;
                                let reviewCount = ele.reviewCount;
                                s += `
                                <div class="menu">
                                    <div class="content text">
                                        <span class="foodName">`+name+`</span>
                                        <span class="description">`+description+`</span>
                                        <div style="display: inline-block">
                                            <div class="price">`+price+`원</div>
                                            <button type="button" class="review" data-bs-toggle="modal" data-bs-target="#restaurantModal">리뷰</button>
                                            <span class="reviewCount">` + reviewCount + `</span>
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
    <div class="restaurant" restaurantId="">
        <div class="thumbnail">
            <img class="thumbnail"
                 src="https://search.pstatic.net/common/?src=https%3A%2F%2Fnaverbooking-phinf.pstatic.net%2F20240405_160%2F17123206563219hooW_JPEG%2F%25B6%25BC%25BC%25A6.jpg">
        </div>
        <div class="info">
            <span class="title">식당 이름</span>
        </div>
        <div class="info">
            <button type="button" class="review" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰</button>
            <span id="restaurantReviewCount">n</span>
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
                        <div class="reviewButton">리뷰</div>
                        <div class="reviewadd"></div>
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
                        <div class="reviewButton">리뷰</div>
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
                        <div class="reviewButton">리뷰</div>
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
<!-- The Modal -->
<div class="modal" id="reviewModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">리뷰목록</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="writeReview">
                    <div class="restaurantName">
                        <h2>식당이름</h2>
                    </div>
                    <button style="margin-right: 20px;" class="btn btn-success">리뷰 작성</button>
                </div>
                <div class="reviewList">
                    <div class="review">
                        <div class="reviewContent">
                            <span>닉네임 : `+nickname+`</span><br>
                            <span>별점 : `+star+`</span><br>
                            <span>내용 : `+content+`</span>
                        </div>
                        <div class="reviewImg">
                            <img src="${root}/s4.JPG">
                        </div>
                    </div>
                </div>

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click", "button.review", function () {
        let restaurantId = $("div.restaurant").attr("restaurantId");
        $.ajax({
            type: "get",
            dataType: "json",
            url: "/review/reviewlist",
            data: {"restaurantId": restaurantId},
            success: function (res) {
                let s = "<hr>";
                $.each(res, function (idx, ele) {
                    let nickname = ele.nickname;
                    let content = ele.reviewContent;
                    let star = ele.star;
                    let stars="";
                    for(let i=0; i<5; i++){
                        if(star>0){
                            stars+='<i class="bi bi-star-fill"></i>';
                            star--;
                        }else{
                            stars+=`<i class="bi bi-star"></i>`
                        }
                    }
                    s += `
                    <div class="review">
                        <span>`+nickname+`</span>
                        <span>`+stars+`</span>
                        <span>`+content+`</span>
                    </div>
                    <hr>
                    `;
                });
                $("div.reviewList").html(s);
            }
        });
    });
</script>
</body>
</html>







