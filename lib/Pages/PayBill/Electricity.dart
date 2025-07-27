import 'dart:async';

import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


// CategoryIcon widget
class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Icon(icon, size: 30, color: AppColors.appBarIcon),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }
}

// BillerTile widget
class BillerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  const BillerTile({super.key, required this.title, required this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
      onTap: onPressed,
    );
  }
}

// Main electricity widget
class electricity extends StatelessWidget {
  const electricity({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.75,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag handler
                Center(
                  child: Container(
                    height: 5,
                    width: 80,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Category icons carousel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              CategoryIcon(icon: Icons.flash_on, label: 'Electricity'),
                              SizedBox(width: 16),
                              CategoryIcon(icon: Icons.opacity, label: 'Water'),
                              SizedBox(width: 16),
                              CategoryIcon(icon: Icons.phone, label: 'Telephone'),
                              SizedBox(width: 16,),
                              CategoryIcon(icon: Icons.public, label: 'Internet')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Biller list
                 BillerTile(title: "DPDC - Postpaid", subtitle: "Electricity", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ElectricityBillPage()));
                 },),
                const Divider(),
                 BillerTile(title: "DPDC - Prepaid", subtitle: "Electricity", onPressed: () {  },),
                const Divider(),
                 BillerTile(title: "DESCO - Prepaid", subtitle: "Electricity", onPressed: () {  },),
                const Divider(),
                 BillerTile(title: "DESCO - Postpaid", subtitle: "Electricity", onPressed: () {  },),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}



class ElectricityBillPage extends StatefulWidget {
  const ElectricityBillPage({Key? key}) : super(key: key);

  @override
  State<ElectricityBillPage> createState() => _ElectricityBillPageState();
}

class _ElectricityBillPageState extends State<ElectricityBillPage> {
  final TextEditingController accountController =
      TextEditingController(text: "Acc. 17250000000");
  final TextEditingController customerNoController =
      TextEditingController(text: "135215004");
  final TextEditingController billPeriodController =
      TextEditingController(text: "Jan 2004");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Electricity",
            style: GoogleFonts.poppins(color: AppColors.appBarIcon)),
        iconTheme: IconThemeData(color: AppColors.appBarIcon),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text("DPDC - Postpaid",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("Electricity",
                      style: GoogleFonts.poppins(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text("Pay From",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildInputField(
              controller: accountController,
              icon: Icons.account_balance,
              hintText: "Acc. 17250000000",
            ),
            const SizedBox(height: 20),
            Text("DPDC Customer No.",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildInputField(
              controller: customerNoController,
              hintText: "Enter Customer No.",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text("Bill Period",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildInputField(
              controller: billPeriodController,
              icon: Icons.calendar_today,
              hintText: "Select Bill Period",
              onTap: () async {
                // Example date picker
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  final formatted =
                      "${_monthName(selectedDate.month)} ${selectedDate.year}";
                  setState(() {
                    billPeriodController.text = formatted;
                  });
                }
              },
              readOnly: true,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(Icons.play_circle_fill, color: Colors.teal),
                  const SizedBox(width: 6),
                  Text("View Tutorial",
                      style: GoogleFonts.poppins(
                          color: Colors.teal, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const Spacer(),
            CustomButton(text: 'Next', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()));
            })
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    IconData? icon,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon:
            icon != null ? Icon(icon, size: 20, color: AppColors.primary) : null,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 14),
    );
  }

  String _monthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month];
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
        title: const Text("Electricity"),
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
                    Text("DPDC - Postpaid",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    Text("Electricity",
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
                Text("Payment From", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
              child: Text("Complete payment confirmation via",
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
          'Electricity',
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
            const SizedBox(height: 20),
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
              'Electric Bill Payment is successfully completed',
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
                Text("Payment from", style: TextStyle(fontSize: 16)),
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
