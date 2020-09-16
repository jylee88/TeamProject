<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<%@include file="../include/header.jsp"%>
</head>
<body>
   
   <div class="container">
      <%@include file="../include/sideMenu.jsp"%>
      <div class = "bob_content">
         <br>
         <h1>Member List</h1>
         <br>
      <div class = "table-responsive">
      <table class="table" >
      <tr style="text-align: center; border-bottom : 2px solid;">
         <td>NO.</td>
         <td>ID</td>
         <td>NAME</td>
         <td>Email</td>
         <td>PHONE</td>
         <td>DATE</td>
         <td>POST</td>
         <td style="width : 20%;">ADDR</td>
         <td>DEL</td>
         <td colspan="2">VIEW</td>
      </tr>
      
      <c:forEach var="memberList1" items="${memberList}">
         <tr>
            <td>${memberList1.mb_number}</td>
            <td>${memberList1.mb_id}</td>
            <td>${memberList1.mb_name}</td>
            <td>${memberList1.mb_email}</td>
            <td>${memberList1.mb_ph}</td>
            <td>${memberList1.mb_signup}</td>
            <td>${memberList1.mb_ad1}</td>
            <td>${memberList1.mb_ad2} ${memberList1.mb_ad3}</td>
            
            <c:choose>
               <c:when test="${memberList1.mb_del == 0}"><td>N</td></c:when>
               <c:when test="${memberList1.mb_del == 1}"><td>Y</td></c:when>
            </c:choose>
               <td><button onclick="location.href='${contextPath}/Member/AdminUpdate?mb_number=${memberList1.mb_number}'">수정</button></td>
               <td><button onclick="location.href='${contextPath}/Member/AdminDel?mb_number=${memberList1.mb_number}'">삭제</button></td>
         </tr>
      </c:forEach>
      </table>
         </div>
      </div>
   </div>
</body>
</html>