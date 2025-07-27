import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CardBlockScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final List<CardInfo> cards = [
    CardInfo(
      "Visa Prepaid Card", 
      "4000 40** **** 5040", 
      "asset/icon/visa-icon.svg",
      () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BlockCardScreen()));
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
      () {}  
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

class BlockCardScreen extends StatefulWidget {
  @override
  _BlockCardScreenState createState() => _BlockCardScreenState();
}

class _BlockCardScreenState extends State<BlockCardScreen> {
  String selectedReason = 'Captured';
  final List<String> reasons = ['Captured', 'Lost', 'Stolen', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Card Block', style: TextStyle(color: AppColors.text)),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Block this card",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Please provide the following information",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                    ),
                    child: SvgPicture.asset(
                      'asset/icon/visa-icon.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Visa Prepaid Card", style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("4000 40** **** 5040", style: TextStyle(color: Colors.blue.shade900)),
                      ],
                    ),
                  ),
                  Icon(Icons.lock_outline, color: AppColors.primary),
                ],
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Reason',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              value: selectedReason,
              items: reasons.map((String reason) {
                return DropdownMenuItem<String>(
                  value: reason,
                  child: Text(reason),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedReason = value!;
                });
              },
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Block card

              },
              child: Row(
                children: [
                  Icon(Icons.play_circle_fill, color: Colors.green, size: 28),
                  SizedBox(width: 8),
                  Text(
                    "View Tutorial",
                    style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Divider(height: 32),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Block logic
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPinScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("Block", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPinScreen extends StatefulWidget {
  @override
  _ConfirmPinScreenState createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Card Block', style: TextStyle(color: AppColors.text)),
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              "Confirm It’s You",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter Your PIN Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _pinController,
              obscureText: true,
              maxLength: 12,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 4,
              ),
            ),
            Spacer(),
            CustomButton(
              text: 'Confirm', 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BlockConfirm()));
              }
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BlockConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Card Block',
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
              'Your Card has been successfully BLOCKED',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
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
