document.addEventListener('turbolinks:load', function() {
	var passwordConfirmation = document.querySelector('#user_password_confirmation')

	if (passwordConfirmation) {
		passwordConfirmation.addEventListener('input', checkPassword)
	}
})

function checkPassword() {
	var passwordFieldValue = document.querySelector('#user_password').value
	var passwordConfirmationValue = document.querySelector('#user_password_confirmation').value
	if (passwordFieldValue != passwordConfirmationValue) {
		document.querySelector('#user_password_confirmation').classList.add('is-invalid')
	} else {
		document.querySelector('#user_password_confirmation').classList.remove('is-invalid')
	}
}
