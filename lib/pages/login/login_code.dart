import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:codefather_app/pages/login/components/code_input.dart';
import 'package:codefather_app/pages/login/controller.dart';
import 'package:get/get.dart';

class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  _LoginCodePage createState() => _LoginCodePage();
}

class _LoginCodePage extends State<LoginCodePage> {
  final logic = Get.find<LoginController>();

  ConstraintId box0 = ConstraintId('box0');
  ConstraintId box1 = ConstraintId('box1');
  ConstraintId box2 = ConstraintId('box2');
  ConstraintId box3 = ConstraintId('box3');
  ConstraintId box4 = ConstraintId('box4');
  ConstraintId box5 = ConstraintId('box5');

  bool isPhoneNumberValid = false;
  String phoneNumber = '';
  String captcha = '';
  bool isCheckboxChecked = false;

  @override
  void dispose() {
    logic.dispose();
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments as Map<String, dynamic>;
    phoneNumber = arguments['phone'];
    captcha = arguments['captcha'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: ConstraintLayout(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: CodeInputContainer(
              count: 4,
              phone: phoneNumber,
              onRestart: () async {
                var params = {"captcha": captcha, "phone": phoneNumber};
                return await logic.sendSmsCaptchaUsingPOST(params);
              },
              onResult: (code) async {
                var params = {"phone": phoneNumber, "verifyCode": code};
                await logic.login(params);
              },
            ),
          ).applyConstraint(
            id: box0,
            top: parent.top,
            left: parent.left,
            right: parent.right,
            margin: const EdgeInsets.only(left: 30.0, right: 30),
          ),
        ],
      ),
    );
  }
}
