// import 'dart:developer';

// import 'package:dartz/dartz.dart';

// class AuthRepoImpl implements AuthRepo {
//   final FirebaseAuthService firebaseAuthService;
//   // final DatabaseService databaseService;

//   AuthRepoImpl({
//     required this.firebaseAuthService,
//     // required this.databaseService,
//   });

//   @override
//   Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
//     String email,
//     String password,
//     String name,
//   ) async {
//     User? user;
//     try {
//       user = await firebaseAuthService.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       var userEntity = UserEntity(id: user.uid, name: name, email: email);
//       log('userEntity: $userEntity');
//       // await addUserData(user: userEntity);
//       return Right(userEntity);
//     } on CustomException catch (e) {
//       if (user != null) {
//         await firebaseAuthService.deleteUser();
//       }
//       return Left(ServerFailure(e.message));
//     } catch (e) {
//       if (user != null) {
//         await firebaseAuthService.deleteUser();
//       }
//       return Left(ServerFailure('حدث خطأ غير متوقع. حاول مرة أخرى.'));
//     }
//   }

//   @override
//   Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       var user = await firebaseAuthService.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return Right(UserModel.fromFirebaseUser(user));
//     } on CustomException catch (e) {
//       return Left(ServerFailure(e.message));
//     } catch (e) {
//       return Left(ServerFailure('حدث خطأ غير متوقع. حاول مرة أخرى.'));
//     }
//   }

//   @override
//   Future<Either<Failure, UserEntity>> signInWithGoogle() async {
//     try {
//       var user = await firebaseAuthService.signInWithGoogle();
//       return Right(UserModel.fromFirebaseUser(user));
//     } on CustomException catch (e) {
//       return Left(ServerFailure(e.message));
//     } catch (e) {
//       return Left(ServerFailure('حدث خطأ غير متوقع. حاول مرة أخرى.'));
//     }
//   }

//   @override
//   Future<Either<Failure, UserEntity>> signInWithFacebook() async {
//     try {
//       var user = await firebaseAuthService.signInWithFacebook();
//       return Right(UserModel.fromFirebaseUser(user));
//     } on CustomException catch (e) {
//       return Left(ServerFailure(e.message));
//     } catch (e) {
//       return Left(ServerFailure('حدث خطأ غير متوقع. حاول مرة أخرى.'));
//     }
//   }

//   // @override
//   // Future<void> addUserData({required UserEntity user}) async {
//   //   await databaseService.addData(
//   //     path: BackendEndpoint.users,
//   //     data: user.toMap(),
//   //   );
//   // }
// }
