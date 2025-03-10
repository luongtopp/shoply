import '../../../../core/common/entities/user.dart';
import '../../../../core/utils/typedefs.dart';

abstract class AuthRepsitory {
  const AuthRepsitory();

  ResultFuture<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  ResultFuture<User> login({
    required String email,
    required String password,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> verifyOTP({required String email, required String otp});

  ResultFuture<void> resetPassword(
      {required String email, required String newPassword});

  ResultFuture<bool> verifyToken();
}
