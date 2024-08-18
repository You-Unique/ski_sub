import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:ski_sub/screens/home_screen/home_screen.dart';
import 'package:ski_sub/screens/sign_up_screen/sign_up_screen.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 70,
        leading: const CustomBackButton(),
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(bottom: 30),
        child: Text.rich(
          TextSpan(
            text: 'Don’t have an account? ',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: 'Sign Up',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }),
                    );
                  },
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: SkiColors.primaryColor,
                ),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            30.vSpace,
            const Text(
              'Sign In 👋',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color.fromRGBO(16, 0, 199, 1),
              ),
            ),
            10.vSpace,
            const Text(
              'Welcome back, Log in to your account ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            60.vSpace,
            InputField(
              textEditingController: _emailController,
              label: 'Email',
              hint: 'johndoe@email.com',
            ),
            20.vSpace,
            InputField(
              textEditingController: _passwordController,
              label: 'Password',
              hint: '******',
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
            ),
            30.vSpace,
            Text.rich(
              TextSpan(
                  text: 'Forgot Password?',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ForgotPassword();
                      }));
                    },
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: SkiColors.primaryColor,
                  )),
            ),
            30.vSpace,
            Button(
              buttonName: 'Sign In',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
