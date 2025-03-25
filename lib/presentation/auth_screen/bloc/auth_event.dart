import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class OnChangeTextEvent extends AuthEvent {
  final TextEditingController tecController;

  const OnChangeTextEvent({required this.tecController});
}

class AuthPhoneNoSubmit extends AuthEvent {}

class OnChangedOtpEvent extends AuthEvent {
  final TextEditingController tecController;

  const OnChangedOtpEvent({required this.tecController});
}

class OnClickEditPhNumberEvent extends AuthEvent {}
