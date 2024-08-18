import 'package:flutter/material.dart';
import 'package:ski_sub/screens/create_password_screen/create_password_screen.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailCOntroller = TextEditingController();

  @override
  void dispose() {
    _emailCOntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        leadingWidth: 70,
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
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
                  text: 'Forgot Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: SkiColors.primaryColor,
                  ),
                ),
              ),
              10.vSpace,
              const Text(
                'Don\'t Worry it happens. Please enter the \nemail associated with the account',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              40.vSpace,
              InputField(
                textEditingController: _emailCOntroller,
                label: 'Email',
                hint: 'johndoe@email.com',
              ),
              40.vSpace,
              Button(
                  buttonName: 'Continue',
                  onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const CreatePasswordScreen();
                      })))
            ],
          ),
        ),
      ),
    );
  }
}
