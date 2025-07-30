import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({required String email, required String password}) async {
    throw UnimplementedError();
  }
  
}