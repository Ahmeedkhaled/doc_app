import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_doc/core/helpers/app_regex.dart';
import 'package:task_doc/core/helpers/spacing.dart';
import 'package:task_doc/core/widgets/app_text_form_field.dart';
import 'package:task_doc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:task_doc/features/auth/login/ui/widgets/password_validations.dart';

class EmailAndPasswordScreen extends StatefulWidget {
  const EmailAndPasswordScreen({super.key});

  @override
  State<EmailAndPasswordScreen> createState() => _EmailAndPasswordScreenState();
}

class _EmailAndPasswordScreenState extends State<EmailAndPasswordScreen> {
  bool _isObscureText = true;
  late TextEditingController passwordController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
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
                _isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacter: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
