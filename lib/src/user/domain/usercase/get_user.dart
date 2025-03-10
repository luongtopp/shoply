import '../../../../core/common/entities/user.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/user_repo.dart';

class GetUser extends UsecaseWithParams<User, String> {
  const GetUser(this._repo);
  final UserRepo _repo;
  @override
  ResultFuture<User> call(String params) => _repo.getUser(params);
}
