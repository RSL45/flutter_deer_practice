import 'package:flutter/material.dart';
import 'package:flutter_deer_practice/page/login/forget_pwd.dart';
import 'package:flutter_deer_practice/page/login/sms_login.dart';
import 'package:flutter_deer_practice/util/AppColors.dart';
import 'package:flutter_deer_practice/widget/login_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget codeLoginBtn = TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const SmsLoginPage();
          }),
        );
      },
      child: Text(
        AppLocalizations.of(context)!.verifyCodeLogin,
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.color_333333,
        ),
      ),
    );

    Widget phoneTextField = LoginTextField(
      controller: _phoneController,
      inputType: TextInputType.phone,
      inputAction: TextInputAction.next,
      hintText: AppLocalizations.of(context)!.enterPhoneHint,
    );

    Widget pwdTextField = LoginTextField(
      controller: _pwdController,
      inputType: TextInputType.visiblePassword,
      hintText: AppLocalizations.of(context)!.enterPwdHint,
    );

    Widget loginBtn = TextButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all(const Size(double.infinity, 48.0)),
        backgroundColor: MaterialStateProperty.all(AppColors.color_4688FA),
      ),
      child: Text(
        AppLocalizations.of(context)!.login,
        style: const TextStyle(fontSize: 18.0, color: AppColors.color_D4E2FA),
      ),
    );

    Widget forgetPwdBtn = Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const ForgetPwdPage();
            }),
          );
        },
        child: Text(
          AppLocalizations.of(context)!.forgetPwd,
          style: const TextStyle(fontSize: 12.0, color: AppColors.color_999999),
        ),
      ),
    );

    Widget registerBtn = TextButton(
      onPressed: () {},
      child: Text(
        AppLocalizations.of(context)!.registerHint,
        style: const TextStyle(color: AppColors.color_4688FA),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Align(alignment: Alignment.centerRight, child: codeLoginBtn),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.pwdLogin,
                style: const TextStyle(
                    fontSize: 26.0, color: AppColors.color_333333),
              ),
            ),
            const SizedBox(height: 16.0),
            phoneTextField,
            const SizedBox(height: 9.0),
            pwdTextField,
            const SizedBox(height: 25.0),
            loginBtn,
            forgetPwdBtn,
            const SizedBox(height: 8.0),
            registerBtn,
          ],
        ),
      ),
    );
  }
}
