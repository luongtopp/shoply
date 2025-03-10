import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/app/providers/user_provider.dart';
import '../../../../../core/common/entities/user.dart';
import '../../../domain/usecases/forgot_password.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/register.dart';
import '../../../domain/usecases/reset_password.dart';
import '../../../domain/usecases/verify_otp.dart';
import '../../../domain/usecases/verify_token.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required ForgotPassword forgotPassword,
    required Login login,
    required Register register,
    required ResetPassword resetPassword,
    required VerifyOtp verifyOtp,
    required VerifyToken verifyToken,
    required UserProvider userProvider,
  })  : _forgotPassword = forgotPassword,
        _login = login,
        _register = register,
        _resetPassword = resetPassword,
        _verifyOtp = verifyOtp,
        _verifyToken = verifyToken,
        _userProvider = userProvider,
        super(const AuthInitial());

  final ForgotPassword _forgotPassword;
  final Login _login;
  final Register _register;
  final ResetPassword _resetPassword;
  final VerifyOtp _verifyOtp;
  final VerifyToken _verifyToken;
  final UserProvider _userProvider;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _login(LoginParams(email: email, password: password));
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (user) {
        _userProvider.setUser(user);
        emit(LoggedIn(user));
      },
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(const AuthLoading());
    final result = await _register(RegisterParams(
        name: name, password: password, email: email, phone: phone));
    result.fold((failure) => emit(AuthError(failure.errorMessage)), (_) {
      emit(const Registered());
    });
  }

  Future<void> forgotPassword({required String email}) async {
    emit(const AuthLoading());
    final result = await _forgotPassword(email);
    result.fold((failure) => emit(AuthError(failure.errorMessage)), (_) {
      emit(const OTPSent());
    });
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(const AuthLoading());

    final result = await _resetPassword(
      ResetPasswordParams(email: email, newPassword: newPassword),
    );
    result.fold((failure) => emit(AuthError(failure.errorMessage)), (_) {
      emit(const PasswordReset());
    });
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(const AuthLoading());
    final result = await _verifyOtp(
      VerifyOtpParams(email: email, otp: otp),
    );
    result.fold((failure) => emit(AuthError(failure.errorMessage)), (_) {
      emit(const OTPVerified());
    });
  }

  Future<void> verifyToken() async {
    emit(const AuthLoading());
    final result = await _verifyToken();
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (isValid) {
        emit(TokenVerified(isValid));
        if (!isValid) {
          _userProvider.setUser(null);
        }
      },
    );
  }
}
