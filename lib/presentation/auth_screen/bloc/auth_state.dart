import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AuthState extends Equatable {
  final TextEditingController? phNoController;
  final bool? enableSubmit;
  final bool? enablePinTextfield;
  final TextEditingController? otpController;
  const AuthState({
    this.phNoController,
    this.enableSubmit,
    this.enablePinTextfield,
    this.otpController,
  });

  @override
  List<Object?> get props => [
    phNoController,
    enableSubmit,
    enablePinTextfield,
    otpController,
  ];
  AuthState copyWith({
    TextEditingController? tecController,
    bool? enableSubmit,
    bool? enablePinTextfield,
    TextEditingController? otpController,
  }) {
    return AuthState(
      phNoController: tecController ?? this.phNoController,
      enableSubmit: enableSubmit ?? this.enableSubmit,
      enablePinTextfield: enablePinTextfield ?? this.enablePinTextfield,
      otpController: otpController ?? this.otpController,
    );
  }
}
