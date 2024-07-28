import 'package:finance_bunny/components/auth_wrapper.dart';
import 'package:finance_bunny/firebase/auth_service.dart';
import 'package:finance_bunny/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.phone,
    required this.verId,
    required this.country,
  });

  final String phone;
  final String verId;
  final String country;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with AuthService {
  String _otp = "";

  void _navigateNext() {
    if (_otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter OTP")),
      );
    } else if (validateOtp(_otp)) {
      verifyOtp(otp: _otp, verId: widget.verId).then((res) {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      nextBtn: _navigateNext,
      heading: "Verify Phone",
      subHeading: "Enter OTP Sent to ${widget.country} - ${widget.phone}",
      field: PinCodeTextField(
        length: 6,
        autoFocus: true,
        pinTheme: otpStyle,
        appContext: context,
        onChanged: (text) => _otp = text,
        keyboardType: TextInputType.number,
        onCompleted: (e) => _navigateNext(),
      ),
    );
  }
}

final otpStyle = PinTheme(
  activeColor: Colors.teal,
  inactiveColor: Colors.teal,
  selectedColor: Colors.black,
  shape: PinCodeFieldShape.box,
  borderRadius: BorderRadius.circular(5),
);
