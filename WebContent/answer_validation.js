
function check() {

	var answers = document.getElementByNames("option");

	for (i = 0; i < answers.length; i++) {

		if (answers[i].checked) {
			console.log(answers[i]);
		}

	}


}
