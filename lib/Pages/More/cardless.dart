import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';

class CardlessCashScreen extends StatelessWidget {
  const CardlessCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "Cardless Cash",
          style: TextStyle(color: AppColors.text),
        ),
        iconTheme: const IconThemeData(color: AppColors.appBarIcon),
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
            _sectionTitle("From"),
            _infoRow(value: 'Acc Type', lable: 'Saving Account'),
            _infoRow(value: 'Acc', lable: '1730000000000012'),
            _infoRow(value: 'Amount', lable: '150325.59 USD'),
            const SizedBox(height: 20),

            _sectionTitle("To"),
            const Text("Mobile Number", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter Number",
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            _sectionTitle("Amount"),
            _infoRow(value: '00.00', lable: 'USD',),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Amount has to be multiples of 10 and a maximum of USD 1000",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            _sectionTitle("Secret Code"),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 20),
              child: Text(
                "This is the 4-digits code needed at the ATM",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            _tipsBox(),

            const SizedBox(height: 20,),

            CustomButton(
              text: 'Proceed', 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CardlessCashConfirmationScreen()));
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Divider(thickness: 1),
        const SizedBox(height: 8),
      ],
    );
  }


  Widget _tipsBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tips to choose your secret code",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          BulletPoint(text: "No repeating patterns of digits  (e.g. 1111)"),
          BulletPoint(text: "No consecutive numbers (e.g. 1234)"),
          BulletPoint(text: "No palindrome numbers (e.g. 0220)"),
        ],
      ),
    );
  }
}

class _infoRow extends StatelessWidget {
  final String lable;
  final String value;
  const _infoRow({required this.value, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          Text(lable, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

class CardlessCashConfirmationScreen extends StatelessWidget {
  const CardlessCashConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "Cardless Cash",
          style: TextStyle(color: AppColors.text),
        ),
        iconTheme: const IconThemeData(color: AppColors.appBarIcon),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10), // round bottom corners
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRowDouble("From", "To", "1730000000000012", "+44 7700 123456"),
            const Divider(height: 32),

            _infoRow(value: 'Amount', lable: '100.00 USD'),
            _infoRow(value: 'Charge', lable: '01.25 USD'),
            _infoRow(value: 'Total', lable: '101.25 USD'),
            Divider(thickness: 1,),

            const SizedBox(height: 16),
            _infoRowBold("Current Balance", "150224.34 USD"),
            Divider(thickness: 1,),
            const SizedBox(height: 16),
            _infoRowBold("Secret Code", "9583"),
            Divider(thickness: 1,),
            const SizedBox(height: 16),
            _infoRow(value: 'Date', lable: 'March 20, 2025 16:24'),
            Divider(thickness: 1,),

            const Spacer(),

            CustomButton(
              text: 'Confirm', 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRowBold(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _infoRowDouble(String leftLabel, String rightLabel, String leftValue, String rightValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _columnItem(leftLabel, leftValue),
        _columnItem(rightLabel, rightValue),
      ],
    );
  }

  Widget _columnItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}