import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/forget_password_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _controller = locator<LoginController>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
          child: Column(
            children: [
              FormBuilderTextField(
                name: "email",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
                decoration: const InputDecoration(
                    labelText: "Email", prefix: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              FormBuilderTextField(
                name: "password",
                decoration: const InputDecoration(
                    labelText: "Password",
                    prefix: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off_outlined)),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text('Remember me')
                    ],
                  ),
                  TextButton(
                    onPressed: () =>
                        Get.toNamed(ForgetPasswordScreen.routeName),
                    child: const Text('Forgot Password?'),
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ));
  }
}
