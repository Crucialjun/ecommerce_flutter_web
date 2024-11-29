import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back)),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text("Forget Password",
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text(
          "Please enter your email address. You will receive a link to create a new password via email.",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems * 2,
        ),
        FormBuilder(
            child: FormBuilderTextField(
          name: "email",
          decoration: const InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        )),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(ResetPasswordScreen.routeName,
                arguments: "someemail@email.com"),
            child: const Text('Submit'),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        )
      ],
    );
  }
}
