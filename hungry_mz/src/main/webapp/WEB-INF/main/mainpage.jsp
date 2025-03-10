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
    <style>
        body *{
            font-family: 'Jua';
        }
        
        .main{
	        	display: flex;
			  flex-direction: column;
			  width: 100%;
			  background-color : #FFFFE0;
        }
        
        .intro {
        	text-align : center;
        }
        
        .intro_2{
        	background-color : #BDB76B;
        	margin : 0 auto;
        	width : 70%;
        	height : 300px;
        	border-radius : 20px;
        }
        
        .intro-title {
			  font-size: 36px;
			  text-align: center;
			  font-weight: 800;
			}
			
		.intro-sub {
			 margin: 30px 0 50px;
			 font-size: 22px;
			 text-align: center;
			 opacity: 0.6;
			}
        
        .category-btn{
        	border-radius : 30px;
        	padding : 0px 10px;
        	margin-right : 10px;
        	border : 1px solid #ccc;
        }
        
		.restaurant-lists {
			margin : 0 auto;
		  width: 70%;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-wrap: wrap;
		  gap: 40px;
		  opacity: 1;
		  margin-top: 20px;
		  transition: all ease-out 0.3s;
		}
		
		.restaurant-lists.anim-out {
		  opacity: 0;
		  transform: scale(0) translateY(23px);
		}
		
		.restaurant-list {
		  position: relative;
		  width: 35%;
		  height: 100%;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  cursor: pointer;
		  margin-top : 60px;
		  margin-bottom: 80px;
		  transform: scale(1);
		  transition: transform 0.2s ease-in-out;
		}
		
		.restaurant-list.invisible {
		  display: none;
		  }
			
			.list-tags {
			  display: flex;
			  position: absolute;
			  width: 98%;
			  top: 0;
			  left: 0;
			  margin: 10px;
			}
			
			.tag {
			  font-size: 15px;
			  display: flex;
			  justify-content: center;
			  align-items: center;
			  width: 65px;
			  height: 25px;
			  background-color: white;
			  opacity: 0.8;
			  border-radius: 30px;
			  margin-right: 10px;
			}
			
			
			.restaurant-list:hover {
			  transform: scale(1.05);
			  transition: transform 0.2s ease-in-out;
			}
			
			.list-imgBox {
			  width: 100%;
			  height: 230px;
			  border-radius: var(--list-border-radius);
			  overflow: hidden;
			  border-radius : 10px;
			}
			
			.img {
			  width: 100%;
			  height: 100%;
			}
			
			.list-textBox {
			  position: absolute;
			  bottom: -50px;
			  text-align: center;
			  width: 90%;
			  height: 100px;
			  background-color: white;
			  border-radius : 10px;
			  box-shadow: 0px 2px 50px rgba(0, 0, 0, 0.3);
			}
			
			.textBox-name {
			  display: block;
			  margin: 15px 0px;
			  font-size: 30px;
			}
			
			.textBox-sub {
			  display: block;
			  margin-bottom: 25px;
			  opacity: 0.6;
			}
</style>
<script>
    $(document).ready(function () {
        $(".category-btn").click(function () {
            let category = $(this).val();  // 버튼의 value값 가져오기
            $(".restaurant-list").each(function () {
                let itemType = $(this).attr("data-type"); // 각 리스트의 data-type 가져오기
                if (category === "All" || itemType === category) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
</head>
<body>
<jsp:include page="../layout/title.jsp"/>
	<div class="main">
		<div class="intro">
				<img src="https://blog.kakaocdn.net/dn/0xSgP/btsMFFnh92s/2Ig101ZBO5DA7z7SM666r0/img.gif">
			<div class="intro_2">
				<h1 class="intro-title"> <br>오늘 뭐 먹지? </h1>
				<h2 class="intro-sub"> 당신의 시간을 단축시켜드리겠습니다.</h2>
				
				<h5> 음식 종류 </h5>
				<div class="category">
				    <input type="button" class="category-btn" name="button" value="All">
				    <input type="button" class="category-btn" name="button" value="한식">
				    <input type="button" class="category-btn" name="button" value="일식">
				    <input type="button" class="category-btn" name="button" value="양식">
				    <input type="button" class="category-btn" name="button" value="중식">
				    <input type="button" class="category-btn" name="button" value="고기">
				    <input type="button" class="category-btn" name="button" value="분식">
				    <input type="button" class="category-btn" name="button" value="기타">
				</div>

			</div>
		</div>
	
      <div class="restaurant-lists">
        <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#한식</span>
            <span class="tag">#대학로</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240816_162%2F1723776559835CMFsr_JPEG%2FKakaoTalk_20240816_114819543_01.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">순대실록</span>
            <span class="textBox-sub">든든하게 배를 채우고 싶다면?</span>
          </div>
      </div>
      
        <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#찌개</span>
            <span class="tag">#신사</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAyMTVfMjI0%2FMDAxNzM5NTg2NDI4Njc0.6k0yPfGjjOHfwFZh1lwWMz-Iim5ifD-Mff-7w5QBsUQg.TPI2kxmefs_MAn0NNHdS72iXvJb9uMOyBwb_5EJiaOog.JPEG%2F1000144344.jpg.jpg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">김복순큰남비집</span>
            <span class="textBox-sub">한 종류의 찌개만 있는게 아니다!</span>
          </div>
      </div>
      	
      	<!-- 한식 -->
        <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#닭</span>
            <span class="tag">#동대문</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAyMjdfMTYx%2FMDAxNzQwNjMwNjMyMTM1.nmY-E1ydYBVTFlkmIfRgsZODTU8yY49XW6ePz0gLTK8g.wLiIEsTpuaawkylWNIjbwP84ZC-wwQgUli9MkQdrW-wg.JPEG%2F50E485F3-BE6F-492B-AAE1-4482E44F6268.jpeg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">진옥화할매원조닭한마리</span>
            <span class="textBox-sub">초복에만 삼계탕? No~~</span>
          </div>
      </div>
      
      
        <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#회</span>
            <span class="tag">#한남</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20250217_36%2F1739765729331uIzrG_JPEG%2F%25BE%25EE%25B9%25B0%25C0%25FC-%25C6%25C8%25B5%25B5.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">어물전 청</span>
            <span class="textBox-sub">기념일엔? 어물전 청!</span>
          </div>
      </div>
      
      
        <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#국수</span>
            <span class="tag">#은평구</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAzMDFfMjcy%2FMDAxNzQwODA3MDA2OTY4.oNDHNNEA8qlbAcIQX3C_DYyaWCeHZywkMTXmJMy8lHkg.6tcMpA31GRtm3P4H-z2wZH3DwvP4v5gBsP6-LSMdznog.JPEG%2F1000005006.jpg.jpg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">가이오국수</span>
            <span class="textBox-sub">빠르고 간단하게 먹고싶다면?</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#냉면</span>
            <span class="tag">#시원</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20181228_220%2F1545968177518jjADy_JPEG%2FbpwL-QbMIMQFOC2zLS9SRI9f.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">서관면옥</span>
            <span class="textBox-sub">지금까지 이런 냉면은 없었다!</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#수제비</span>
            <span class="tag">#안국</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20160203_10%2F1454484609587RbrRs_JPEG%2F176153566028054_5.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">삼청동수제비</span>
            <span class="textBox-sub">한뚝배기 하실래예?</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="한식">
          <div class="list-tags">
            <span class="tag">#코스</span>
            <span class="tag">#압구정</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAyMjRfMTQ1%2FMDAxNzQwMzczMjYzMjY0.8iv5rieM5_yabqTrj-Yi7VIyqATKBWlTcDZscvvMSXIg.WZG7uZJECkjFyyysw6N-F4PfF2GRXnth5I8lfIQrsPAg.JPEG%2F50CA6E92-4FF1-45BB-8F99-2165CBDFDF41.jpeg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">정식당</span>
            <span class="textBox-sub">월급날이라면??? 한번쯤...</span>
          </div>
      </div>
      
      
      <!-- 일식 -->
      <div class="restaurant-list" data-type="일식">
          <div class="list-tags">
            <span class="tag">#일식</span>
            <span class="tag">#압구정</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240822_174%2F1724312552893B9dGN_JPEG%2F%25BE%25C6%25B7%25E7_%25BB%25E7%25BD%25C3%25B9%25CC_%25B8%25F0%25B8%25AE%25BE%25C6%25BF%25CD%25BC%25BC.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">아루</span>
            <span class="textBox-sub">우니..? 그럼 우니크림파스타</span>
          </div>
      </div>

	<div class="restaurant-list" data-type="일식">
          <div class="list-tags">
            <span class="tag">#오마카세</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAyMjFfMjA5%2FMDAxNzQwMTEyMzE0NDk3.njqcFsurmIxZYGGpMiFv3FTxzjEU7uQvuUcKhsYysAQg.VmnJxiXrkXBh2P9t5xSXnVVlHOuCHtDTlZHAuWs2nCsg.JPEG%2F1000047427.jpg.jpg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">오마카세 오사이초밥</span>
            <span class="textBox-sub">가성비 오마카세를 찾으면 여기!</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="일식">
          <div class="list-tags">
            <span class="tag">#회</span>
            <span class="tag">#초밥</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAyMjRfMTI4%2FMDAxNzQwMzk2NDU3Njkw.OTjrRMpCM5vKenDrzjPBDDUbniCvVlWXP0t6YbPYAuEg.Nx53c_Hp40-bru-0bV5fISSxrwNuJMuQLSyT7BVCkf0g.JPEG%2F2B06D37F-BC8F-4339-BE55-7C7E4DC6A369.jpeg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">노조미일식</span>
            <span class="textBox-sub">일식하면 회. 회 하면 일식</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="일식">
          <div class="list-tags">
            <span class="tag">#이자카야</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240709_252%2F1720453353419dSh2Q_JPEG%2FKakaoTalk_20240607_104829103_25.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">코지로</span>
            <span class="textBox-sub">술이 땡길땐? 맛있는 안주로 먹자</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="일식">
          <div class="list-tags">
            <span class="tag">#튀김</span>
            <span class="tag">#정식</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180524_219%2F1527111253383P7qiC_JPEG%2FF9KvJJtJLXN8NeUtSeaHgb32.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">풍운일식</span>
            <span class="textBox-sub">여러 메뉴를 원한다면 여기로</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="양식">
          <div class="list-tags">
            <span class="tag">#연남</span>
            <span class="tag">#양식</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20221005_189%2F1664897234715SLKzt_JPEG%2FIMG_1903.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">디어리스트</span>
            <span class="textBox-sub">스테이크와 파스타를 함께~</span>
          </div>
      </div>
      
      <div class="restaurant-list" data-type="양식">
          <div class="list-tags">
            <span class="tag">#연남</span>
            <span class="tag">#플래터</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20250126_95%2F1737865596726HOU6K_JPEG%2FR3__3646.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">고스튼블랙</span>
            <span class="textBox-sub">예쁜 플레이팅으로 먹고싶다면?</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="양식">
          <div class="list-tags">
            <span class="tag">#파스타</span>
            <span class="tag">#가성비</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20211129_199%2F1638168131509jKtwa_JPEG%2F01E7A023-0BC2-41B5-8870-A7CF642C1E03.jpeg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">쌤쌤쌤</span>
            <span class="textBox-sub">가성비적인 음식점</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="양식">
          <div class="list-tags">
            <span class="tag">#스테이크</span>
            <span class="tag">#파스타</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231114_140%2F1699956951280g2vFm_JPEG%2FIMG_7123.jpeg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">헤이죠지</span>
            <span class="textBox-sub">평타는 친다!!</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="중식">
          <div class="list-tags">
            <span class="tag">#체인점</span>
            <span class="tag">#중식</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNTAzMDdfMjk2%2FMDAxNzQxMzIzODQyMzA1.zBqXBxvQ0oYYvaqNBUXGrb59_HGQFkT5ZMDoRUhZQJwg.qVtbj1ixP41vhlFxEP5j5FXoGCTAduop103HeJtrFucg.JPEG%2FIMG_6641.jpeg%3Ftype%3Dw1500_60_sharpen">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">라화쿵부</span>
            <span class="textBox-sub">사골육수에 마라소스를 곁들인</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="중식">
          <div class="list-tags">
            <span class="tag">#양꼬치</span>
            <span class="tag">#중식</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240217_285%2F1708102484048n5yVl_JPEG%2FKakaoTalk_20240216_233630758_02.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">화양양꼬치</span>
            <span class="textBox-sub">꼬치의 중독성</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="고기">
          <div class="list-tags">
            <span class="tag">#고기</span>
            <span class="tag">#소돼지</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230628_114%2F1687931721613pL4Mt_JPEG%2FKakaoTalk_20230627_214010921_11.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">신당육</span>
            <span class="textBox-sub">소와 돼지 둘다 있다!</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="고기">
          <div class="list-tags">
            <span class="tag">#폭립</span>
            <span class="tag">#바베큐</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230723_214%2F1690111798290a9dBr_JPEG%2FKakaoTalk_20220921_105248049_02.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">방이별관</span>
            <span class="textBox-sub">폭립과 바베큐파티</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="분식">
          <div class="list-tags">
            <span class="tag">#튀김</span>
            <span class="tag">#떡볶이</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20241129_162%2F17328814166946l3Yb_JPEG%2F1DSC07570.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">영차떡볶이</span>
            <span class="textBox-sub">푸짐하게 배터지게</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="분식">
          <div class="list-tags">
            <span class="tag">#가성비</span>
            <span class="tag">#라볶이<span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20250306_19%2F17412213531970mpQI_PNG%2F%25B5%25F0%25B5%25A8%25B8%25AE-10%25BF%25F9-%25BD%25C5%25B8%25DE%25B4%25BA-%25C6%25F7%25BD%25BA%25C5%25CD-%25B8%25AE%25BC%25D2%25C5%25E43%25C1%25BE.png">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">디델리</span>
            <span class="textBox-sub">가성비하면 여기!</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="기타">
          <div class="list-tags">
            <span class="tag">#쌀국수</span>
            <span class="tag">#베트남</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231106_140%2F16992525893699TFjn_JPEG%2FAND03611.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">뎁짜이</span>
            <span class="textBox-sub">시원하게 국물 한사발</span>
          </div>
      </div>
      <div class="restaurant-list" data-type="기타">
          <div class="list-tags">
            <span class="tag">#장어</span>
            <span class="tag">#가락</span>
          </div>
          <div class="list-imgBox">
            <img class="img" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180222_248%2F15193084960667lRFk_JPEG%2FOfAwFLfAGrX7jULz8E1-mHHD.jpg">
          </div>
          <div class="list-textBox">
            <span class="textBox-name">용장어</span>
            <span class="textBox-sub">장어를 먹고싶다면?</span>
          </div>
      </div>
      
  	</div>
  </div>
</body>
</html>
