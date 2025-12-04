// import 'package:backend_flutter/models/student.dart';
import 'package:backend_flutter/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_state.dart';
part 'create_user_cubit.freezed.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final AuthRepository _authRepository;

  CreateUserCubit(this._authRepository) : super(const CreateUserState.initial());

  Future<void> createUser({
    required String nama,
    required String username,
    required String password,
  }) async {
    emit(const CreateUserState.loading());

    try {
      final result = await _authRepository.createUser(
        nama: nama,
        username: username,
        password: password,
      );

      final dataUser = result['dataUser'];
      emit(CreateUserState.success(dataUser: dataUser));
    } catch (e) {
      emit(CreateUserState.error(e.toString()));
    }
  }
}
