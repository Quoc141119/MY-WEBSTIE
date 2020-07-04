function validateFormAddProduct() {
	// const dg = Number(document.getElementById('dg').value);
	var sl = (document.getElementById('Quantity').value);

	var intRegex = /^\d+$/;
	if (sl != '') {
		if (intRegex.test(sl) == false) {
			// alert('Số Lượng Không Hợp Lệ');
			return "admin/addproduct";
		} else
			alert('Success!');
	}
}

function validateFormTK() {
	// const dg = Number(document.getElementById('dg').value);
	var date1 = (document.getElementById('date1').value);
	var date2 = (document.getElementById('date2').value);
	
	var regEx = /^\d{4}-\d{2}-\d{2}$/;
	var x = new Date(date1);
	var y = new Date(date2);
	if (date1 != '' && date2 != '' && regEx.test(date1) && regEx.test(date2) && x <=y) {
		return true;
	}
	alert('Vui lòng chọn đúng ngày để tiếp tục!');
	return false;
}

function validateFormSearch() {
	// const dg = Number(document.getElementById('dg').value);
	var search = (document.getElementById('search').value);

	if (search != '') {
		return true;
	}
	alert('Vui lòng nhập thông tin để tiếp tục!');
	return false;
}

function validateFormAddProduct() {
	// const dg = Number(document.getElementById('dg').value);
	var supplier = (document.getElementById('listsupplier').value);
	var category = (document.getElementById('listcategory').value);
	var price = (document.getElementById('Price').value);
	var discount = (document.getElementById('Discount').value);
	var floatValues = /[+]?([0-9]*[.])?[0-9]+/;

	if (supplier != '' && category != '' && discount.match(floatValues)
			&& discount >= 0 && discount <= 100 && price.match(floatValues)
			&& price >= 1) {
		return true;
	} else {
		if (supplier == '') {
			alert('Không tìm thấy nhà sản xuất!');
			return false;
		}
		if (category == '') {
			alert('Không tìm thấy danh mục!');
			return false;
		}

		alert('Giảm giá hoặc đơn giá không hợp lệ');
		return false;

	}
	return false;
}

function validateFormEditProduct() {
	// const dg = Number(document.getElementById('dg').value);

	var price = (document.getElementById('Price').value);
	var discount = (document.getElementById('Discount').value);
	var floatValues = /[+]?([0-9]*[.])?[0-9]+/;

	if (discount.match(floatValues) && discount >= 0 && discount <= 100
			&& price.match(floatValues) && price >= 1) {
		return true;
	} else {

		alert('Giảm giá hoặc đơn giá không hợp lệ');
		return false;

	}
	return false;
}

function Toggle() {
	var temp = document.getElementById("password");
	if (temp.type == "password") {
		temp.type = "text";
	} else {
		temp.type = "password";
	}
}
