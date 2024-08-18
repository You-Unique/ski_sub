import 'package:flutter/material.dart';
import 'package:ski_sub/screens/home_screen/home_screen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(229, 231, 235, 1),
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class NewCustomBackButton extends StatelessWidget {
  const NewCustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        })),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(229, 231, 235, 1),
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
      ),
    );
  }
}
