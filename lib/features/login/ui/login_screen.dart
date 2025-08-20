import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_doc/core/helpers/spacing.dart';
import 'package:task_doc/core/theming/styles.dart';
import 'package:task_doc/core/widgets/app_text_button.dart';
import 'package:task_doc/core/widgets/app_text_form_field.dart';
import 'package:task_doc/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:task_doc/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: "Email",
                        // controller: TextEditingController(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        hintText: "Password",
                        isObscureText: _isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscureText = !_isObscureText;
                            });
                          },
                          child: Icon(
                            _isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        // controller: TextEditingController(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Handle login logic
                          }
                        },
                      ),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
