import 'package:flutter/cupertino.dart';

class ConfirmEmailState {
  final bool isConfirmEmail;
  final TextEditingController confirmationCodeController;

  ConfirmEmailState({
    required this.isConfirmEmail,
    required this.confirmationCodeController,
  });

  factory ConfirmEmailState.initial() => ConfirmEmailState(
        isConfirmEmail: false,
        confirmationCodeController: TextEditingController(),
      );

  ConfirmEmailState copyWith({
    bool? isConfirmEmail,
    TextEditingController? confirmationCodeController,
  }) {
    return ConfirmEmailState(
        isConfirmEmail: isConfirmEmail ?? this.isConfirmEmail,
        confirmationCodeController: confirmationCodeController ?? this.confirmationCodeController,
        );
  }
}
