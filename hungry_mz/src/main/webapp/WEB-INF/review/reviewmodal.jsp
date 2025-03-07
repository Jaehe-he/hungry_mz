<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>502 jsp study</title>
   <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   <style>
      body * {
         font-family: 'Jua';
      }

   </style>
</head>
<body>
<!-- The Modal -->
<div class="modal" id="reviewModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">리뷰 작성</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="/submitReview" method="post" enctype="multipart/form-data" id="reviewForm">
                    <input type="hidden" name="restaurantId" th:value="${restaurantId}">
                        
                    <div class="rating">
                    	<span onclick="rate(1)" onmouseover="highlight(1)" onmouseout="resetHightlight()">★</span>
                    	<span onclick="rate(2)" onmouseover="highlight(2)" onmouseout="resetHightlight()">★</span>
                    	<span onclick="rate(3)" onmouseover="highlight(3)" onmouseout="resetHightlight()">★</span>
                    	<span onclick="rate(4)" onmouseover="highlight(4)" onmouseout="resetHightlight()">★</span>
                    	<span onclick="rate(5)" onmouseover="highlight(5)" onmouseout="resetHightlight()">★</span>
                    </div>
                    <input type="hidden" id="rating" name="rating">
                    
                    <div>
                    	<label for="photo">사진</label>
                    	<input type="file" id="photo" nmae="photo">
                    </div>
                    
                    <div>
                    	<label for="title">내용</label>
                    	<input type="text" id="reviewContent" name="reviewContent" required=required>
                    </div>
                    
                    <div>
                    	<button type="submit" class="btn reviewbtn">
                    	리뷰 저장
                    	</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<span data-bs-toggle="modal" data-bs-target="#ReviewModal" style="cursor:pointer" id="review">리뷰</span>
</body>
</html>