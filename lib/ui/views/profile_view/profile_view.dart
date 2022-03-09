import 'package:acad_help/core/_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'package:acad_help/ui/views/profile_view/profile_viewmodel.dart';

import '../../constants/_constants.dart';
import '../../shared/_shared.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewmodel>.nonReactive(
      viewModelBuilder: () => ProfileViewmodel(),
      onModelReady: (model) {
        _firstController.text = model.user.name.split(" ").first;
        _lastController.text = model.user.name.split(" ").last;
        _emailController.text = model.user.email;
        _dobController.text = model.user.dob;
      },
      builder: (__, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Profile",
              style: kAppbarStyle,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
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
                    enabled: false,
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
                        _dobController.text = DateFormat.yMMMEd().format(date);
                      }
                    },
                  ),
                  const YMargin(10),
                  const Spacer(),
                  Center(
                    child: AppButton(
                      isBusy: model.isBusy,
                      label: "UPDATE PROFILE",
                      onTap: () {
                        if (!_formKey.currentState!.validate()) return;
                        FocusScope.of(context).unfocus();
                        model.updateUserDetails(
                          _firstController.text + " " + _lastController.text,
                          _dobController.text,
                        );
                      },
                    ),
                  ),
                  const YMargin(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
