<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<%@include file="../include/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").on("click", function(){
			if($('input:checkbox[id="agree"]').is(":checked")==false){
				alert("약관에 동의해주세요.");
				$("#submit").focus();
				return false;
			}	
		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@include file="../include/sideMenu.jsp"%>
		<div class = "bob_content">
			<h1 class="mt-4">Terms of Use</h1>
			<hr><br><br>
			
			<div class="panel-body">
  		 	<div class="row">
  		 	
       			<div class="col-lg-12">
            	<h4>이용약관</h4>
            		
          		<div class="panel-body" style="border: 1px solid #ccc">
           		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
       			</div>
        		<br><br>
      			 <h4>개인정보</h4>
       			 <div class="panel-body" style="border: 1px solid #ccc">
           		 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        		</div>
        		
      		  	<form role="form" action="${contextPath}/Member/SignUp2">
            		<div class="form-group">
                	
                	<br><br>
                	<label class="checkbox-inline">
                    	<input type="checkbox" id="agree">동의합니다.
                	</label>
           			 </div>
           			 <hr>
            		<input type="submit" id="submit" value="다음 단계">
        		</form>
    			</div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>