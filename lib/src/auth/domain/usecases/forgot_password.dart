import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repsitory.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepsitory _repo;
  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
