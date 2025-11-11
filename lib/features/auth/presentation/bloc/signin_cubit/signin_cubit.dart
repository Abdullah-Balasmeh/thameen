// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
// import 'package:fruit_hub/core/utils/constant.dart';
// import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
// import 'package:fruit_hub/features/auth/domain/repositories/auth_repo.dart';

// part 'signin_state.dart';

// class SigninCubit extends Cubit<SigninState> {
//   SigninCubit(this.authRepo) : super(SigninInitial());

//   final AuthRepo authRepo;
//   Future<void> signInWithEmailAndPassword(
//     String email,
//     String password,
//     bool isRememberMe,
//   ) async {
//     emit(SigninLoading());
//     final result = await authRepo.signInWithEmailAndPassword(
//       email,
//       password,
//     );
//     result.fold(
//       (failure) => emit(SigninFailure(errMessage: failure.errMessage)),
//       (user) {
//         if (isRememberMe) {
//           SharedPreferencesSingleton.setBool(kisRememberMe, true);
//           SharedPreferencesSingleton.setString('email', email);
//           SharedPreferencesSingleton.setString('password', password);
//         }
//         emit(SigninSuccess(user: user));
//       },
//     );
//   }

//   Future<void> signInWithGoogle() async {
//     emit(SigninLoading());
//     final result = await authRepo.signInWithGoogle();
//     result.fold(
//       (failure) => emit(SigninFailure(errMessage: failure.errMessage)),
//       (user) => emit(SigninSuccess(user: user)),
//     );
//   }

//   Future<void> signInWithFacebook() async {
//     emit(SigninLoading());
//     final result = await authRepo.signInWithFacebook();
//     result.fold(
//       (failure) => emit(SigninFailure(errMessage: failure.errMessage)),
//       (user) => emit(SigninSuccess(user: user)),
//     );
//   }
// }
