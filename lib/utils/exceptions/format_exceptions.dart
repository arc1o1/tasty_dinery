// custom class to handle various errors related with formats
class CcFFormatException implements Exception {
  // error code associated with exception
  final String message;

  // constructor that takes in the error code
  const CcFFormatException(
      {this.message =
          "An unexpected format error has occurred. Please check your input."});

  // create the corresponding error message based on the error message
  factory CcFFormatException.fromMessage(String message) {
    return CcFFormatException(message: message);
  }

  // get the corresponding message now
  String get formattedMessage => message;

  // create format exception rom a specific error code
  factory CcFFormatException.fromCode(String code) {
    switch (code) {
      case "invalid-email-format":
        return const CcFFormatException(
            message:
                "The email address format is invalid. Please enter a valid email address.");
      case "invalid-phone-number-format":
        return const CcFFormatException(
            message:
                "The provided phone number format is invalid. Please enter a valid number.");
      case "invalid-date-format":
        return const CcFFormatException(
            message: "The date format is invalid. Please enter a valid date.");
      case "invalid-url-format":
        return const CcFFormatException(
            message: "The URL format is invalid. Please enter a valid URL.");
      case "invalid-numeric-format":
        return const CcFFormatException(
            message: "The input should be a valid numeric format.");
      default:
        return const CcFFormatException(
            message:
                "Input Format Error has occurred. Please validate the input in the specified format.");
    }
  }
}
