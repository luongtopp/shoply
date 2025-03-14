part of 'auth_user_cubit.dart';

sealed class AuthUserState extends Equatable {
  const AuthUserState();

  @override
  List<Object> get props => [];
}

final class AuthUserInitial extends AuthUserState {
  const AuthUserInitial();
}

final class GettingUserData extends AuthUserState {
  const GettingUserData();
}

final class UpdatingUserData extends AuthUserState {
  const UpdatingUserData();
}

final class GettingUserPaymentProfile extends AuthUserState {
  const GettingUserPaymentProfile();
}

final class FetchedUser extends AuthUserState {
  const FetchedUser(this.user);
  final User user;

  @override
  List<Object> get props => [user];
}

final class FetchdUserPaymentProfile extends AuthUserState {
  const FetchdUserPaymentProfile(this.paymentProfileUrl);
  final String paymentProfileUrl;

  @override
  List<Object> get props => [paymentProfileUrl];
}

final class AuthUserError extends AuthUserState {
  const AuthUserError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
