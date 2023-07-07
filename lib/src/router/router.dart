import '/src/libs.dart';

GoRouter createRouter(AuthBloc bloc) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: bloc,
      errorBuilder: (context, state) =>
          bloc.state.user.isEmpty ? const LoginProvider() : const StoreView(),
      routes: [
        RouteBuilder(
          label: '_initialize',
          path: '/',
          requireAuth: false,
          view: bloc.state.user.isEmpty ? const LoginProvider() : const StoreView(),
        ),
        const RouteBuilder(
          label: 'Login',
          path: '/login',
          requireAuth: false,
          view: LoginProvider(),
        ),
        const RouteBuilder(
          label: 'Store',
          path: '/store',
          requireAuth: true,
          view: StoreView(),
        ),
      ].map((r) => r.toRoute(bloc)).toList(),
    );

class RouteBuilder {
  const RouteBuilder({
    required this.label,
    required this.path,
    required this.requireAuth,
    required this.view,
    this.routes = const [],
  });

  final String label;
  final String path;
  final bool requireAuth;
  final Widget view;
  final List<GoRoute> routes;

  GoRoute toRoute(AuthBloc bloc) => GoRoute(
        name: label,
        path: path,
        redirect: (context, state) {
          print('redirecting');
          // User is not logged in but on a page that requires authentication. Redirect to login.
          if (requireAuth && bloc.state.user.isEmpty) {
            return '/login';

            // User is logged in but on a page that does not require authentication. Redirect to home.
          } else if (!requireAuth && bloc.state.user.isNotEmpty) {
            return '/store';
          }
          return null;
        },
        //pageBuilder: (context, state) => MaterialPage<void>(child: RootView(view: view)),
        pageBuilder: (context, state) => MaterialPage<void>(child: view),
        routes: routes,
      );
}
