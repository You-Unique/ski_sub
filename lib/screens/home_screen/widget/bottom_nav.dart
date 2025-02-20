import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(0),
              child: BottomNavItem(
                selected: currentIndex == 0,
                icon: 'home_icon',
                title: 'Home',
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(1),
              child: BottomNavItem(
                selected: currentIndex == 1,
                icon: 'hotel_booking_icon',
                title: 'Services',
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(2),
              child: BottomNavItem(
                selected: currentIndex == 2,
                icon: 'profile_icon',
                title: 'Profile',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool selected;
  const BottomNavItem({
    super.key,
    required this.selected,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: selected ? 5 : 2,
            color: selected
                ? SkiColors.primaryColor
                : const Color.fromRGBO(225, 227, 237, 1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SvgPicture.asset(
              icon.toSVG(),
              colorFilter: ColorFilter.mode(
                  selected ? SkiColors.primaryColor : Colors.black,
                  BlendMode.srcIn),
            ),
            10.vSpace,
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
