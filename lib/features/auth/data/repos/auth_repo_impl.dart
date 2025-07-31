import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/custom_exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/firebase_auth_services.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthServices
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      log('exist exception with createUserWithEmailAndPassword ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }
  }
  
  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) async {
  
    try {
      User user = await firebaseAuthServices.signInWithEmailAndPassword(email: email, password: password);
      return Right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      log('exist exception with signInWithEmailAndPassword ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure("للأسف هناك خطأ غير متوقع !!"));
    }

  }
}
