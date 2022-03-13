window.onload = function() {
	if (getCookie("savedUserId")) {
		console.log(getCookie("savedUserId"));
		document.getElementById("loginId").value = getCookie("savedUserId");
		document.getElementById("saveIdBtn").checked = true;
	}
}

function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ todayDate.toGMTString() + ";";
}

function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) {
		let offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			let end = document.cookie.indexOf(";", offset);
			if (end == -1) {
				end = document.cookie.length;
			}
			return unescape(document.cookie.substring(offset, end));
		}
	}
}

function sendIt() {
	var frm = document.getElementById("loginForm");
	let idm = document.getElementById("loginIdMsg");
	let pwm = document.getElementById("loginPwMsg");
	idm.innerText = "";
	pwm.innerText = "";
	if (!frm.userId.value) {
		idm.innerText = "아이디를 입력해 주세요.";
		frm.password.value = "";
		frm.userId.focus();
		return;
	}
	if (!frm.password.value) {
		pwm.innerText = "비밀번호를 입력해 주세요.";
		frm.password.focus();
		return;
	}

	if (frm.checkId.checked == true) {
		setCookie("savedUserId", frm.userId.value, 7);
	} else {
		setCookie("savedUserId", frm.userId.value, 0);
	}

	frm.submit();

}