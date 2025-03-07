<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>502 jsp study</title>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Bootstrap JavaScript 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body * {
            font-family: 'Jua';
        }

        a.link, a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: hotpink;
        }

        ul.menu {
            list-style: none;
            margin: 10px;
        }

        ul.menu li {
            float: left;
            width: 100px;
        }
        
        div.modal-header {
        	background-color : #8fbc8f;
        }

		div.modal-body {
			display : flex;
			justify-content : center;
			background-color : #f5f5dc;
		}
		
		/*로그인 버튼*/
		.btn1 {
		  flex: 1 1 auto;
		  margin-top: 20px;
		  padding: 10px;
		  width : 200px;
		  text-align: center;
		  text-transform: uppercase;
		  transition: 0.5s;
		  background-size: 200% auto;
		  color: white;
		  box-shadow: 0 0 20px #eee;
		  border-radius: 10px;
		  border : none;
		 }
		 
		.btn1:hover {
			background-position: right center; 
			color : black;
		}
		
		.loginbtn {
			background-image: linear-gradient(to right, #DEB887 0%, #BDB76B 49%, #8fbc8f 100%);
		}
		
		#loginId {
			width : 300px;
			margin-bottom : 10px;
		}
		
		.texts {
			font-size : 1.2em;
		}
    </style>
</head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<body>
<div style="margin: 10px;">
    <h2 class="alert alert-success">
        <a href="${root}/" style="color: black">
            <img src="${root}/s4.jpg" width="50">
            배고픈 MZ
        </a>
        <span style="margin-left: 300px; font-size: 15px">
        <c:if test="${sessionScope.loginstatus!=null}">
            <b>${sessionScope.username}</b>님이 로그인 중입니다.
        </c:if>
        </span>
    </h2>
    <ul class="menu">
        <li>
            <a href="${root}/">Home</a>
        </li>
        <li>
            <a href="${root}/restaurant/list">식당 목록</a>
        </li>
        <li>
        	<c:if test="${sessionScope.loginstatus==null}">
            	<a href="${root}/member/form">회원가입</a>
            </c:if>
        </li>
        <li>
            <a href="${root}/review/reviewform">리뷰</a>
        </li>
        <li>
            <c:if test="${sessionScope.loginstatus==null}">
                <span data-bs-toggle="modal" data-bs-target="#myLoginModal" style="cursor:pointer;" id="login">로그인</span>
            </c:if>
            <c:if test="${sessionScope.loginstatus!=null}">
                <span style="cursor:pointer;" id="logout">로그아웃</span>
            </c:if>
        </li>
        <li>
            <c:if test="${sessionScope.loginstatus!=null}">
                <a href="${root}/member/mypage">내 정보</a>
            </c:if>
        </li>
    </ul>
        <script type="text/javascript">
            $("#loginForm").submit(function(e){
                e.preventDefault();// submit 기본 이벤트 무효화
                alert("submit");
                let loginId = $("#loginId").val();
                let loginPass = $("#loginPassword").val();
                $.ajax({
                    type: "get",
                    dataType: "json",
                    data:{"username":loginId, "password":loginPass},
                    url: "./login",
                    success: function(res){
                        if(res.result=='success'){
                            $(".btnclose").trigger("click");
                            location.reload();
                        }else{
                            alert("정보가 맞지 않습니다.");
                        }
                    }
                });
            });
            $("#logout").click(function(){
                $.ajax({
                    dataType: "text",
                    url: "./logout",
                    type: "get",
                    success: function (){
                        location.reload();
                    }
                });
            });
        </script>

</div>

<hr style="clear: both;">

<!-- The Modal -->
<div class="modal" id="myLoginModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">로그인</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="loginForm">
                    <table class="loginTab">
                        <tbody>
                        <tr>
                            <th width="80" class = "texts">아이디</th>
                            <td>
                                <input type="text" id="loginId" class="form-control"
                                       required="required">
                            </td>
                        </tr>
                        <tr>
                            <th width="80" class= "texts">비밀번호</th>
                            <td>
                                <input type="password" id="loginPassword" class="form-control" required="required">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <button type="submit" class="btn1 loginbtn">
                                로그인
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#loginForm").submit(function(e){
        e.preventDefault();//서브밋의 기본이벤트를 무효화(action호출)
        //alert("submit");
        let loginid=$("#loginId").val();
        let loginpass=$("#loginPassword").val();

        $.ajax({
            type:"get",
            dataType:"json",
            data:{"username":loginid,"password":loginpass},
            url:"${root}/member/login",
            success:function(res){
                if(res.result=='success'){
                    //값 초기화
                    $("#loginId").val("");
                    $("#loginPassword").val("");
                    //모달창 닫기
                    $(".btnclose").trigger("click");
                    //새로고침
                    location.reload();
                    alert("로그인 되었습니다.");
                }else{
                    alert("아이디나 비밀번호가 맞지 않습니다");
                    $("#loginPassword").val("");
                }
            }
        });
    });

    $("#logout").click(function(){
        $.ajax({
            type:"get",
            dataType:"text",
            url:"${root}/member/logout",
            success:function(res){
                //새로고침
                location.reload();
            }
        });
    });

</script>
</body>
</html>
