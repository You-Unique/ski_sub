import 'package:flutter/material.dart';
import 'package:ski_sub/screens/sign_in_screen/sign_in_screen.dart';
import 'package:ski_sub/shared/button.dart';
import 'package:ski_sub/shared/custom_back_button.dart';
import 'package:ski_sub/shared/input_field.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();

  @override
  void dispose() {
    _confirmNewPassword.dispose();
    _newPassword.dispose();
    super.dispose();
  }

  bool obscure = true;
  bool obscure1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        leadingWidth: 70,
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              30.vSpace,
              Text.rich(
                TextSpan(
                  text: 'Create New Pasword',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: SkiColors.primaryColor,
                  ),
                ),
              ),
              10.vSpace,
              const Text(
                'Please, enter a new password below \ndifferent from the previous password',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
              30.vSpace,
              InputField(
                textEditingController: _newPassword,
                obscure: obscure,
                suffixWidget: GestureDetector(
                  onTap: () => setState(() {
                    obscure = !obscure;
                  }),
                  child: const Icon(
                    Icons.visibility_off_outlined,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  ),
                ),
                label: 'New Password',
                hint: '********',
              ),
              30.vSpace,
              InputField(
                textEditingController: _confirmNewPassword,
                obscure: obscure1,
                suffixWidget: GestureDetector(
                  onTap: () => setState(() {
                    obscure1 = !obscure1;
                  }),
                  child: const Icon(
                    Icons.visibility_off_outlined,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  ),
                ),
                label: 'Confirm Password',
                hint: '********',
              ),
              50.vSpace,
              Button(
                  buttonName: 'Create New Password',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const SignInScreen();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
