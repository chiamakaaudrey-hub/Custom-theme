/// Exception class for handling various platform-related errors
class TPlatformException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  TPlatformException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'sign_in_failed':
        return 'Sign-in failed. PLease try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
        // Add more cases as needed...
      default:
        return 'An unexpected platform error occurred. Please try again.';
    }
  }
}
