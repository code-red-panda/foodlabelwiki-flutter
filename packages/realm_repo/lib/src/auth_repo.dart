import 'dart:async';
import '/src/models/auth_user.dart';
import '/src/exceptions.dart';
import 'package:realm/realm.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//GOOGLE import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

class AuthRepo {}
/*
class AuthRepo {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  //GOOGLE final GoogleSignIn _googleSignIn;

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  AuthRepo({
    firebase_auth.FirebaseAuth? firebaseAuth,
    //GOOGLE GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
        //GOOGLE _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  /// Stream of [AuthUser] which will emit the current user when
  /// the AuthRepo state changes.
  ///
  /// Emits [AuthUser.empty] if the user is not authenticated.
  Stream<AuthUser> get authUser {
    return _firebaseAuth.userChanges().map((firebaseUser) {
      final AuthUser authUser =
          firebaseUser == null ? AuthUser.empty : firebaseUser.toAuthUser;
      return authUser;
    });
  }

  /// Refresh the current user if signed in
  ///
  /// Throws a [ReloadFailure] if an exception occurs.
  Future<void> reload() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } catch (_) {
      throw ReloadFailure();
    }
  }

  /// Signs up with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [SignInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignInWithEmailAndPasswordFailure();
    }
  }
//GOOGLE 
/*
  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [SignInWithGoogleFailure] if an exception occurs.
  Future<void> signInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const SignInWithGoogleFailure();
    }
  }
*/
  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [SignOutFailure] if an exception occurs.
  Future<void> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
       //GOOGLE  _googleSignIn.signOut(),
      ]);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
      throw SignOutFailure();
    }
  }

  /// Sends a password reset email.
  ///
  /// Throws a [SendPasswordResetEmailFailure] if an exception occurs.
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SendPasswordResetEmailFailure.fromCode(e.code);
    } catch (_) {
      throw const SendPasswordResetEmailFailure();
    }
  }

  /// Reauthenticate a user with a credential.
  ///
  /// Throws a [ReAuthenticateFailure] if an exception occurs.
  Future<void> reAuthenticate({
    required String email,
    required String password,
  }) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      await _firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw ReAuthenticateFailure.fromCode(e.code);
    } catch (_) {
      throw const ReAuthenticateFailure();
    }
  }

  /// Updates a user's email (a recent login is required).
  ///
  /// Throws a [UpdateEmailFailure] if an exception occurs.
  Future<void> updateEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.currentUser?.updateEmail(email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw UpdateEmailFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdateEmailFailure();
    }
  }

  /// Updates a user's password (a recent login is required).
  ///
  /// Throws a [UpdatePasswordFailure] if an exception occurs.
  Future<void> updatePassword({
    required String password,
  }) async {
    try {
      await _firebaseAuth.currentUser?.updatePassword(password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw UpdatePasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdatePasswordFailure();
    }
  }
}

/// Maps a Firebase Auth User to our AuthUser
extension on firebase_auth.User {
  AuthUser get toAuthUser => AuthUser(id: uid, email: email ?? '');
}
*/