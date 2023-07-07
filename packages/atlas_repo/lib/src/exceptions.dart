/// Thrown during the Email sign-up process if a failure occurs.
class SignUpWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

/// Thrown during the Email sign-in process if a failure occurs.
class SignInWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignInWithEmailAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
  factory SignInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }
}

/// Thrown during the Google sign-in process if a failure occurs.
class SignInWithGoogleFailure implements Exception {
  final String message;

  const SignInWithGoogleFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
  factory SignInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const SignInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const SignInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const SignInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const SignInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const SignInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const SignInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const SignInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const SignInWithGoogleFailure();
    }
  }
}

/// Thrown during the sign-out process if a failure occurs.
class SignOutFailure implements Exception {}

/// Thrown during the reset password email process if a failure occurs.
class SendPasswordResetEmailFailure implements Exception {
  final String message;

  const SendPasswordResetEmailFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/sendPasswordResetEmail.html
  factory SendPasswordResetEmailFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SendPasswordResetEmailFailure(
          'Email is not valid or badly formatted.',
        );
      case 'missing-android-pkg-name':
        return const SendPasswordResetEmailFailure(
          'Missing Android package name.',
        );
      case 'missing-continue-uri':
        return const SendPasswordResetEmailFailure(
          'Missing continue URL.',
        );
      case 'missing-ios-bundle-id':
        return const SendPasswordResetEmailFailure(
          'Missing IOS Bundle ID.',
        );
      case 'invalid-continue-uri':
        return const SendPasswordResetEmailFailure(
          'Continue URL is not valid or badly formatted.',
        );
      case 'unauthorized-continue-uri':
        return const SendPasswordResetEmailFailure(
          'Continue URL is not whitelisted in Firebase.',
        );
      case 'user-not-found':
        return const SendPasswordResetEmailFailure(
          'No user found matching this email address.',
        );
      default:
        return const SendPasswordResetEmailFailure();
    }
  }
}

/// Thrown during the reauthentication process if a failure occurs.
class ReAuthenticateFailure implements Exception {
  final String message;

  const ReAuthenticateFailure(
      [this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/reauthenticateWithCredential.html
  factory ReAuthenticateFailure.fromCode(String code) {
    switch (code) {
      case 'user-mismatch':
        return const ReAuthenticateFailure(
          'Credential does not match user.',
        );
      case 'user-not-found':
        return const ReAuthenticateFailure(
          'Credential does not match existing user.',
        );
      case 'invalid-credential':
        return const ReAuthenticateFailure(
          'Credential is invalid or expired.',
        );
      case 'invalid-email':
        return const ReAuthenticateFailure(
          'Email is not valid or badly formatted.',
        );
      case 'wrong-password':
        return const ReAuthenticateFailure(
          'Credential is incorrect or this account does not have a password.',
        );
      default:
        return const ReAuthenticateFailure();
    }
  }
}

/// Thrown during the update email process if a failure occurs.
class UpdateEmailFailure implements Exception {
  final String message;

  const UpdateEmailFailure([this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/updateEmail.html
  factory UpdateEmailFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const UpdateEmailFailure(
          'Email is not valid or badly formatted.',
        );
      case 'email-already-in-use':
        return const UpdateEmailFailure(
          'Email is already used in another account.',
        );
      case 'requires-recent-login':
        return const UpdateEmailFailure(
          'A recent login is required to complete this operation.',
        );
      default:
        return const UpdateEmailFailure();
    }
  }
}

/// Thrown during the update password process if a failure occurs.
class UpdatePasswordFailure implements Exception {
  final String message;

  const UpdatePasswordFailure([
    this.message = 'An unknown exception occurred.'
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/updatePassword.html
  factory UpdatePasswordFailure.fromCode(String code) {
    switch (code) {
      case 'weak-password':
        return const UpdatePasswordFailure(
          'Password is not strong enough.',
        );
      case 'requires-recent-login':
        return const UpdatePasswordFailure(
          'A recent login is required to complete this operation.',
        );
      default:
        return const UpdatePasswordFailure();
    }
  }
}

/// Thrown during the reload process if a failure occurs.
class ReloadFailure implements Exception {}