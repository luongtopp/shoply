import 'package:equatable/equatable.dart';

import '../../../../core/common/entities/user.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/user_repo.dart';

class UpdateUser extends UsecaseWithParams<User, UpdateUserParams> {
  const UpdateUser(this._repo);
  final UserRepo _repo;
  @override
  ResultFuture<User> call(UpdateUserParams params) => _repo.updateUser(
        userId: params.userId,
        updateData: params.updateData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({required this.userId, required this.updateData});
  final String userId;
  final DataMap updateData;
  @override
  List<Object?> get props => throw UnimplementedError();
}
