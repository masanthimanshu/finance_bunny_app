import 'package:country_code_picker/country_code_picker.dart';
import 'package:finance_bunny/components/auth_wrapper.dart';
import 'package:finance_bunny/firebase/auth_service.dart';
import 'package:finance_bunny/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'otp_screen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> with AuthService {
  String _phone = "";
  String _countryCode = "+91";

  void _navigateNext() {
    if (_phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter Phone Number")),
      );
    } else if (validatePhone(_phone)) {
      sendOtp(context, "$_countryCode $_phone").then((res) {
        if (res != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OtpScreen(
                verId: res,
                phone: _phone,
                country: _countryCode,
              ),
            ),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Phone Number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      nextBtn: _navigateNext,
      heading: "Welcome User",
      subHeading: "Enter your phone number to get started",
      field: Container(
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.25),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          CountryCodePicker(
            favorite: const ["IN"],
            initialSelection: "IN",
            onChanged: (code) => _countryCode = code.dialCode!,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              keyboardType: TextInputType.number,
              onChanged: (text) => _phone = text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Phone",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
