<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form method="post" atcion="join">
		<div>
			<label>ID : </label> <input type="text" name="id" id="idEle" /> <span
				id="idCheckMsg"></span>
		</div>
		<div>
			<label>이름 : </label> <input type="text" name="name" />
		</div>
		<div>
			<label>PASS : </label> <input type="text" name="pass" />
		</div>
	</form>
	<script type="text/javascript">
		document.getElementById("idEle").addEventListener("keyup", () => {
			console.log(idEle.value);
			requestIdCheck(idEle.value);
		});
		function requestIdCheck(idVal){
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = () => {
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						console.log('서블릿 결과 : ', xhr.responseText);
						let msg = "이미 사용중인 아이디입니다."
						if(xhr.responseText=='success'){
							msg = "사용가능한 아이디입니다."
						}
						document.getElementById("idCheckMsg").innerText = msg;
					}
				}
			};
			xhr.open("GET", "idcheck?id=" + idVal);
			xhr.send();
		}
	</script>
</body>
</html>