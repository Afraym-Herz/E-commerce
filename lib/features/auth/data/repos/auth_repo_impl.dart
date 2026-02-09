import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/errors/custom_exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/firebase_auth_services.dart';
import 'package:e_commerce/core/services/shared_preferences_singelton.dart';
import 'package:e_commerce/core/utils/backend_endpoints.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.databaseServices,
    required this.firebaseAuthServices,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log('exist exception with createUserWithEmailAndPassword ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return Left(
        ServerFailure(" ${e.toString()} للأسف هناك خطأ غير متوقع !!"),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthServices.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(userId: user.uid);
      return Right(UserModel.fromJson(userEntity));
    } on CustomException catch (e) {
      log('exist exception with signInWithEmailAndPassword ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('exist general exception ${e.toString()}');
      return Left(
        ServerFailure(" ${e.toString()} للأسف هناك خطأ غير متوقع !!"),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseServices.checkDataExists(
        documentId: user.uid,
        path: BackendEndpoints.addUserData,
      );
      if (isUserExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log('exist exception with signInWithGoogle ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log('exist general exception ${e.toString()}');
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log('exist exception with signInWithFacebook ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log('exist general exception ${e.toString()}');
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoints.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
    return null;
  }

  @override
  Future<Map<String, dynamic>> getUserData({required String userId}) async {
    return await databaseServices.getData(
      path: BackendEndpoints.addUserData,
      docId: userId,
    );
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
