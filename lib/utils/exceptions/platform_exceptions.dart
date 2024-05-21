// class to handle various platform related errors
class CcPlatformException implements Exception {
  // error code associated with exception
  final String code;

  // constructor that takes in the error code
  CcPlatformException(this.code);

  // get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case "INVALID_LOGIN_CREDENTIALS":
        return "Invalid login credentials. Please double check your information.";
      case "too-many-request":
        return "Too many requests. Please try again later.";
      case "invalid-argument":
        return "Invalid argument provided by to the authentication method.";
      case "invalid-password":
        return "Incorrect password. Please check again.";
      case "invalid-phone-number":
        return "The phone number is invalid.";
      case "operation-not-allowed":
        return "The sign-in provider is disabled for you Firebase project.";
      case "session-cookie-expired":
        return "The Firebase session cookie has expired. Please sign-in again.";
      case "uid-already-exist":
        return "The provider user ID is already in use by another user.";
      case "sign_in_failed":
        return "Sign-in failed. Please try again.";
      case "network-request-failed":
        return "Network request failed. Please check your internet connection";
      case "internal-error":
        return "Internal error occurred. Please try again later.";
      case 'invalid-verification-code':
        return "Invalid verification code. Please enter a valid code.";
      case 'invalid-verification-id':
        return "Invalid verification ID. Please request for a new verification code.";
      case 'quota-exceeded':
        return "Quota exceeded. Please try again later.";
      default:
        return "A platform error has occurred. Make sure you have stable internet and valid account credentials.";
    }
  }
}
