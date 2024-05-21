class CcFirebaseAuthException implements Exception {
  // error code associated with exception
  final String code;

  // constructor that takes in the error code
  CcFirebaseAuthException({required this.code});

  // get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "The email address is already registered. Please use a different email.";
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
      case 'invalid-verification-code':
        return "Invalid verification code. Please enter a valid code.";
      case 'invalid-verification-id':
        return "Invalid verification ID. Please request for a new verification code.";
      case 'quota-exceeded':
        return "Quota exceeded. Please try again later.";
      case 'email-already-exist':
        return "The email address is already registered. Please use a different email.";
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
      case 'user-token-expired':
        return "The user's token has expired, and authentication is required. Please sign in again.";
      case 'invalid-recipient-email':
        return "The recipient email address is invalid. Please provide a valid recipient email.";
      case 'invalid-credential':
        return "The supplied credential is malformed or has expired.";
      case 'user-token-revoked':
        return "The user's token has been revoked. Please sign-in again.";
      case 'invalid-message-payload':
        return "The email template verification message payload is invalid.";
      case 'invalid-sender':
        return "The email template sender is invalid. Please verify sender's email.";
      default:
        return "An unexpected Firebase error occured. Please try again.";
    }
  }
}
