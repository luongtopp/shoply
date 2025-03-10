import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repsitory.dart';

class Register extends UsecaseWithParams<void, RegisterParams> {
  const Register(this._repo);
  final AuthRepsitory _repo;
  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
        name: params.name,
        email: params.email,
        password: params.password,
        phone: params.phone,
      );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });
  final String name;
  final String password;
  final String email;
  final String phone;

  const RegisterParams.empty()
      : name = 'Test String',
        password = 'Test String',
        email = 'Test String',
        phone = 'Test String';

  @override
  List<Object?> get props => [
        name,
        password,
        email,
        phone,
      ];
}
