import 'package:acad_help/ui/views/signup_view/signup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
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
    final _dobController = useTextEditingController();
    final _passwordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ViewModelBuilder<SignupViewmodel>.reactive(
              builder: (__, model, child) => Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const YMargin(100),
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
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const XMargin(10),
                        Expanded(
                          child: AppTextField(
                            label: "Last Name",
                            controller: _lastController,
                            validator: context.validateNotEmpty,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
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
                      label: "Date of Birth",
                      controller: _dobController,
                      validator: context.validateNotEmpty,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      onTap: () async {
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1800),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          _dobController.text =
                              DateFormat.yMMMEd().format(date);
                        }
                      },
                    ),
                    const YMargin(10),
                    AppTextField(
                      label: "Password",
                      controller: _passwordController,
                      validator: context.validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !model.showPassword,
                      maxLines: 1,
                      suffix: GestureDetector(
                        onTap: model.toggleObscurity,
                        child: Icon(
                          model.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const YMargin(10),
                    AppTextField(
                      label: "Confirm Password",
                      validator: (val) => context.validateConfirmPassword(
                          val, _passwordController.text),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !model.showPassword,
                      maxLines: 1,
                      suffix: GestureDetector(
                        onTap: model.toggleObscurity,
                        child: Icon(
                          model.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const YMargin(100),
                    Center(
                      child: AppButton(
                        isBusy: model.isBusy,
                        label: "SIGN UP",
                        onTap: () {
                          if (!_formKey.currentState!.validate()) return;
                          model.registerUser(
                            _firstController.text + " " + _lastController.text,
                            _dobController.text,
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
      ),
    );
  }
}
