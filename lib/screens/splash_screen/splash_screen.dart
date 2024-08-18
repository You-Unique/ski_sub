import 'package:flutter/material.dart';
import 'package:ski_sub/screens/sign_in_screen/sign_in_screen.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
      (val) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Center(
                child: Image.asset(
                  'splash_screen_logo'.toPNG(),
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            10.vSpace,
            Text(
              'SKI SUB',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: SkiColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
