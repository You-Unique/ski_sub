import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarBookingScreen extends StatefulWidget {
  const CarBookingScreen({super.key});

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  final TextEditingController _pickUp = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  final TextEditingController _startTime = TextEditingController();
  final TextEditingController _endTime = TextEditingController();
  final TextEditingController _driverAge = TextEditingController();

  @override
  void dispose() {
    _pickUp.dispose();
    _startDate.dispose();
    _endDate.dispose();
    _startTime.dispose();
    _endTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          leadingWidth: 70,
          title: const Text(
            'Car Rentals Booking',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
              minimum: const EdgeInsets.only(bottom: 40),
              child: Button(
                  buttonName: 'Book',
                  onTap: () {
                    Navigator.of(context).pop();
                  })),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                40.vSpace,
                const Text(
                  'Pick Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                10.vSpace,
                InputField(
                  textEditingController: _pickUp,
                  label: 'Pick Up Location',
                  hint: 'City',
                ),
                20.vSpace,
                const Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                10.vSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _startDate,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            // icon: Icon(Icons.calendar_today),
                            labelText: 'Pick Up Date'),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000));
                          if (pickedDate != null) {
                            setState(() {
                              pickedDate = pickedDate;
                              _startDate.text =
                                  DateFormat.MEd().format(pickedDate!);
                              pickedDate.toString();
                            });
                          }
                        },
                      ),
                    ),
                    10.hSpace,
                    const Text('-'),
                    10.hSpace,
                    Expanded(
                      child: TextField(
                        controller: _endDate,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            // icon: Icon(Icons.calendar_today),
                            labelText: 'Drop Off Date Now'),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000));
                          if (pickedDate != null) {
                            setState(() {
                              pickedDate = pickedDate;
                              _endDate.text =
                                  DateFormat.MEd().format(pickedDate!);
                              pickedDate.toString();
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                20.vSpace,
                Row(
                  children: [
                    const Text(
                      'Pick Up Time',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    100.hSpace,
                    const Text(
                      'Drop Off Time',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                10.vSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _startTime,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            // icon: Icon(Icons.calendar_today),
                            labelText: '10:10'),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              pickedTime = pickedTime;
                              _startTime.text = pickedTime!.format(context);
                              pickedTime.toString();
                            });
                          }
                        },
                      ),
                    ),
                    20.hSpace,
                    Expanded(
                      child: TextField(
                        controller: _endTime,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            // icon: Icon(Icons.calendar_today),
                            labelText: '10:10'),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              pickedTime = pickedTime;
                              _endTime.text = pickedTime!.format(context);
                              pickedTime.toString();
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                20.vSpace,
                const Text(
                  'Driver Age',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                10.vSpace,
                InputField(
                  textEditingController: _driverAge,
                  label: 'Enter Age',
                  hint: '18',
                ),
                60.vSpace,
              ],
            ),
          ),
        ));
  }
}
