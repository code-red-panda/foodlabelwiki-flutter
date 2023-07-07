import 'login.dart';

class EmailTile extends StatelessWidget {
  const EmailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.email),
          subtitle: TextField(
            
            onChanged: (email) =>
                context.read<LoginBloc>().add(EmailChanged(email)),
            decoration: InputDecoration(
              labelText: 'Email',
                counterText: '',
                border: OutlineInputBorder(borderRadius: borderMedium)),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            autofillHints: const <String>['Email'],
            maxLength: 50,
          ),
        );
      },
    );
  }
}

class PasswordTile extends StatefulWidget {
  const PasswordTile({super.key});

  @override
  State<PasswordTile> createState() => _PasswordTileState();
}

class _PasswordTileState extends State<PasswordTile> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = true;
    super.initState();
  }

  void setObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.lock),
          subtitle: TextField(
            onChanged: (password) =>
                context.read<LoginBloc>().add(PasswordChanged(password)),
            decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                    onPressed: () => setObscureText(),
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility)),
                counterText: '',
                border:  OutlineInputBorder(
                    borderRadius: borderMedium)),
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            obscureText: obscureText,
            autofillHints: const <String>['Password'],
            maxLength: 64,
          ),
        );
      },
    );
  }
}

class ConfirmPasswordTile extends StatefulWidget {
  const ConfirmPasswordTile({super.key});

  @override
  State<ConfirmPasswordTile> createState() => _ConfirmPasswordTileState();
}

class _ConfirmPasswordTileState extends State<ConfirmPasswordTile> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = true;
    super.initState();
  }

  void setObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.lock),
          subtitle: TextField(
            onChanged: (password) =>
                context.read<LoginBloc>().add(ConfirmPasswordChanged(password)),
            decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                    onPressed: () => setObscureText(),
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility)),
                counterText: '',
                border:  OutlineInputBorder(
                    borderRadius: borderMedium)),
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            obscureText: obscureText,
            autofillHints: const <String>['Password'],
          ),
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(const SignInWithEmail());
          },
          //style: actionButton(context),
          child: state.showLoader
              ? const CircularProgressIndicator()
              : const Text('Login'),
        );
      },
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(const SignUpWithEmail());
          },
          //style: actionButton(context),
          child: state.showLoader
              ? const CircularProgressIndicator()
              : Text(
                  'Signup',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
        );
      },
    );
  }
}
