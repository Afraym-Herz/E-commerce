import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/custom_exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/firebase_auth_services.dart';
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
    User? user ;
    try {
       user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      UserEntity userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if(user != null){
        await firebaseAuthServices.deleteUser();
      }
      log('exist exception with createUserWithEmailAndPassword ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
     if(user != null){
        await firebaseAuthServices.deleteUser();
      }
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthServices.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      log('exist exception with signInWithEmailAndPassword ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    
    User? user ;
    try {
       user = await firebaseAuthServices.signInWithGoogle();
       UserEntity userEntity = UserModel.fromFirebase(user) ;
      await addData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      log('exist exception with signInWithGoogle ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('exist general exception ${e.toString()}');
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
   User? user ;
    try {
       user = await firebaseAuthServices.signInWithFacebook();
        UserEntity userEntity = UserModel.fromFirebase(user) ;
      await addData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      log('exist exception with signInWithFacebook ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('exist general exception ${e.toString()}');
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }

  @override
  Future addData({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
    );
    return const Right(null);
  }
}
