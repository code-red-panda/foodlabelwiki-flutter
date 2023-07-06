part of 'login_bloc.dart';

enum PageType { login, signup, passwordReset }

class LoginState extends Equatable {
  final bool showLoader;
  final PageType pageType;
  final String email;
  final String password;
  final String confirmPassword;
  final String errorMessage;

  const LoginState({
    this.showLoader = false,
    this.pageType = PageType.login,
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [showLoader, pageType, email, password, confirmPassword, errorMessage];

  LoginState copyWith({
    bool? showLoader,
    PageType? pageType,
    String? email,
    String? password,
    String? confirmPassword,
    String? errorMessage,
  }) {
    return LoginState(
      showLoader: showLoader ?? this.showLoader,
      pageType: pageType ?? this.pageType,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
