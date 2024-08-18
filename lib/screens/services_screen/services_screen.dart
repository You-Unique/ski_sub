import 'package:flutter/material.dart';
import 'package:ski_sub/screens/car_booking_screen/car_booking_screen.dart';
import 'package:ski_sub/screens/services_screen/widget/services_screen_section.dart';
import 'package:ski_sub/shared/custom_back_button.dart';
import 'package:ski_sub/utils/extensions.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NewCustomBackButton(),
        leadingWidth: 70,
        centerTitle: true,
        title: const Text(
          'Services',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            150.vSpace,
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const CarBookingScreen();
              })),
              child: const ServicesScreenSectionButton(
                icon: 'car_rental_icon',
                title: 'Car Rentals',
              ),
            ),
            20.hSpace,
            const ServicesScreenSectionButton(
              icon: 'hotel_booking_icon',
              title: 'Book Hotel',
            ),
          ],
        ),
      ),
    );
  }
}
