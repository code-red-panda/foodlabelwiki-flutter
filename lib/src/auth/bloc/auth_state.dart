part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthUser user;
  final bool loading;

  const AuthState._({this.user = AuthUser.empty, this.loading = true});
  const AuthState.authenticated(user) : this._(user: user, loading: false);
  const AuthState.unauthenticated() : this._(user: AuthUser.empty, loading: false);
  const AuthState.loading() : this._(); // used for displaying splash image

  @override
  List<Object> get props => [user];
}
