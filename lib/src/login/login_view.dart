import 'login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          appBar: const TabBar(
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                text: 'Sign-up',
                icon: Icon(Icons.start),
              ),
              Tab(
                text: 'Sign-in',
                icon: Icon(Icons.login),
              ),
              Tab(
                text: 'Reset password',
                icon: Icon(Icons.lock_reset),
              ),
            ],
          ),
          body: BlocProvider(
            create: (context) =>
                LoginBloc(authRepo: RepositoryProvider.of<AuthRepo>(context)),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.errorMessage.isNotEmpty) {
                  ErrorSnackBar.show(context, state.errorMessage);
                  context.read<LoginBloc>().add(const ClearErrorMessage());
                }
              },
              child: Container(
                margin: marginCompact,
                child: TabBarView(
                  children: [
                    TabView(
                      text: 'Welcome',
                      button: signUpButton,
                      children: const [
                        EmailTile(),
                        PasswordTile(),
                        ConfirmPasswordTile(),
                      ],
                    ),
                    TabView(
                      text: 'Welcome back',
                      button: signInButton,
                      children: const [EmailTile(), PasswordTile()],
                    ),
                    TabView(
                      text: 'We got you',
                      button: requestButton,
                      children: const [EmailTile()],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      
    );
  }
}

class TabView extends StatelessWidget {
  final String text;
  final FilledButton button;
  final List<Widget> children;

  const TabView({
    required this.text,
    required this.button,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(text,
              style: secondaryFont(Theme.of(context).textTheme.displaySmall!)),
        ),
        Card(
          child: Container(
            margin: cardContentMargin,
            child: Column(
              children: children,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: FilledButton.icon(
      onPressed: () => print('sign up'),
      icon: const Icon(Icons.start),
      label: const Text('Sign-up'),
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.surfaceTint)),
    ),
          ),
        ),
      ],
    );
  }
}

FilledButton get signUpButton => FilledButton.icon(
      onPressed: () => print('sign up'),
      icon: const Icon(Icons.start),
      label: const Text('Sign-up'),
      //style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primaryContainer)),
    );

FilledButton get signInButton => FilledButton.icon(
      onPressed: () => print('sign in'),
      icon: const Icon(Icons.login),
      label: const Text('Sign-in'),
    );

FilledButton get requestButton => FilledButton.icon(
      onPressed: () => print('request'),
      icon: const Icon(Icons.lock_reset),
      label: const Text('Request'),
    );
