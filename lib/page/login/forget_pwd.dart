import 'package:flutter/material.dart';
import 'package:flutter_deer_practice/util/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/login_textfield.dart';

class ForgetPwdPage extends StatefulWidget {
  const ForgetPwdPage({super.key});

  @override
  State<ForgetPwdPage> createState() => _ForgetPwdPageState();
}

class _ForgetPwdPageState extends State<ForgetPwdPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forgetPwd,
          style: const TextStyle(fontSize: 18.0, color: AppColors.color_333333),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.resetLoginPwd,
                style: const TextStyle(
                    fontSize: 26.0, color: AppColors.color_333333),
              ),
            ),
            SizedBox(height: 32.0),
            LoginTextField(
              controller: _phoneController,
              inputType: TextInputType.phone,
              inputAction: TextInputAction.next,
              hintText: AppLocalizations.of(context)!.enterPhoneHint,
            ),
            SizedBox(height: 9.0),
            LoginTextField(
              controller: _smsCodeController,
              inputType: TextInputType.number,
              hintText: AppLocalizations.of(context)!.enterSmsCodeHint,
            ),
            SizedBox(height: 9.0),
            LoginTextField(
              controller: _newPwdController,
              inputType: TextInputType.number,
              hintText: AppLocalizations.of(context)!.newPwdHint,
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
                AppLocalizations.of(context)!.confirm,
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
