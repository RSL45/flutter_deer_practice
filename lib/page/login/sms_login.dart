import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_practice/util/AppColors.dart';
import 'package:flutter_deer_practice/widget/login_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SmsLoginPage extends StatefulWidget {
  const SmsLoginPage({super.key});

  @override
  State<SmsLoginPage> createState() => _SmsLoginPageState();
}

class _SmsLoginPageState extends State<SmsLoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.verifyCodeLogin,
                style: const TextStyle(
                    fontSize: 26.0, color: AppColors.color_333333),
              ),
            ),
            SizedBox(height: 16.0),
            LoginTextField(
              controller: _phoneController,
              inputType: TextInputType.phone,
              inputAction: TextInputAction.next,
              hintText: AppLocalizations.of(context)!.enterPhoneHint,
            ),
            SizedBox(height: 9.0),
            LoginTextField(
              controller: _codeController,
              inputType: TextInputType.number,
              hintText: AppLocalizations.of(context)!.enterSmsCodeHint,
            ),
            SizedBox(height: 9.0),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.smsCodeRegisterHint,
                  style: const TextStyle(
                      fontSize: 14.0, color: AppColors.color_999999),
                  children: [
                    TextSpan(
                        text: AppLocalizations.of(context)!.register,
                        style: const TextStyle(
                            fontSize: 14.0, color: AppColors.color_FF4759),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.0),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 48.0)),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.color_4688FA),
              ),
              child: Text(
                AppLocalizations.of(context)!.login,
                style: const TextStyle(
                    fontSize: 18.0, color: AppColors.color_D4E2FA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
