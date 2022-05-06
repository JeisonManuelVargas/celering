import 'package:flutter/cupertino.dart';

class ConfirmEmailState {
  final bool isLoading;
  final TextEditingController confirmationCodeController;

  ConfirmEmailState({
    required this.isLoading,
    required this.confirmationCodeController,
  });

  factory ConfirmEmailState.initial() => ConfirmEmailState(
        isLoading: false,
        confirmationCodeController: TextEditingController(),
      );

  ConfirmEmailState copyWith({
    bool? isLoading,
    TextEditingController? confirmationCodeController,
  }) {
    return ConfirmEmailState(
        isLoading: isLoading ?? this.isLoading,
        confirmationCodeController: confirmationCodeController ?? this.confirmationCodeController,
        );
  }
}
