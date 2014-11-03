
/**
 * Validate str whether it is null or empty string
 * @param str
 */
function validateString(str) {
	if (str == null || str.trim() == "")
		return false;
	
	return true;
}

function validateString(str, min_length) {
	if (str == null || str.trim() == "")
		return false;
	
	if (str.length < min_length)
		return false;
	else
		return true;
}

/**
 * Validate email string format
 * @param email
 * @returns
 */
function validateEmail(email) {
	var rex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	return rex.test(email);
}

/**
 * Validate phone number string format is 10 digit only 
 * @param phone
 * @returns
 */
function validatePhone(phone) {
	var rex = /^\d{10}$/;  
	return rex.test(phone);
}

