import 'dart:async';

import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class NPS extends StatefulWidget {
  @override
  _NPSState createState() => _NPSState();
}

class _NPSState extends State<NPS> {
  String? selectedTransferType;
  String? selectedAccount;
  String? selectedBeneficiary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fund Transfer',
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
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "NPS",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Other Bank Transfer",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            Text(
              "Please enter the following transfer details",
              style: GoogleFonts.poppins(fontSize: 12),
            ),
            const SizedBox(height: 16),

            /// Transfer Mode Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _modeButton("BFTN", selected: false),
                _modeButton("NPS", selected: true),
                _modeButton("RTGS", selected: false),
              ],
            ),
            const SizedBox(height: 24),

            /// Dropdowns
            _buildDropdown(
              icon: Icons.account_balance,
              title: "Transfer Type",
              value: selectedTransferType,
              hint: "Select Transfer Type",
              items: ["Account to Account", "Account to Card", "Card to Account", "Card to Card"],
              onChanged: (val) => setState(() => selectedTransferType = val), 
              leadingIcon: 'asset/icon/cheque-sign-icon.svg', 
            ),
            _buildDropdown(
              icon: Icons.account_balance,
              title: "Transfer From",
              value: selectedAccount,
              hint: "Select Account",
              items: ["Visa Prepaid Card", "JANE DOE"],
              onChanged: (val) => setState(() => selectedAccount = val), 
              leadingIcon: '',
            ),
            _buildDropdown(
              icon: Icons.groups,
              title: "Transfer to (Beneficiary)",
              value: selectedBeneficiary,
              hint: "Select Beneficiary",
              items: ["Visa Prepaid Card", "Masfiqun", "Master Credit Card"],
              onChanged: (val) => setState(() => selectedBeneficiary = val), 
              leadingIcon: '',
            ),
            const SizedBox(height: 16),

            /// TextFields
            _buildTextField("Beneficiary Name", "Enter Name"),
            const SizedBox(height: 12),
            _buildTextField("Bank Name", "Enter Bank Name"),
            const SizedBox(height: 12),
            _buildTextField("District", "Dhaka"),
            const SizedBox(height: 12,),
            _buildTextField("Branch", "Enter your branch"),
            const SizedBox(height: 24,),

            /// Next Button
            CustomButton(
              text: "Next", 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Transfer()));
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _modeButton(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: selected ? Colors.blue : Colors.transparent),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: selected ? Colors.blue : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required IconData icon,
    required String title,
    required String leadingIcon,
    required String? value,
    required String hint,
    required List<String> items, // label -> svg path
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(
            hint,
            style: GoogleFonts.poppins(color: Colors.grey[600]),
          ),
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.blueAccent),
          dropdownColor: Colors.white,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  SvgPicture.asset(
                    '$leadingIcon',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    item,
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}


class Transfer extends StatelessWidget {
  const Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text("Fund Transfer"),
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
              'Transfer Amount',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Please enter the transfer amount below',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 24),
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
            const SizedBox(height: 20),
            // Spacer(),
            Divider(
              thickness: 1,
            ),
            const SizedBox(height: 20),

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferOverviewPage()));
              }
            )
          ],
        ),
      ),
    );
  }
}


class TransferOverviewPage extends StatelessWidget {
  const TransferOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text("Fund Transfer"),
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
                  builder: (context) => const OtpVerificationScreen()
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


class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
                          MaterialPageRoute(builder: (context) => TransactionScreen()), 
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


class TransactionScreen extends StatelessWidget {
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
              'Other Bank Transfer is successful',
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