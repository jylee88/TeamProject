<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
	function submitForm() {
		var getMail = RegExp(/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/);

		//이메일 공백
		if ($("#mb_email").val() == "") {
			alert("이메일을 써주세요");
			$("#mb_email").focus();

			return false;
		}

		//이메일 유효성검사 
		if (!getMail.test($("#mb_email").val())) {
			alert("이메일을 형식에 맞게 입력해주세요");
			$("#mb_email").val("");
			$("#mb_email").focus();

			return false;
		}
	};
</script>
</head>
<body>



	<table border="1" width="300" height="300" align="center">
		<center>
			<span style="color: green; font-weight: bold;">이메일 인증 (이메일을 인증
				받아야 다음 단계로 넘어갈 수 있습니다.)</span> <br> <br> <br> <br>




			<div style="text-align: center;">
				<tr>
					<td>
						<center>
							<form action="auth.do" onsubmit="return submitForm()" method="post">

								<center>
									<br>
									<div>
										이메일 : <input type="email" id="mb_email" name="mb_email"
											placeholder="  이메일주소를 입력하세요. ">
									</div>

									<br> <br>
									<button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
			</div>
			</td>
			</tr>
		</center>
	</table>
	</form>
	</center>

</body>
</html>
