import 'package:banking_system/Pages/Add%20Money/cardtoacc.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Add Money",
          style: GoogleFonts.poppins(color: Colors.white),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade100,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Select your Add Money source",
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          _buildOptionTile(
            context,
            iconPath: "asset/icon/loan-icon.svg",
            label: "Card to Account",
            onTap: () {
              // Navigate to card to account page
              Navigator.push(context, MaterialPageRoute(builder: (context) => cardToAcc()));
            },
          ),
          _buildOptionTile(
            context,
            iconPath: "asset/icon/bank-transfer-icon.svg",
            label: "Account to Account",
            onTap: () {
              // Navigate to account to account page
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, {
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.primary,
        child: SvgPicture.asset(
          iconPath,
          height: 25,
          width: 25,
          color: AppColors.appBarIcon,
        ),
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
    );
  }
}
