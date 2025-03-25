import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:khazana_test/presentation/auth_screen/bloc/auth_event.dart';
import 'package:khazana_test/presentation/auth_screen/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OnChangeTextEvent>(_enableSubmit);
    on<AuthInitialEvent>(_initialize);
    on<AuthPhoneNoSubmit>(_submitPhNumber);
    on<OnChangedOtpEvent>(_enableOtpSubmit);
    on<OnClickEditPhNumberEvent>(_onlickEditPhnumber);
  }

  FutureOr<void> _enableSubmit(
    OnChangeTextEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(tecController: event.tecController));
    if (event.tecController.text.isNotEmpty &&
        event.tecController.text.length == 10) {
      emit(state.copyWith(enableSubmit: true));
    } else {
      emit(state.copyWith(enableSubmit: false));
    }
  }

  FutureOr<void> _initialize(AuthInitialEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(tecController: TextEditingController()));
  }

  FutureOr<void> _submitPhNumber(
    AuthPhoneNoSubmit event,
    Emitter<AuthState> emit,
  ) {
    if (state.enableSubmit == true) {
      emit(state.copyWith(enablePinTextfield: true, enableSubmit: false));
      state.enablePinTextfield;
    } else {
      emit(state.copyWith(enablePinTextfield: false));
    }
  }

  FutureOr<void> _enableOtpSubmit(
    OnChangedOtpEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(otpController: event.tecController));
    if (state.otpController?.text.isNotEmpty == true &&
        state.otpController?.text.length == 6) {
      emit(state.copyWith(enableSubmit: true));
    }
  }

  FutureOr<void> _onlickEditPhnumber(
    OnClickEditPhNumberEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(enablePinTextfield: false));
  }
}
