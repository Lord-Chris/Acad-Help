import 'package:acad_help/ui/views/signup_view/signup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import '../../constants/_constants.dart';
import '../../../core/_core.dart';
import '../../shared/_shared.dart';

final _formKey = GlobalKey<FormState>();

class SignupView extends HookWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstController = useTextEditingController();
    final _lastController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ViewModelBuilder<SignupViewmodel>.reactive(
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
                    "Your number one Film Store🎬🎥",
                    style: kBodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  const YMargin(70),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          label: "First Name",
                          controller: _firstController,
                          validator: context.validateNotEmpty,
                          textCapitalization: TextCapitalization.words,
                        ),
                      ),
                      const XMargin(10),
                      Expanded(
                        child: AppTextField(
                          label: "Last Name",
                          controller: _lastController,
                          validator: context.validateNotEmpty,
                          textCapitalization: TextCapitalization.words,
                        ),
                      ),
                    ],
                  ),
                  const YMargin(10),
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
                  const YMargin(10),
                  AppTextField(
                    label: "Confirm Password",
                    validator: (val) => context.validateConfirmPassword(
                        val, _passwordController.text),
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
                      label: "SIGN UP",
                      onTap: () {
                        if (!_formKey.currentState!.validate()) return;
                        model.registerUser(
                          _firstController.text + " " + _lastController.text,
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
                          text: "Already have an account? ",
                          style: kSubBodyStyle,
                        ),
                        TextSpan(
                          text: "Log In",
                          style: kSubBodyStyle.copyWith(
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => model.navigateToLogin(),
                        ),
                      ],
                    ),
                  ),
                  const YMargin(32),
                ],
              ),
            ),
            viewModelBuilder: () => SignupViewmodel(),
          ),
        ),
      ),
    );
  }
}
