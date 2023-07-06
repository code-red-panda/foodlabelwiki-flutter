part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class _UserChanged extends AuthEvent {
  final AuthUser user;
  
  const _UserChanged(this.user);
}

class SignOut extends AuthEvent {}
