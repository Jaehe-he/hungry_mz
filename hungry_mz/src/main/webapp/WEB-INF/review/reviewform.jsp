<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>502 JSP Study</title>
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    body {
        font-family: 'Jua', sans-serif;
        background-color: #f8f9fa;
        text-align: center;
        padding: 50px;
    }
    
    #reviewModal{
    	background-color : #ccc;
    }
    
    .modal-header{
    	background-color : #4682B4;
    }
    
    .modal-body{
    	background-color : #F0F8FF;
    }
    
    
    .modal-content {
        border-radius: 15px;
    }
    .rating span {
        font-size: 2em;
        cursor: pointer;
        color: #ccc;
        transition: color 0.3s;
    }
    .rating span.active, .rating span:hover {
        color: #f5c518;
    }
    .reviewbtn {
        background-color: #28a745;
        color: white;
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        transition: 0.3s;
    }
    .reviewbtn:hover {
        background-color: #218838;
    }
    .custom-input {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    #review {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }
    #review:hover {
        background-color: #0056b3;
    }
    
    .mt-1 {
    	border : 1px solid #ccc;
    	padding : 80px;
    	border-radius : 20px;
    	background-color : white;
    }
</style>
</head>
<body>

<!-- The Modal -->
<div class="modal fade" id="reviewModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">리뷰 작성</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <form action="/submitReview" method="post" enctype="multipart/form-data" id="reviewForm">
                    <input type="hidden" name="restaurantId" value="${restaurantId}">
                    
                    <div class="rating">
                        <span onclick="rate(1)" onmouseover="highlight(1)" onmouseout="resetHighlight()">★</span>
                        <span onclick="rate(2)" onmouseover="highlight(2)" onmouseout="resetHighlight()">★</span>
                        <span onclick="rate(3)" onmouseover="highlight(3)" onmouseout="resetHighlight()">★</span>
                        <span onclick="rate(4)" onmouseover="highlight(4)" onmouseout="resetHighlight()">★</span>
                        <span onclick="rate(5)" onmouseover="highlight(5)" onmouseout="resetHighlight()">★</span>
                    </div>
                    <input type="hidden" id="rating" name="rating">
                    
                    <div class="mt-1">
                        <label for="photo" class="form-label">사진을 추가해주세요!</label>
                        <input type="file" id="photo" name="photo" class="form-control">
                    </div>
                    
                    <div class="mt-3">
                        <label for="reviewContent" class="form-label">리뷰 내용</label>
                        <textarea id="reviewContent" name="reviewContent" class="custom-input" rows="3" required></textarea>
                    </div>
                    </form>
               </div>
                    
                <div class="modal-footer">                    
                    <div class="mt-3">
                        <button type="submit" class="btn reviewbtn">리뷰 저장</button>
                    </div>
              	</div>
           
        </div>
    </div>
</div>

<script>
    let currentRating = 0;
    
    function rate(value) {
        currentRating = value;
        document.getElementById('rating').value = value;
        highlight(currentRating);
    }
    
    function highlight(value) {
        const stars = document.querySelectorAll('.rating span');
        stars.forEach((star, index) => {
            star.classList.toggle('active', index < value);
        });
    }
    
    function resetHighlight() {
        highlight(currentRating);
    }
</script>

<!-- 리뷰 버튼 -->
<span data-bs-toggle="modal" data-bs-target="#reviewModal" id="review">리뷰 작성</span>

</body>
</html>
