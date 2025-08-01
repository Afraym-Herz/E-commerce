import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures,UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures,UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures,UserEntity>> signInWithGoogle();

  Future<Either<Failures,UserEntity>> signInWithFacebook();

}