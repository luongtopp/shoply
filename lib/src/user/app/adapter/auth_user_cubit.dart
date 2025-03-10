import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/common/app/providers/user_provider.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/usercase/get_user.dart';
import '../../domain/usercase/get_user_payment.dart';
import '../../domain/usercase/update_user.dart';

part 'auth_user_state.dart';

class AuthUserCubit extends Cubit<AuthUserState> {
  AuthUserCubit({
    required GetUser getUser,
    required GetUserPayment getUserPayment,
    required UpdateUser updateUser,
    required UserProvider userPovider,
  })  : _getUser = getUser,
        _getUserPayment = getUserPayment,
        _updateUser = updateUser,
        _userProvider = userPovider,
        super(const AuthUserInitial());

  final GetUser _getUser;
  final GetUserPayment _getUserPayment;
  final UpdateUser _updateUser;
  final UserProvider _userProvider;

  Future<void> getUserById(String userId) async {
    emit(const GettingUserData());

    final result = await _getUser(userId);
    result.fold(
      (failure) => emit(AuthUserError(failure.errorMessage)),
      (user) {
        _userProvider.setUser(user);
        emit(FetchedUser(user));
      },
    );
  }

  Future<void> updateUser(
      {required String userId, required DataMap updateData}) async {
    emit(const UpdatingUserData());

    final result = await _updateUser(
      UpdateUserParams(userId: userId, updateData: updateData),
    );
    result.fold(
      (failure) => emit(AuthUserError(failure.errorMessage)),
      (user) {
        _userProvider.setUser(user);
        emit(FetchedUser(user));
      },
    );
  }

  Future<void> getUserPayment(String userId) async {
    emit(const GettingUserPaymentProfile());

    final result = await _getUserPayment(userId);
    result.fold(
      (failure) => emit(AuthUserError(failure.errorMessage)),
      (paymentProfileUrl) {
        emit(FetchdUserPaymentProfile(paymentProfileUrl));
      },
    );
  }
}
