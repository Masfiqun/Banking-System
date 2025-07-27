import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class cardToAcc extends StatefulWidget {
  const cardToAcc({super.key});

  @override
  State<cardToAcc> createState() => _cardToAccState();
}

class _cardToAccState extends State<cardToAcc> {
  String selectedCard = "VISA Card ****1473";
  int selectedAmount = 500;
  List<int> quickAmounts = [500, 1000, 5000, 10000];

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Text(
              "Add From Card",
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              "Please enter the following informations",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 35),

            // From dropdown row
            Row(
              children: [
                Text("From:  ", style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                Expanded(
                  child: Text(
                    selectedCard,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/card.svg', // your card icon
                  height: 24,
                  width: 24,
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            const SizedBox(height: 20),

            // Card Holder
            Text(
              "Card Holder: John Doe",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 16),

            // Note Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButtonFormField<String>(
                value: null,
                hint: Text(
                  "Money for 6th EMI installment",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                items: [], // Add your items here
                onChanged: (value) {},
                decoration: const InputDecoration.collapsed(hintText: ''),
              ),
            ),

            const SizedBox(height: 20),

            // Amount Label
            Text(
              "Amount",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            // Amount Display
            Center(
              child: Text(
                "\$${selectedAmount.toString()}",
                style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 4),

            // Quick Select Amounts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: quickAmounts.map((amount) {
                final bool isSelected = selectedAmount == amount;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAmount = amount;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      "$amount",
                      style: GoogleFonts.poppins(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),

            // Next Button
            CustomButton(text: 'Next', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
            })
          ],
        ),
      ),
    );
  }
}
