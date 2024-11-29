import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/components/login_form.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/components/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          LoginHeader(),
          LoginForm(),
        ],
      ),
    ));
  }
}
