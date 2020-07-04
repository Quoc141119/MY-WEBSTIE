// Thong bao khi checkout
function checkoutNotification() {
	if( location.search.split('status=')[1] === "success"){
		alert('Success!')
		return true;
	}
	else{
		alert('Shop now!')
		return false;
	}	
}

// Validate du lieu khi them Customer
function customerValidate() {
	var patternPhone = /^[0-9]{10}$/;
	var customerName = document.getElementById('customerName').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var email = document.getElementById('email').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('address').value;
	if(customerName == ""){
		alert('Họ và tên không được bỏ trống!');
		return false;
	}
	if(username == ""){
		alert('Tên đăng nhập không được bỏ trống!');
		return false;
	}
	if(password == ""){
		alert('Mật khẩu không được bỏ trống!');
		return false;
	}
	if(email == ""){
		alert('Email không được bỏ trống!');
		return false;
	}
	if(!patternPhone.test(phone) || phone == ""){
		alert('Số điện thoại gồm 10 chữ số!');
		return false;
	}
	if(address == ""){
		alert('Địa chỉ không được bỏ trống!');
		return false;
	}
	return true;
}