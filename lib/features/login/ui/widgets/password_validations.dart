import 'package:flutter/material.dart';
import 'package:task_doc/core/helpers/spacing.dart';
import 'package:task_doc/core/theming/colors.dart';
import 'package:task_doc/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At least 1 special character', hasSpecialCharacter),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2, backgroundColor: ColorsManager.gray),
        horizontalSpace(5),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
            decorationColor: Colors.green,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
