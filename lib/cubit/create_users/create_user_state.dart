part of 'create_user_cubit.dart';

@freezed
class CreateUserState with _$CreateUserState {
  const factory CreateUserState.initial() = _Initial;
  const factory CreateUserState.loading() = _Loading;
  const factory CreateUserState.success({required dynamic dataUser}) = _Success;
  const factory CreateUserState.error(String message) = _Error;
}
