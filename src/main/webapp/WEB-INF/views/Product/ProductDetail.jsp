<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="num" value="1" />
<c:set var="total" value="${product.pd_price*num }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
<style>

   td {
      width : 500px;
      border : 1px solid;
   }
   img{
      width : 80%;
   }
   .pd_img{
      text-align : center;
   }
   .pd_name{
      font-size : 30px;
   }
   .pd_detail{
      font-size : 10px;
   }
   .productReviewBox{
      padding : 35px 0px 0px 0px;
   }
   .pd_ReviewBox {
      list-style : none;
      padding : 0 0 0 0px;
      text-align : center;
   }
   .pd_ReviewBox_menu {
      border : 1px solid;
      float : left;
      width : 33.3%;
   }
   /* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  margin : 35px 0px 0px 0px;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  width : 33.3%;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

</style>
</head>
<body>
<div class="container">
      <%@include file="../include/sideMenu.jsp"%>
      <div class = "bob_content">
      <h1 class="mt-4">Logo Nav by Start Bootstrap</h1>
      <form method="POST" name="form">
         <table>
            <tr>
            <td rowspan="10" class="pd_img"><img src="${contextPath}/resources/upload/${product.pd_img}"></td>
            </tr>
               
            <tr>
            <td class="pd_name">${product.pd_name }</td>
            </tr>
            
            <tr>
             <td>${product.pd_price}원</td>
            </tr>
            
            <tr>
             <td><div id = "pdf_star"></div>
                          
            <output for="star-input"><b>${product.getPd_avgstar()}</b>점</output></td>
            </tr>
            
            <tr>
            <td>${product.pd_category}</td>
            </tr>
            
            <tr>
            <td>${product.pd_memo}</td>
            </tr>
            
            <tr>
            <td class="pd_detail">${product.pd_detail}<br><br><br></td>
            </tr>
            
            <tr>
               <td>
                  <div>수량</div><br>
                  <div style="float : left; padding : 0 0 0 10px">
                  <input type="button" onclick="button_click1();" value="-">
                  <input type="text" id="${num }" name="cart_amount" value ="${num }" style="text-align : center;" readonly>
                  <input type="button" onclick="button_click2();" value="+">
                  </div>
                  <input type="text" id="${total }" name="cart_totalPrice" value ="${total }" 
                  style="text-align : center; border : none; outline : none;" readonly>
               </td>
            </tr>
            <tr>
            <td>${product.pd_stock}</td>
            </tr>
            
            <tr>
            </tr>
            <tr>
            </tr>
         </table>
         <input type="button" value="좋아요♡">
         <input type="button" class="p_reply" value="구매후기">
        <input type="submit" value="장바구니" onclick="javascript: form.action='ProductDetail';"/>
        <input type="submit" value="구매하기" onclick="javascript: form.action='ProductOrderPage';"/>
         <input type="hidden" name="mb_number" value=${member.mb_number}>
         <input type="hidden" name="pd_number" value=${product.pd_number}>
      </form>
      
      <!-- Tab links -->
      <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">상세 정보</button>
        <button class="tablinks" onclick="openCity(event, 'Paris')">구매 평가</button>
        <button class="tablinks" onclick="openCity(event, 'Tokyo')">Q&A</button>
      </div>
      <!-- Tab content -->
      <div id="London" class="tabcontent">
        <h3>London</h3>
        <img src="${contextPath}/resources/bootstrap/images/detail.jpg" style="width:100%;">
      </div>
      
      <div id="Paris" class="tabcontent">
        <h3>Paris</h3>
        <p>Paris is the capital of France.</p>
        <table class="table">
        <tr>
        <td>글번호</td>        
        <td>제목</td>
        <td>작성일</td>
        <td>작성자</td>
        <td>조회수</td>        
        </tr>
        
        <c:forEach var="list" items="${list}">
             <tr>
                <td style="width : 10%;">${list.b_number}</td>
                <td><a href="${contextPath }/board/BoardDetail?b_number=${list.b_number}">${list.b_title}</a></td>     
                <td>${list.b_regdate}</td>
                <td>${list.pd_star}</td>
                <td><span class="badge">${list.b_readcnt }</span></td>
             </tr>
         </c:forEach>
        </table>
      </div>
      
      <div id="Tokyo" class="tabcontent">
        <h3>Tokyo</h3>
        <p>Tokyo is the capital of Japan.</p>
      </div>
      <%@include file="../include/footer.jsp"%>
   </div>
</div>

</body>
<script>
var count =1;
function button_click1(){
   if(count>1){
      count--;
      document.getElementById("${num}").value = count;
      var sum = ${product.pd_price}*count;
      document.getElementById("${total}").value = sum;
      console.log(sum);
   }
}
function button_click2(){
   count++;
   document.getElementById("${num}").value = count;
   var sum = ${product.pd_price}*count;
   document.getElementById("${total}").value = sum;
   console.log(sum);
}
function openCity(evt, cityName) {
     // Declare all variables
     var i, tabcontent, tablinks;

     // Get all elements with class="tabcontent" and hide them
     tabcontent = document.getElementsByClassName("tabcontent");
     for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
     }

     // Get all elements with class="tablinks" and remove the class "active"
     tablinks = document.getElementsByClassName("tablinks");
     for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
     }

     // Show the current tab, and add an "active" class to the button that opened the tab
     document.getElementById(cityName).style.display = "block";
     evt.currentTarget.className += " active";
}

document.getElementById("defaultOpen").click();
</script>
<script>
$(function () {
   $(".p_reply").click(function() {
      location.href = "../board/BoardRegister?pd_number=${product.pd_number}&bcode_number=1"
   });
})
</script>
<script>
      $(function () {
         
         var innerHtml = "";
         var r = ${product.getPd_avgstar()};
         
         console.log(r);
            
              if(r>=0 && r<=0.3) {
                innerHtml  = '<img src ="${contextPath}/resources/star/img/star0.png" />' ; 
              }
                       
              else if(r>=0.4 && r<=0.7) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star05.png" />' ; 
              }
              
              else if(r>=0.8 && r<=1.0) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star1.png" />' ; 
              }
              
              else if(r>=1.1 && r<=1.3) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star1.png" />' ; 
               }
                          
              else if(r>=1.4 && r<=1.7) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star15.png" />' ; 
              }
                 
              else if(r>=1.8 && r<=2.0) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star2.png" />' ; 
              }
              
              else if(r>=2.1 && r<=2.3) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star2.png" />' ; 
               }
                          
              else if(r>=2.4 && r<=2.7) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star25.png" />' ; 
              }
                 
              else if(r>=2.8 && r<=3.0) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star3.png" />' ; 
              }
              
              else if(r>=3.1 && r<=3.3) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star3.png" />' ; 
               }
                          
              else if(r>=3.4 && r<=3.7) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star35.png" />' ; 
              }
                 
              else if(r>=3.8 && r<=4.0) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star4.png" />' ; 
              }
              
              else if(r>=4.1 && r<=4.3) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star4.png" />' ; 
               }
                          
              else if(r>=4.4 && r<=4.7) {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star45.png" />' ; 
              }
                 
              else  {
                 innerHtml  = '<img src ="${contextPath}/resources/star/img/star5.png" />' ; 
              }

            $('#pdf_star').html(innerHtml);
      });
      </script>
</html>