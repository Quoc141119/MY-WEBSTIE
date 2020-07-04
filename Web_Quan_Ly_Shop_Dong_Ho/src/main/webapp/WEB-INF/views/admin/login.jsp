<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='./static/images/favicon.ico' />">
<script src="./static/js/validate-admin.js"></script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 0;
}

img.avatar {
	width: 350px;
	height:350px;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<form action="admin-login" method="post">
				<div class="imgcontainer">
					<img src="./static/images/employees/14.jpg" alt="Avatar"
						class="avatar">
				</div>

				<div style="width: 50%; margin: 0 auto">
					<label for="uname"><b>Username</b></label> <input type="text"
						placeholder="Enter Username" value="${uname }" name="uname"
						required> <label for="psw"><b>Password</b></label> <input
						type="password" placeholder="Enter Password" value="${psw }"
						name="psw" id="password" required>
					<p style="color: red;">${message }</p>
					<input type="checkbox" onclick="Toggle()"> <b>Hiển thị
						mật khẩu</b>
					<button type="submit">Login</button>
				</div>

			</form>
		</div>
		<div class="col-3"></div>
	</div>
</div>

</body>
</html>
