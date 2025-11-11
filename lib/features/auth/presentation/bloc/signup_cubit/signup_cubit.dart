// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
// import 'package:fruit_hub/features/auth/domain/repositories/auth_repo.dart';

// part 'signup_cubit_state.dart';

// class SignupCubit extends Cubit<SignupCubitState> {
//   SignupCubit(this.authRepo) : super(SignupCubitInitial());

//   final AuthRepo authRepo;

//   Future<void> createUserWWithEmailAndPassword(
//     String email,
//     String password,
//     String name,
//   ) async {
//     emit(SignupCubitLoading());
//     final result = await authRepo.createUserWithEmailAndPassword(
//       email,
//       password,
//       name,
//     );
//     result.fold(
//       (failure) => emit(SignupCubitFailure(errMessage: failure.errMessage)),
//       (user) => emit(SignupCubitSuccess(user: user)),
//     );
//   }
// }
