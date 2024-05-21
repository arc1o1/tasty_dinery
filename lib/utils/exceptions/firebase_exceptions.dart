class CcFirebaseException implements Exception {
  // error code associated with exception
  final String code;

  // constructor that takes in the error code
  CcFirebaseException({required this.code});

  // get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case "unknown":
        return "An unknown Firebase error occured. Please try again.";
      case "invalid-custom-token":
        return "The custom token format is incorrect. Please check your custom token.";
      case "custom-token-mismatch":
        return "The custom token corresponds to different audience.";
      case 'invalid-email':
        return "The email address provided is invalid. Please enter a valid email.";
      case 'weak-password':
        return "The password is too weak. Please choose a stronger password.";
      case 'user-disabled':
        return "This user account has been disabled. Please contact support for assistance.";
      case 'user-not-found':
        return "Invalid login details. User not found.";
      case 'wrong-password':
        return "Incorrect password. Please check your password and try again.";
      case "email-already-in-use":
        return "The email address is already registered. Please use a different email";
      case 'provider-already-linked':
        return "The account is already linked to another provider.";
      case 'requires-recent-login':
        return "This operation is sensitive and requires recent authentication. Please login again.";
      case 'credential-already-in-use':
        return "This credential is already associated with a different user account.";
      case 'user-mismatch':
        return "The supplied credentials do not match to the previous signed-in user.";
      case 'account-exist-with-different-credential':
        return "An account already exist with the same email but different sign-in credentials.";
      case 'operation-not-allowed':
        return "This operation is not allowed. Please contact sopport for inquiries.";
      case 'expired-action-code':
        return "The action code has expired. Please request new action code.";
      case 'invalid-action-code':
        return "The action code is invalid. Please check the code and try again.";
      case 'missing-action-code':
        return "The action code is missing. Please provide a valid action code.";
      case 'captch-check-failed':
        return "The reCAPTCHA response is invalid. Please try again.";
      case 'app-not-authorized':
        return "The app is not authorized to use Firebase Authentication with the provided API key.";
      case 'keychain-error':
        return "A keychain error occurred. Please check the keychain and try again.";
      case 'internal-error':
        return "An internal Authentication error has occurred. Please try again later.";
      default:
        return "An unexpected Firebase error occured. Please try again.";
    }
  }
}
