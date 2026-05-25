/// Custom exception class to handle various format-related errors
class TFormatException implements Exception {
  /// The associated error message
  final String message;

  /// Default constructor with a generic error message
  TFormatException([this.message = 'An unexpected error occurred. Please check your input.']);

  /// Create a format exception from a specific error message
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code
  factory TFormatException.fromCode(String code) {
    switch(code) {
      case 'invalid-email-format':
        return TFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return TFormatException('The provided phone number is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return TFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return TFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return TFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return TFormatException('The input should be a valid numeric valid.');
      default:
        return TFormatException('An unexpected error occurred. Please check your input.');
    }

}


}



