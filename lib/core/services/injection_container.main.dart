part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _cacheInit();
  await _authInit();
  await _userInit();
}

Future<void> _cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton(() => prefs);
}

Future<void> _userInit() async {
  sl
    ..registerLazySingleton<UserRemoteDataSrc>(
      () => UserRemoteDataSrcImpl(sl()),
    )
    ..registerLazySingleton<UserRepo>(() => UserRepoImpl(sl()))
    ..registerLazySingleton(
      () => AuthUserCubit(
        getUser: sl(),
        getUserPayment: sl(),
        updateUser: sl(),
        userPovider: sl(),
      ),
    )
    ..registerLazySingleton(() => GetUser(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => GetUserPayment(sl()));
}

Future<void> _authInit() async {
  sl
    ..registerLazySingleton(() => http.Client.new)
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImplementation(sl()))
    ..registerLazySingleton<AuthRepsitory>(
        () => AuthRepositoryImplementation(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => Register(sl()))
    ..registerLazySingleton(() => ResetPassword(sl()))
    ..registerLazySingleton(() => VerifyOtp(sl()))
    ..registerLazySingleton(() => VerifyToken(sl()))
    ..registerLazySingleton(() => UserProvider.instance)
    ..registerFactory(
      () => AuthCubit(
        forgotPassword: sl(),
        login: sl(),
        register: sl(),
        resetPassword: sl(),
        verifyOtp: sl(),
        verifyToken: sl(),
        userProvider: sl(),
      ),
    );
}
