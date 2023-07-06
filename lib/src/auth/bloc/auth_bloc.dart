import '../auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// To separate out "stuff" all custom auths/user expect an
/// AuthRepo and AuthUser
/// With ChangeNotifier for GoRouter
class AuthBloc extends Bloc<AuthEvent, AuthState> with ChangeNotifier {
  final AuthRepo _authRepo;
  late final StreamSubscription<AuthUser> _subscription;

  AuthBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const AuthState.loading()) {
    on<_UserChanged>(_onUserChanged);
    on<SignOut>(_onSignOut);
    _subscription = _authRepo.authUser.listen(
      (user) => add(_UserChanged(user)),
    );
  }

  Future<void> _onUserChanged(
    _UserChanged event,
    Emitter<AuthState> emit,
  ) async {
    if (event.user.isEmpty) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(event.user));
    }
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepo.signOut();
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
