import 'package:e_commerce/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce/core/repos/product_repo/product_repo_impl.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/firebase_auth_services.dart';
import 'package:e_commerce/core/services/firestore_services.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

  final getIt = GetIt.instance;

  void setupGetIt() {
    getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<DatabaseServices>(FirestoreServices());

    getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>(), databaseServices: getIt<DatabaseServices>()),
    );

    getIt.registerSingleton<ProductRepo>(
      ProductRepoImpl( databaseServices: getIt<DatabaseServices>()),
    );
  }
