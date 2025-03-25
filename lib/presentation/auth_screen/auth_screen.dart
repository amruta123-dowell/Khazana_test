import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khazana_test/core/utils/image_constant.dart';
import 'package:khazana_test/presentation/auth_screen/bloc/auth_bloc.dart';
import 'package:khazana_test/presentation/auth_screen/bloc/auth_event.dart';
import 'package:khazana_test/presentation/auth_screen/bloc/auth_state.dart';
import 'package:khazana_test/widgets/custom_textfield.dart';
import 'package:khazana_test/widgets/otp_text_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc()..add(AuthInitialEvent()),
      child: AuthScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 90),
                    Text(
                      "Welcome Back, \nWe Missed You! \u{1F389}",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Gilroy",
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: "Glad to have you back at ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "Dhan Saarthi",
                            style: TextStyle(
                              foreground: Paint()..shader = linearGradient,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 82),
                    Text(
                      state.enablePinTextfield == true
                          ? "Enter OTP"
                          : "Enter your phone number",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Gilroy",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (state.enablePinTextfield == true) ...[
                      OtpTextField(
                        tecController: state.otpController,
                        onChanged: (val) {
                          context.read<AuthBloc>().add(
                            OnChangedOtpEvent(
                              tecController:
                                  state.otpController ??
                                  TextEditingController(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 34),
                      RichText(
                        text: TextSpan(
                          text: "Didn't Receive OPT ? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: " Resend",
                              style: TextStyle(
                                color: Color(0XFF0070DF),
                                fontSize: 12,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "OTP has been sent on ${maskPhoneNumber(state.phNoController?.text ?? "")}  ",
                            style: TextStyle(
                              color: Color(0XFF888888),
                              fontSize: 12,
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              ImageConstant.editIcon,
                              height: 12,
                            ),
                          ),
                        ],
                      ),
                    ] else
                      CustomTextField(
                        textEditingController:
                            state.phNoController ?? TextEditingController(),
                        onChanged: (value) {
                          context.read<AuthBloc>().add(
                            OnChangeTextEvent(
                              tecController:
                                  state.phNoController ??
                                  TextEditingController(),
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 56),
                    Align(
                      child: GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(AuthPhoneNoSubmit());
                        },
                        child: Container(
                          height: 39,
                          width: 270,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                state.enableSubmit == true
                                    ? Color(0XFF0070DF)
                                    : Color(0XFF262626),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.75),
                          ),
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned.fill(
                  bottom: 30,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By signing in, you agree to our ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Gilroy",
                        ),
                        children: [
                          TextSpan(
                            text: "T&C ",
                            style: TextStyle(
                              color: Color(0XFF0070DF),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Gilroy",
                            ),
                          ),
                          TextSpan(
                            text: "and ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Gilroy",
                            ),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Color(0XFF0070DF),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Shader linearGradient = LinearGradient(
  colors: [Color(0XFF0883FD), Color(0XFF8CD1FB)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

String maskPhoneNumber(String phoneNumber) {
  if (phoneNumber.length < 10) return phoneNumber; // Ensure it's a valid length
  return phoneNumber.replaceRange(3, 8, '*****');
}
