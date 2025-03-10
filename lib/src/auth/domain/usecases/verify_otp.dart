import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repsitory.dart';

class VerifyOtp extends UsecaseWithParams<void, VerifyOtpParams> {
  const VerifyOtp(this._repo);

  final AuthRepsitory _repo;
  @override
  ResultFuture call(VerifyOtpParams params) =>
      _repo.verifyOTP(email: params.email, otp: params.otp);
}

class VerifyOtpParams extends Equatable {
  const VerifyOtpParams({required this.email, required this.otp});

  final String email;
  final String otp;

  const VerifyOtpParams.empty()
      : email = 'Test String',
        otp = 'Test String';

  @override
  List<Object?> get props => [email, otp];
}
