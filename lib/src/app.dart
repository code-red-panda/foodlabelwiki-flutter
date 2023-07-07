import '/src/libs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyAppProvider extends StatelessWidget {
  final AuthRepo _authRepo;

  const MyAppProvider({required AuthRepo authRepo, super.key})
      : _authRepo = authRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepo),
        child: MyApp(),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late GoRouter _router;

  final ThemeDataBuilder _theme = ThemeDataBuilder();

  @override
  Widget build(BuildContext context) {
    print('MyApp creating router');
    _router = createRouter(BlocProvider.of<AuthBloc>(context));
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user.isNotEmpty) {
          _router.go('/store');
        }
        _router.go('/login');
      },
      child: MaterialApp.router(
        title: 'Food Label Wiki',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('en', 'US'),
        supportedLocales: AppLocalizations.supportedLocales,
        theme: _theme.light(),
        darkTheme: _theme.dark(),
        themeMode: ThemeMode.light,
        routerConfig: _router,
      ),
    );
  }
}
