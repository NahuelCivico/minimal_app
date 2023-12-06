import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_app/core/helpers/minimal_constants.dart';
import 'package:minimal_app/core/widgets/shared/minimal_button.dart';
import 'package:minimal_app/core/widgets/shared/minimal_input.dart';
import 'package:minimal_app/core/widgets/shared/minimal_title.dart';
import '../../../core/widgets/shared/minimal_logo_image.dart';
import '../../../core/widgets/shared/minimal_progress_indicator.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/login_bubbles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Stack(
        children: [
          const LoginBubbles(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthStateUnauthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is AuthStateAuthenticated) {
                  Navigator.pushReplacementNamed(
                    context,
                    MinimalConstants.customersRoute,
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MinimalLogoImage(),
                  const SizedBox(height: 50),
                  MinimalTitle(
                    text: MinimalConstants.logIn,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!,
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MinimalInput(
                          textEditingController: emailController,
                          hintText: MinimalConstants.email,
                          errorEmptyText: MinimalConstants.emailError,
                        ),
                        const SizedBox(height: 23),
                        MinimalInput(
                          textEditingController: passwordController,
                          hintText: MinimalConstants.password,
                          errorEmptyText: MinimalConstants.passwordError,
                          isInputPassword: true,
                        ),
                        const SizedBox(height: 52),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            switch (state) {
                              case AuthStateLoading():
                                return const MinimalProgressIndicator();
                              default:
                                return MinimalButton(
                                  text: MinimalConstants.logIn,
                                  onPressed: () {
                                    if (!formKey.currentState!.validate()) {
                                      return null;
                                    }
                                    context
                                        .read<AuthCubit>()
                                        .loginWithEmailAndPassword(
                                            emailController.text,
                                            passwordController.text);
                                  },
                                );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
