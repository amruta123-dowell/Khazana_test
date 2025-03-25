import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController? tecController;
  final Function(String) onChanged;

  const OtpTextField({super.key, this.tecController, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PinCodeTextField(
          controller: tecController,
          obscureText: false,
          appContext: context,

          length: 6,
          keyboardType: TextInputType.number,
          animationType: AnimationType.none,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline, // Use box instead of circle
            fieldHeight: 40,
            fieldWidth: 40,
            activeFillColor: Color(0XFF5D5D5D),
            selectedColor: Color(0XFF0070DF),
            inactiveColor: Color(0XFF5D5D5D),
            activeColor: Color(0XFF5D5D5D),
            borderWidth: 1,

            activeBorderWidth: 1,
            inactiveBorderWidth: 1,
            selectedBorderWidth: 1,
          ),
          textStyle: TextStyle(color: Colors.white, fontFamily: ""),
          onChanged: (value) {
            tecController?.text = value;
            onChanged(value);
          },
          cursorHeight: 24,
          onCompleted: (value) {
            // Handle the MPIN submission here
          },
        ),
      ],
    );
  }
}
