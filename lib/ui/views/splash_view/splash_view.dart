import 'package:flutter/material.dart';

import '../../../core/_core.dart';
import '../../../services/_services.dart';
import '../../constants/_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  final _authService = locator<IAuthenticationService>();
  final _navService = locator<INavigationService>();
  final _keyValStorageService = locator<IKeyValueStorageService>();

  Future<void> checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    final _goToSignUp =
        _keyValStorageService.readBool(key: StorageKeys.goToSignup, def: true);
    if (!_goToSignUp!) {
      _navService.offNamed(Routes.signupRoute);
      _keyValStorageService.saveBool(key: StorageKeys.goToSignup, value: false);
      return;
    }

    if (_authService.currentUser == null) {
      _navService.offNamed(Routes.loginRoute);
    } else {
      _navService.offNamed(Routes.homeRoute);
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _animation =
        Tween<double>(begin: 0.0, end: 1).animate(_animationController!);
    _animationController?.forward();
    _animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkUserStatus();
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotationTransition(
        turns: _animationController!,
        child: SizeTransition(
          sizeFactor: _animationController!,
          child: const Center(
            child: Text(
              AppStrings.appName,
              style: kHeaderStyle,
            ),
          ),
        ),
      ),
    );
  }
}
