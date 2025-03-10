part of 'router.dart';

final rootNavigatorkey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: rootNavigatorkey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        redirect: (context, state) {
          final cacheHelper = sl<CacheHelper>()
            ..getSessionToken()
            ..getUserId();

          if ((Cache.instance.sessionToken == null ||
                  Cache.instance.userId == null) &&
              !cacheHelper.isFirstTime()) {
            return LoginScreen.path;
          }
          if (state.extra == 'home') {
            return HomeView.path;
          }
          return null;
        },
        builder: (_, __) {
          final cacheHelper = sl<CacheHelper>()
            ..getSessionToken()
            ..getUserId();
          if (cacheHelper.isFirstTime()) {
            return const OnBoardingScreen();
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<AuthCubit>()),
              BlocProvider(create: (_) => sl<AuthUserCubit>()),
            ],
            child: const SplashScreen(),
          );
        }),
    GoRoute(path: LoginScreen.path, builder: (_, __) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return DashBoardScreen(state: state, child: child);
      },
      routes: [
        GoRoute(
            path: HomeView.path,
            builder: (_, __) {
              return const HomeView();
            })
      ],
    )
  ],
);
