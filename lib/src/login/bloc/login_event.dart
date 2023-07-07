part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class PageTypeChanged extends LoginEvent {
  final PageType pageType;

  const PageTypeChanged(this.pageType);
}

final class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

final class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

final class ConfirmPasswordChanged extends LoginEvent {
  final String password;

  const ConfirmPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

final class SignInWithEmail extends LoginEvent {
  const SignInWithEmail();
}

final class SignUpWithEmail extends LoginEvent {
  const SignUpWithEmail();
}

final class PasswordReset extends LoginEvent {
  const PasswordReset();
}

final class ClearErrorMessage extends LoginEvent {
  const ClearErrorMessage();
}
