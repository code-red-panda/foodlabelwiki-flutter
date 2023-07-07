import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String email;

  const AuthUser({
    required this.id,
    required this.email,
  });

  const AuthUser.emptyConstructor({this.id = '', this.email = ''});

  static const empty = AuthUser(id: '', email: '');

  bool get isEmpty => this == AuthUser.emptyConstructor();
  bool get isNotEmpty => this != AuthUser.emptyConstructor();

  @override
  List<Object> get props => [id, email];
}
