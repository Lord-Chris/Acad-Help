import 'package:acad_help/ui/views/login_view/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import '../../constants/_constants.dart';
import '../../../core/_core.dart';
import '../../shared/_shared.dart';

final _formKey = GlobalKey<FormState>();

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ViewModelBuilder<LoginViewmodel>.reactive(
            builder: (__, model, child) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  const Text(
                    AppStrings.appName,
                    style: kHeaderStyle,
                  ),
                  const YMargin(25),
                  const Text(
                    "Welcome back to Film Store🎬🎥",
                    style: kBodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  const YMargin(70),
                  AppTextField(
                    label: "Email Address",
                    controller: _emailController,
                    validator: context.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const YMargin(10),
                  AppTextField(
                    label: "Password",
                    controller: _passwordController,
                    validator: context.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                    suffix: Icon(
                      model.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: AppButton(
                      isBusy: model.isBusy,
                      label: "LOG IN",
                      onTap: () {
                        if (!_formKey.currentState!.validate()) return;
                        model.loginUser(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                    ),
                  ),
                  const YMargin(10),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                          style: kSubBodyStyle,
                        ),
                        TextSpan(
                            text: "Sign Up",
                            style: kSubBodyStyle.copyWith(
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => model.navigateToSignup()),
                      ],
                    ),
                  ),
                  const YMargin(32),
                ],
              ),
            ),
            viewModelBuilder: () => LoginViewmodel(),
          ),
        ),
      ),
    );
  }
}
