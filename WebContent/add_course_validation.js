function addcoursevalidation() {
	document.getElementById('s1').innerHTML = " ";
	document.getElementById('s2').innerHTML = " ";
	document.getElementById('s3').innerHTML = " ";
	if (course_name() && total_ques() && time()) {
		
		addcourseform.submit();

	}
}

function course_name() {
	a = document.getElementById('t1').value;
	if (a.length >= 1) {
		return true;
	}
	else {
		document.getElementById('s1').innerHTML = "enter valid course name";
		return false;
	}
}

function total_ques() {
	a = document.getElementById('t2').value;
	if (a.length >= 1) {
		return true;
	}
	else {
		document.getElementById('s2').innerHTML = "enter valid question number";
		return false;
	}
}
function time() {
	a = document.getElementById('t3').value;
	if (a.length >= 2) {
		return true;
	}
	else {
		document.getElementById('s3').innerHTML = "enter valid Time";
		return false;
	}
}