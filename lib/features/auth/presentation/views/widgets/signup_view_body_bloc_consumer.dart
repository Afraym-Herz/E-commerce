import 'package:e_commerce/core/services/firestore_services.dart';
import 'package:e_commerce/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_progress_hud.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pop();
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return  CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: SignUpViewBody(databaseServices: FirestoreServices() ,),
        );
      },
    );
  }
}
