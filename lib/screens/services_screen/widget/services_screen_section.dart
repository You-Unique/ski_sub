import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ski_sub/utils/extensions.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}

class ServicesScreenSectionButton extends StatelessWidget {
  final String title;
  final String icon;
  const ServicesScreenSectionButton({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: const Border(
            bottom: BorderSide(
          color: Color.fromRGBO(16, 0, 199, 1),
          width: 6,
        )),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon.toSVG(),
            height: 30,
          ),
          15.vSpace,
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
