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
      margin-top: 10px;
      display: flex;
      justify-content: space-evenly;
      align-items: flex-start;
      width: 500px;
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
      margin: 5px;
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
      flex-direction: row;
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

    div.restaurantList {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 100%;
      height: 500px;
      overflow: auto;
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
    <c:if test="${isPriceDesc}">
      <div class="listMethod"><a href="./list?pageNum=${pageNum}&likeAsc=false">좋아요 많은순</a></div>
      |
      <div class="listMethod clicked"><a href="./list?pageNum=${pageNum}&likeAsc=true">좋아요 많은순</a></div>
    </c:if>
    <c:if test="${!isPriceDesc}">
      <div class="listMethod clicked"><a href="./list?pageNum=${pageNum}&likeAsc=false">좋아요 많은순</a></div>
      |
      <div class="listMethod"><a href="./list?pageNum=${pageNum}&likeAsc=true">가격 높은순</a></div>
    </c:if>
  </div>
</div>
<div class="container">
  <div class="restaurantPage">
    <div class="restaurantList" style="height: 400px;">
      <c:forEach var="dto" items="${list}">
        <div class="restaurant" restaurantId="${dto.restaurantId}">
          <div class="thumbnail">
            <img class="thumbnail"
                 src="${dto.image}">
          </div>
          <div class="info">
            <span class="title">${dto.title}</span>
          </div>
          <div class="info">
            <button type="button" class="review" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰</button>
            <span id="restaurantReviewCount">${dto.reviewCount}</span>
          </div>
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
</div>
</body>
</html>







