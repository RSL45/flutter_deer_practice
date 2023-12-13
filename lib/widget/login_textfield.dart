import 'package:flutter/material.dart';

import '../util/AppColors.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.hintText = '',
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String hintText;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _isShowDelete = false;
  bool _isShowPwd = false;

  @override
  void initState() {
    _isShowDelete = widget.controller.text.isNotEmpty;
    //add delete btn listener
    widget.controller.addListener(isTextFieldEmpty);
    super.initState();
  }

  void isTextFieldEmpty() {
    final bool isNotEmpty = widget.controller.text.isNotEmpty;
    if (isNotEmpty != _isShowDelete) {
      setState(() {
        _isShowDelete = isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    //remove controller listener
    widget.controller.removeListener(isTextFieldEmpty);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget textField = TextField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText:
          widget.inputType == TextInputType.visiblePassword && !_isShowPwd,
      textInputAction: widget.inputAction,
      decoration: InputDecoration(
        hintStyle:
            const TextStyle(fontSize: 14.0, color: AppColors.color_999999),
        hintText: widget.hintText,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.color_EEEEEE)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.color_EEEEEE)),
      ),
    );

    Widget clearBtn;
    if (_isShowDelete) {
      clearBtn = Semantics(
        label: '清空',
        hint: '清空输入框',
        child: GestureDetector(
          onTap: clearInput,
          child: Image.asset('assets/images/ic_delete.png',
              width: 18.0, height: 40.0),
        ),
      );
    } else {
      clearBtn = const SizedBox.shrink();
    }

    late Widget pwdVisibleBtn;
    if (widget.inputType == TextInputType.visiblePassword) {
      late String imagePath;
      if (_isShowPwd) {
        imagePath = 'assets/images/ic_display.png';
      } else {
        imagePath = 'assets/images/ic_hide.png';
      }
      pwdVisibleBtn = Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Semantics(
          label: '隐藏显示',
          hint: '隐藏显示密码输入框',
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isShowPwd = !_isShowPwd;
              });
            },
            child: Image.asset(imagePath, width: 18.0, height: 40.0),
          ),
        ),
      );
    } else {
      pwdVisibleBtn = const SizedBox.shrink();
    }

    return Stack(
      children: [
        textField,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            clearBtn,
            if (widget.inputType == TextInputType.visiblePassword)
              pwdVisibleBtn,
          ],
        )
      ],
    );
  }

  void clearInput() {
    widget.controller.text = '';
  }
}
