import 'dart:async';

import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MFS extends StatelessWidget {
  const MFS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Fund Transfer to MFS',
          style: TextStyle(
            color: AppColors.text,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10), // round bottom corners
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select a Mobile Financial Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Select an option to continue",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                // Navigate to MFS service screen
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MFStransfer()));
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  decoration: BoxDecoration(
                    color: Colors.white, // Must add a background color for shadow to render correctly
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.15), // Slightly more visible shadow
                        offset: const Offset(0, 4), // Drop shadow directly down
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'asset/icon/mobile-money-transfer-icon.svg',
                        height: 60,
                        width: 60,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "MFS Service",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}


class MFStransfer extends StatelessWidget {
  const MFStransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text("Fund Transfer to MFS"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10), // round bottom corners
            ),
          ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MFS Account Transfer',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Please enter the transfer details',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 24,),
            _buildInputField("From", "1750000000000580", Icons.account_balance),
            const SizedBox(height: 12),
            _buildInputField("Transfer To", "1690000000000058", Icons.account_balance),
            const SizedBox(height: 16),

            Center(
              child: Column(
                children: [
                  Text("Amount", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Text("\$ 500", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Amount Chips
            Wrap(
              spacing: 10,
              children: [500, 1000, 5000, 10000].map((amount) {
                return ChoiceChip(
                  selected: amount == 500,
                  label: Text("\$$amount"),
                  selectedColor: AppColors.primary,
                  checkmarkColor: AppColors.appBarIcon,
                  labelStyle: TextStyle(
                    color: amount == 500 ? Colors.white : Colors.black,
                  ),
                  onSelected: (_) {},
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Schedule Transfer Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calendar_today, color: Colors.black),
                SizedBox(width: 12),
                Expanded(
                  child: Text("Schedule Transfer",
                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Icon(Icons.check_box, color: Colors.black),
              ],
            ),
            Divider(
              thickness: 1,
            ),

            const SizedBox(height: 30),

            Row(
              children: const [
                Icon(Icons.play_circle_outline, color: Colors.green),
                SizedBox(width: 8),
                Text("View Tutorial", style: TextStyle(color: Colors.green)),
              ],
            ),

            const SizedBox(height: 30),

            // Next Button
            CustomButton(
              text: 'Next', 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()));
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade600)),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.primary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}


class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text("Fund Transfer to MFS"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10), // round bottom corners
            ),
          ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            // Transfer Overview Header
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.swap_horiz, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Transfer Overview",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    Text("SCU Account Transfer",
                        style: GoogleFonts.poppins(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Transfer From
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transfer From", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                const Icon(Icons.account_balance),
              ],
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Acc. 1750000000000580",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade600)),
            ),
            const Divider(height: 24),

            // Total Amount & Transfer To Info
            Row(
              children: [
                // Total Amount Box
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total amount",
                            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade600)),
                        const SizedBox(height: 4),
                        Text("USD 500.00", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        Text("USD 500.00 + USD 04.99",
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 6),
                        Text("View Breakdown ⌄",
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: const Color(0xFF0D67B5))),
                      ],
                    ),
                  ),
                ),

                // Transfer To Box
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transfer to",
                            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade600)),
                        const SizedBox(height: 4),
                        Text("Bartholomew Robert",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        Text("ACC. ** 0058",
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Notes Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NOTES",
                          style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          controller: TextEditingController(text: "SCU Transfer"),
                          style: GoogleFonts.poppins(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    )
                  ),
                  const Icon(Icons.edit, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Verification Method
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Select Verified Method",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildVerificationOption(Icons.fingerprint, "Biometric"),
                _buildVerificationOption(Icons.email_outlined, "Email"),
                _buildVerificationOption(Icons.sms, "SMS"),
              ],
            ),

            const SizedBox(height: 30),

            // Next Button (disabled)
            CustomButton(
              text: 'Next', 
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent, 
                  builder: (context) => const OtpVerification()
                );  
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationOption(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: Colors.blue),
            const SizedBox(height: 8),
            Text(label, style: GoogleFonts.poppins(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}


class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _start = 83; // 01:23 in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollCrontroller) {
        return Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30)
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollCrontroller,
            child: 
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'OTP Verification',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Enter the verification code sent to your\nregistered phone number 1800***4807',
                      // textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 30),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      controller: otpController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50,
                        fieldWidth: 45,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        activeColor: Colors.blue,
                        selectedColor: Colors.blueAccent,
                        inactiveColor: Colors.grey.shade400,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {
                        debugPrint("Completed: $v");
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Didn't get OTP?",
                              style: TextStyle(fontSize: 13),
                            ),
                            TextButton(
                              onPressed: _start == 0 ? () {
                                // Resend logic here
                                setState(() {
                                  _start = 83;
                                  startTimer();
                                });
                              } : null,
                              child: const Text('Resend code'),
                            ),
                          ],
                        ),
                        Text(
                          timerText,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Next Button
                    CustomButton(
                      text: 'Next', 
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Transaction()), 
                          (Route<dynamic> route) => false, 
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}


class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Transaction',
          style: TextStyle(
            color: AppColors.text
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10), // round bottom corners
            ),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            SvgPicture.asset(
              'asset/icon/success-green-check-mark-icon.svg',
              height: 60,
              width: 60,
              color: Colors.green,
            ),
            const SizedBox(height: 15),
            const Text(
              'Success',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600
              ),
            ),
            const Text(
              'Your MFS Transfer is successful',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            Divider(
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.account_balance, color: Colors.black54),
                SizedBox(width: 8),
                Text("Transfer from", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Acc. 1750000000000580",
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Divider(thickness: 1,),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Total amount", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 5),
                        Text(
                          "504.99 USD",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "500.00 + 4.99 USD",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("To", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 5),
                        Text(
                          "Bartholomew Robert",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "175000000058",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Date and Time", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  Text(
                    "20-Dec-2003, 12:14 AM",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                
              },
              child: const Text(
                'View Receipt',
                style: TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardPage()), 
                    (Route<dynamic> route) => false, 
                  );
                },
                child: const Text("Close", style: TextStyle(fontSize: 16, color: AppColors.text)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

