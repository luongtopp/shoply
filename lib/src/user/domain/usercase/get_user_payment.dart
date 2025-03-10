import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/user_repo.dart';

class GetUserPayment extends UsecaseWithParams<String, String> {
  const GetUserPayment(this._repo);
  final UserRepo _repo;
  @override
  ResultFuture<String> call(String params) =>
      _repo.getUserPaymentProfile(params);
}
