import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePINscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final List<CardInfo> cards = [
    CardInfo(
      "Visa Prepaid Card", 
      "4000 40** **** 5040", 
      "asset/icon/visa-icon.svg",
      () {
      
      }
    ),
    CardInfo(
      "Master Credit Card", 
      "5001 40** **** 4051", 
      "asset/icon/master-card-icon.svg",
      () {}  
    ),
    CardInfo(
      "Union Debit Card", 
      "6002 40** **** 4052", 
      "asset/icon/credit-card-color-icon.svg",
      () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePinPage()));
      }  
    ),
  ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Card Block", style: TextStyle(color: AppColors.text)),
        centerTitle: true,
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
            Text(
              "Select Card",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 4),
            Text("Select the card you want to block", style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 20),
            ...cards.map((card) => CardTile(card: card)).toList(),
          ],
        ),
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final CardInfo card;

  const CardTile({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 40,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
          child:
          SvgPicture.asset(
            card.imagePath,
            fit: BoxFit.contain,
          ) 
          // Image.asset(card.imagePath, fit: BoxFit.contain),
        ),
        title: Text(card.name, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(card.number, style: TextStyle(color: Colors.blue.shade900)),
        trailing: Icon(Icons.arrow_right, color: Colors.black),
        onTap: card.onPressed,
      ),
    );
  }
}

class CardInfo {
  final String name;
  final String number;
  final String imagePath;
  final VoidCallback onPressed;

  CardInfo(this.name, this.number, this.imagePath, this.onPressed);
}

class ChangePinPage extends StatelessWidget {
  const ChangePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Change Pin",
          style: TextStyle(
            color: AppColors.text
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Credit Card Info
            Row(
              children: [
                Container(
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  child:
                  SvgPicture.asset(
                    'asset/icon/credit-card-color-icon.svg',
                    fit: BoxFit.contain,
                  ) 
                  // Image.asset(card.imagePath, fit: BoxFit.contain),
                ),
                // SvgPicture.asset(
                //   'asset/icon/credit-card-color-icon.svg',
                //   height: 30,
                // ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Master Credit Card",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "5300 10** **** 4243",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 30),

            // Expiry Date Field
            const TextField(
              decoration: InputDecoration(
                labelText: "Expiry Date",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Create PIN
            const TextField(
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Create New PIN",
                labelStyle: TextStyle(color: Colors.grey),
                helperText: "Your PIN should consist of 4 digits.",
                enabledBorder: UnderlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // Confirm PIN
            const TextField(
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Confirm Your PIN",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(),
              ),
            ),

            const Spacer(),

            // PIN Tips Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tips to choose your PIN",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("• No repeating patterns of digits (e.g. 1111)."),
                  Text("• No consecutive numbers (e.g. 1234)."),
                  Text("• No palindrome numbers (e.g. 0220)."),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Confirm Button
            CustomButton(
              text: 'Confirm', 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PINchanged()));
              }
            )
          ],
        ),
      ),
    );
  }
}

class PINchanged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'PIN Changed',
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
            const SizedBox(height: 80),
            SvgPicture.asset(
              'asset/icon/success-green-check-mark-icon.svg',
              height: 80,
              width: 80,
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
              'Your PIN has been changed successfully',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
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
