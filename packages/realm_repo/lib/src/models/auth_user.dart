import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String email;

  const AuthUser({required this.id, required this.email});

  static const empty = AuthUser(id: '', email: '');

  bool get isEmpty => this == AuthUser.empty;
  bool get isNotEmpty => this != AuthUser.empty;

  @override
  List<Object> get props => [id, email];
}