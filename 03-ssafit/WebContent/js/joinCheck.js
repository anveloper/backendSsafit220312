document.getElementById("signinId").addEventListener("keyup",()=>{
		requestIdCheck(signinId.value);			
	});
		
function requestIdCheck(idVal){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			let ms = document.getElementById("idCheckMsg");
			let next = document.getElementById("signinPassword");
			let resp = xhr.responseText;
			console.log('Id Check Servlet result :', resp);
			ms.style.color = 'orange';
			next.readOnly = true;
			let msg = "";
			if(resp == 'null'){
				msg = "";
			} else if(resp == 'exist') {
				msg = "사용중인 아이디입니다.";
				ms.style.color = 'red';
			} else if(resp == 'short') {
				msg = "너무 짧습니다. 5자 이상만 가능합니다.";				
			} else if(resp == 'long') {
				msg = "너무 깁니다. 16자 이하만 가능합니다.";					
			} else if(resp == 'firstfail') {
				msg = "첫글자는 영문 소문자이어야 합니다.";
			} else if(resp == 'fail') {
				msg = "영문 소문자와 숫자만 사용할 수 있습니다.";
			} else if(resp == 'pass') {
				msg = "사용 가능한 아이디 입니다.";
				ms.style.color = 'green';
				next.readOnly = false;
			} 					
			ms.innerText = msg;
		}	
	}
	xhr.open("GET", "/03-ssafit/ssafit/joincheck?userId=" + idVal);
	xhr.send();
};
		
document.getElementById("signinPassword").addEventListener("keyup",()=>{
		requestPassCheck(signinPassword.value);			
	});
		
function requestPassCheck(passVal){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			let ms = document.getElementById("passCheckMsg");
			let next = document.getElementById("signinPasswordc");
			let resp = xhr.responseText;
			console.log('Password Check Servlet result :', resp);
			ms.style.color = 'orange';
			next.readOnly = true;
			let msg = "";
			if(resp == 'null'){
				msg = "";
			} else if(resp == 'short') {
				msg = "너무 짧습니다. 8자 이상만 가능합니다.";				
			} else if(resp == 'long') {
				msg = "너무 깁니다. 20자 이하만 가능합니다.";					
			} else if(resp == 'fail') {
				msg = "영문 소문자와 숫자만 사용할 수 있습니다.";
				ms.style.color = 'red';
			} else if(resp == 'pass') {
				msg = "사용 가능한 비밀번호입니다.";
				ms.style.color = 'green';
				next.readOnly = false;
			} 					
			ms.innerText = msg;
		}	
	}
	xhr.open("GET", "/03-ssafit/ssafit/joincheck?password=" + passVal);
	xhr.send(null);
};

document.getElementById("signinPasswordc").addEventListener("keyup",()=>{
		let ms = document.getElementById("passCCheckMsg");
		let next = document.getElementById("signinNickname");
		let p = document.getElementById("signinPassword").value;	
		let c = signinPasswordc.value;	
		next.readOnly = true; 
		ms.style.color = 'red';
		if(c.length==0) {
			ms.innerText = "";
		} else if(p != c) {
			ms.style.color = 'orange'; 
			ms.innerText = "비밀번호가 일치하지 않습니다.";
		} else if(p == c) {
			ms.innerText = "";
			next.readOnly = false;
		}
	});

document.getElementById("signinNickname").addEventListener("keyup",()=>{
		requestNickCheck(signinNickname.value);			
	});

function requestNickCheck(nickVal){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			let ms = document.getElementById("nameCheckMsg");
			let next = document.getElementById("joinSubmit");
			let resp = xhr.responseText;
			console.log('Nickname Check Servlet result :', resp);
			ms.style.color = 'orange';
			next.disabled = true;
			let msg = "";
			if(resp == 'null'){
				msg = "";
			} else if(resp == 'short') {
				msg = "2자 이상 가능합니다.";				
			} else if(resp == 'long') {
				msg = "8자 이하만 가능합니다.";					
			} else if(resp == 'exist') {
				msg = "사용중인 닉네임입니다.";
				ms.style.color = 'red';
			} else if(resp == 'pass') {
				msg = "사용 가능한 닉네임입니다.";
				ms.style.color = 'green';
				next.disabled = false;
			} 					
			ms.innerText = msg;
		}	
	}
	xhr.open("GET", "/03-ssafit/ssafit/joincheck?nickname=" + nickVal);
	xhr.send(null);
};



