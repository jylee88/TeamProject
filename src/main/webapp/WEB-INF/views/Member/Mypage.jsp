<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/header.jsp"%>
<title>마이 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.modal {
	width: 35%;
    height: 70%;
    max-width: none;
    padding: 0;
}

.items{
	display: flex;
	flex-direction: row;
}
.mypage_icons{
	margin : 35px 35px 0 35px;
	padding : 20px;
	width : 50%;
	border : 5px solid #ccc;
	border-radius: 50%;
}
.mypage_imgdiv{
	width : 33%;
	float : left;
}
</style>
</head>
<body>

   <div class="container">
      <%@include file="../include/sideMenu.jsp"%>
      <div class = "bob_content">
         <br>
         <h1>My Page</h1>
         <hr><br>
         <div class="user">
            <div class="user_info">
            <span style="font-size: 25px">${member.mb_name }[${member.mb_id }]님 </span>
            <a href="UpdateForm?mb_number=${member.mb_number }"><input type="button" value="회원정보 수정"></a>
            <p class="p_info"> 전 &nbsp &nbsp화 : &nbsp0${member.mb_ph }</p>
            <p class="p_info"> 이메일 : &nbsp${member.mb_email }</p>
            <p class="p_info"> 주 &nbsp &nbsp소 : &nbsp${member.mb_ad2 }${member.mb_ad3 }</p>
            </div>
            <c:set var="sumsum" value="0" />
            <c:set var="prev" value="0" />
            <c:forEach var="orderList" items="${orderList}">
               <c:set var="sumsum" value= "${sumsum + orderList.od_price }" />
               <c:if test="${orderList.od_state eq 0}">
                  <c:set var="prev" value="${prev + 1}" />
               </c:if>
            </c:forEach>
            
            <div class="user_pay">
               <span style="font-size: 25px">결제 정보</span>
                  <dl>
                     <dt class="order_dt">할인 쿠폰 : </dt>
                     <dd class="order_dd">0 개</dd>
                     <dt class="order_dt">배송전 : </dt>
                     <dd class="order_dd"><c:out value="${prev }" /> 개</dd>
                     <dt class="order_dt">총 주문금액 : </dt>
                     <dd class="order_dd"><c:out value="${sumsum }" /> 원</dd>
                  </dl>
            </div>
         </div>
         <div class="user_tier">
            ${member.mb_name } 님은 
            <span style="color : dodgerblue;">[ 
	            <c:if test="${sumsum<100000 }">브론즈</c:if>
	            <c:if test="${sumsum>=100000 and sumsum<200000 }">실버</c:if>
	            <c:if test="${sumsum>=200000 and sumsum<300000 }">골드</c:if>
	            <c:if test="${sumsum>=300000 }">플래티넘</c:if> ]
            </span> 등급 입니다.
         </div>
         
         <h4 class="h3_user">최근 주문 정보
         <a href="${contextPath}/board/list_paging?bcode_number=8" class="a_board">
         <input class="button_bu" type="button" value="더보기"></a></h4>
         <table class="table">
            <tr style="background-color : #FBFBFB;">
               <td style="width : 10%;">번호</td>
               <td style="width : 20%;">상품명</td>
               <td style="width : 20%;">구매자</td>
               <td style="width : 50%;">주문일자</td>
            </tr>            

            <c:forEach var="orderList" items="${orderList}" varStatus="status" >
            <tr>
               <td>${orderList.od_number}</td>
               <td><a href = "${contextPath }/Member/OrderDetail?od_id=${orderList.od_id}">${orderList.mypage_odname}</a></td>
               <td>${member.mb_name }</td>
               <td>${orderList.od_date}
               </td>
               <td>
               		<p><a href="#ex${status.index }" rel="modal:open"><input type="button" value="배송조회"></a></p>
               </td>
					<!-- Modal HTML embedded directly into document -->
            </tr>
					<div id="ex${status.index }" class="modal">
						<div style="background-color: #404b66; color : white; text-align : center; padding : 15px;">
							<h3>오늘 ${orderList.od_date} <br>
								고객님의 상품이 발송됩니다.</h3><br>
								배송 완료일은 ${orderList.od_date} 입니다.<br>
						</div>
						
						
					  <div class="items">
					  	<c:choose>
					  	  <c:when test="${orderList.od_state == 0}">
					  	  <br>
					  	  	<div style="width : 100%; text-align : center;">
					  	  		<div class="mypage_imgdiv">
							  		<img src="${contextPath}/resources/img/wallet.png" style="background-color:#67de9f" class="mypage_icons"><br>
							  		결제완료
					  	  		</div>
					           	
					           	<div class="mypage_imgdiv">
								  	<img src="${contextPath}/resources/img/loading.png" style="background-color:#67de9f"  class="mypage_icons"><br>
								  	상품준비중
					           	</div >
					           	
					           	<div class="mypage_imgdiv">
									<img src="${contextPath}/resources/img/flag.png" class="mypage_icons"><br>
								  	배송시작
					           	</div>
					           	
					           	<div class="mypage_imgdiv" style="margin-left : 113px;">
					           		<img src="${contextPath}/resources/img/truck.png" class="mypage_icons"><br>
								  	배송중
					           	</div>
					           	
					           	<div class="mypage_imgdiv">
								  	<img src="${contextPath}/resources/img/pin.png" class="mypage_icons"><br>
								  	배송완료
					           	</div>						  	
							</div>
							  <br>
					  	  </c:when>
					  	  <c:when test="${orderList.od_state == 1}">
					  	  <br>
					  	  	<div style="width : 100%; text-align : center;">
					  	  		<div class="mypage_imgdiv">
							  		<img src="${contextPath}/resources/img/wallet.png" style="background-color:#67de9f" class="mypage_icons" ><br>
							  		결제완료
					  	  		</div>
					           	
					           	<div class="mypage_imgdiv">
								  	<img src="${contextPath}/resources/img/loading.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	상품준비중
					           	</div >
					           	
					           	<div class="mypage_imgdiv">
									<img src="${contextPath}/resources/img/flag.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	배송시작
					           	</div>
					           	
					           	<div class="mypage_imgdiv" style="margin-left : 113px;">
					           		<img src="${contextPath}/resources/img/truck.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	배송중
					           	</div>
					           	
					           	<div class="mypage_imgdiv">
								  	<img src="${contextPath}/resources/img/pin.png" class="mypage_icons"><br>
								  	배송완료
					           	</div>						  	
							</div>
							  <br>
					  	  </c:when>
					  	  <c:when test="${orderList.od_state == 2}">
					  	  	<div style="width : 100%; text-align : center;">
					  	  <br>
					  	  		<div class="mypage_imgdiv">
							  		<img src="${contextPath}/resources/img/wallet.png" style="background-color:#67de9f" class="mypage_icons"><br>
							  		결제완료
					  	  		</div>
					           	
					           	<div class="mypage_imgdiv">
								  	<img src="${contextPath}/resources/img/loading.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	상품준비중
					           	</div >
					           	
					           	<div class="mypage_imgdiv">
									<img src="${contextPath}/resources/img/flag.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	배송시작
					           	</div>
					           	
					           	<div class="mypage_imgdiv" style="margin-left : 113px;">
					           		<img src="${contextPath}/resources/img/truck.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	배송중
					           	</div>
					           	
					           	<div class="mypage_imgdiv">
								  	<img src="${contextPath}/resources/img/pin.png" style="background-color:#67de9f" class="mypage_icons"><br>
								  	배송완료
					           	</div>						  	
							</div>
					  	  </c:when>
					  	</c:choose>
					  </div><br>
							  <div style="background-color: white; height : 100%; text-align : center; font-size:25px;">
							  	<c:if test="${orderList.od_state == 0}">
							  	현재 ${orderList.od_name }님의 상품을 준비하고 있습니다. (^-^)
							  	</c:if>
							  	<c:if test="${orderList.od_state == 1}">
							  	현재 ${orderList.od_name }님의 상품을 신속하게 운송중입니다. (^o^)
							  	</c:if>
							  	<c:if test="${orderList.od_state == 2}">
							  	현재 ${orderList.od_name }님의 상품이 안전하게 배송되었습니다. (_ _)<br>
							  	저희 Bab Morning을 이용해주셔서 감사합니다.
							  	</c:if>
							  </div>
					</div>
            </c:forEach>
         </table>
         
          <h4 class="h3_user">내가 쓴 게시글 
         <a href="${contextPath}/board/list_paging?bcode_number=7" class="a_board">
         <input class="button_bu" type="button" value="더보기"></a></h4>
         <table class="table" style="width: 100%; color: #212529; margin-bottom : none;">
            <tr style="background-color : #FBFBFB;">
               <td style="width : 15%;">번호</td>
               <td style="width : 35%;">제목</td>
               <td style="width : 25%;">글쓴이</td>
               <td style="width : 30%;">작성일자</td>
            </tr>  
            <c:forEach var="boardList" items="${boardList}"  begin="0" step="1" end="4" >
               <tr>
                  <td>${boardList.b_number}</td>
                  <td><a href = "${contextPath }/Member/BoardDetail?b_number=${boardList.b_number}">${boardList.b_title}</a></td>
                  <td>${boardList.b_id}</td>
                  <td>${boardList.b_regdate}</td>
               </tr>
            </c:forEach>               
         </table>

         
      <%@include file="../include/footer.jsp"%>
      </div>
   </div>
</body>


</html>