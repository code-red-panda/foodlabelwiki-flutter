import '../login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo;

  LoginBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const LoginState()) {
          on<PageTypeChanged>(_onPageTypeChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignInWithEmail>(_onSignInWithEmail);
    on<SignUpWithEmail>(_onSignUpWithEmail);
    on<PasswordReset>(_onPasswordReset);
    on<ClearErrorMessage>(_onClearErrorMessage);
  }

    void _onPageTypeChanged(
    PageTypeChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(pageType: event.pageType));
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

    void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.password));
  }

  Future<void> _onSignInWithEmail(
    SignInWithEmail event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(showLoader: true));

      await _authRepo.signInWithEmail(
        email: state.email,
        password: state.password,
      );

      emit(const LoginState());
    } on CustomException catch (e) {
      emit(state.copyWith(
        showLoader: false,
        errorMessage: e.message,
      ));
    } catch (_) {
      emit(state.copyWith(
        showLoader: false,
        errorMessage: 'Login failed. Check email and password.',
      ));
    }
  }

  Future<void> _onSignUpWithEmail(
    SignUpWithEmail event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(showLoader: true));

      if (state.password != state.confirmPassword) {
        throw CustomException('Passwords do not match');
      }

      await _authRepo.signUpWithEmail(
        email: state.email,
        password: state.password,
      );
      emit(const LoginState());
    } on CustomException catch (e) {
      emit(state.copyWith(
        showLoader: false,
        errorMessage: e.message,
      ));
    } catch (_) {
      emit(state.copyWith(
        showLoader: false,
        errorMessage: 'Signup failed. Please try again.',
      ));
    }
  }

    Future<void> _onPasswordReset(
    PasswordReset event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(showLoader: true));
      print('implement realm pw reset');
      //await _authRepo.sendPasswordResetEmail(
        //email: state.email,
      //);
      emit(const LoginState());
    } on CustomException {
      emit(state.copyWith(
        showLoader: false,
        email: '',
      ));
    } catch (_) {
      emit(state.copyWith(
        showLoader: false,
        email: '',
      ));
    }
  }

  void _onClearErrorMessage(
    ClearErrorMessage event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(errorMessage: ''));
  }
}
