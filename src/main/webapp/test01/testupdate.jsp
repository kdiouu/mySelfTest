<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function passwordCheck() {
		var NewPasswordValue = document.getElementById("password").value;
		var Engpattern = new RegExp(/^[^a-zA-Z]+$/);
		var Numpattern = new RegExp(/^[^0-9]+$/);
		// var Sppattern = new RegExp( /^[[!@#$%^&]/*)]+$/);

		if (NewPasswordValue == "") {
			document.getElementById("NewPasswordBox").innerHTML = "不能為空"
		} else if (document.getElementById("password").value.length < 6) {
			document.getElementById("NewPasswordBox").innerHTML = "至少6個字"
		} else if (!(contain(document.getElementById("password").value,
				"[!@#$%^&*])"))) {
			document.getElementById("NewPasswordBox").innerHTML = "至少包含一個特殊字元"
		} else if (Numpattern.test(NewPasswordValue)) {
			document.getElementById("NewPasswordBox").innerHTML = "至少包含一個數字"
		} else if (Engpattern.test(NewPasswordValue)) {
			document.getElementById("NewPasswordBox").innerHTML = "至少包含一個英文"
		} else {
			document.getElementById("NewPasswordBox").innerHTML = "成功輸入"
			return true;
		}
	}

	function contain(str, charset) {
		var i;
		for (i = 0; i < charset.length; i++)
			if (str.indexOf(charset.charAt(i)) >= 0)
				return true;
		return false;
	}

	function nameCheck() {
		var NewStringValue = document.getElementById("name").value;
		var reg = /[^\x00-\x80]/;
		if (NewStringValue == "") {
			document.getElementById("NewStringBox").innerHTML = "不能為空"

		} else if (!reg.test(NewStringValue)) {
			document.getElementById("NewStringBox").innerHTML = "必須為漢字";

		} else if (document.getElementById("name").value.length < 2) {
			document.getElementById("NewStringBox").innerHTML = "至少兩個漢字"

		} else {
			document.getElementById("NewStringBox").innerHTML = "輸入正確"

			return true;
		}

	}

	function dateCheck() {
		var NewDateValue = document.getElementById("date").value;
		var Datepattern = new RegExp(
				"^\([0-9]{4})[./]{1}([0-9]{1,2})[./]{1}([0-3]{1}[0-9]{1})$");
		if (!Datepattern.test(NewDateValue)) {
			document.getElementById("NewDateBox").innerHTML = "須符合格式"

		} else {
			document.getElementById("NewDateBox").innerHTML = "輸入正確"
			return true;
		}
	}

	function validateForm(form) {
		if (!dateCheck() || !nameCheck() || !passwordCheck()) {
			alert("資料有誤，表單將不送出！");
			return (false);
		}
		form.submit();
		return (true);
	}
	function reset00() {
		document.getElementById("NewStringBox").innerHTML = ""
		document.getElementById("NewPasswordBox").innerHTML = ""
		document.getElementById("NewDateBox").innerHTML = ""
	}
</script>
<style>
.img02 {
	width: 20px;
}

fieldset {
	width: 400px;
	border: 1px solid green;
	border-radius: 15px;
	font-family: 'Noto Sans TC', sans-serif
}

.div1 {
	margin: 10px;
	border-bottom: 1px solid rgb(201, 199, 199);
}

#buttom {
	text-align: center;
	padding: 10px;
}

.p02 {
	font-size: 10px;
	color: dimgray;
}

.span02 {
	font-size: 10px;
}
</style>
<body>
	<form action="testUpdate.do" method="POST">
		<fieldset>
			<legend>Form Check</legend>
			<div class="div1">
				<label for="name">姓名:</label> <input type="text" id="name"
					name="name" onblur="nameCheck()"> <span class="span02"
					id="NewStringBox"></span>
				<p class="p02">(1.不可空白，2.至少兩個字以上，3.必須全部為中文字)</p>
			</div>
			<div class="div1">
				<label for="password">密碼:</label> <input type="password"
					id="password" name="password" placeholder="請輸入密碼"
					onblur="passwordCheck()"> <span class="span02"
					id="NewPasswordBox"></span>
				<p class="p02">(1.不可空白，2.至少6個字且必須包含英文字母、數字、特殊字元[!@#$%^&*])</p>
			</div>
			<div class="div1">
				<label for="date">日期</label> <input type="text" id="date"
					name="date" placeholder="ex:2000/2/29" onblur="dateCheck()">
				<span class="span02" id="NewDateBox"></span>
				<p class="p02">格式:西元年/月/日 yyyy/MM/dd</p>

			</div>
			<div id="buttom">
				<input type="button" value="送出" onClick="validateForm(this.form)">
				<input type="reset" value="清除" onClick="reset00()">
			</div>
		</fieldset>
	</form>
</body>
</html>