import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Dummy placeholders - Replace with your real pages
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Help Page'));
  }
}

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Scan the QR Code from ATM",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Container(
            width: 250,
            height: 250,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          const Text("Hold your camera to scan QR code"),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('asset/icon/master-card-icon.svg', height: 40),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QRdetails()));
                },
                child: SvgPicture.asset('asset/icon/visa-icon.svg', height: 40)
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('History Page'));
  }
}

class CardLessQRScanScreen extends StatefulWidget {
  const CardLessQRScanScreen({super.key});

  @override
  State<CardLessQRScanScreen> createState() => _CardLessQRScanScreenState();
}

class _CardLessQRScanScreenState extends State<CardLessQRScanScreen> {
  int _currentIndex = 1; // Default to "Scan" page

  final List<Widget> _pages = [
    HelpPage(),
    ScanPage(),
    HistoryPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "Card Less",
          style: TextStyle(color: AppColors.text),
        ),
        iconTheme: const IconThemeData(color: AppColors.appBarIcon),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: _pages[_currentIndex], // This will change with tab
      bottomNavigationBar: Material(
        elevation: 15,
        shadowColor: Colors.white,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: AppColors.primary,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Help'),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          ],
        ),
      ),
    );
  }
}


class QRdetails extends StatelessWidget {
  const QRdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "Card Less",
          style: TextStyle(color: AppColors.text),
        ),
        iconTheme: const IconThemeData(color: AppColors.appBarIcon),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            _infoRow(value: 'March 20, 2025 16:50', lable: 'Date'),
            _infoRow(value: 'Commercial Bank', lable: 'Bank'),
            _infoRow(lable: 'Branch', value: 'Dhaka'),
            _infoRow(lable: 'Card', value: '6000 40** **** 6249'),
            _infoRow(lable: 'Amount', value: '100.00 USD'),
            _infoRow(lable: 'Receipt', value: '62.00 USD'),
            _infoRow(lable: 'Total', value: '162.00 USD'),

            Divider(thickness: 1,),
        
            const Spacer(),
        
            CustomButton(
              text: 'Confirm', 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Transaction()));
              }
            )
          ],
        ),
      ),
    );
  }
}

class _infoRow extends StatelessWidget {
  final String lable;
  final String value;
  const _infoRow({required this.lable, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lable, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontSize: 15)),
        ],
      ),
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
              'Cash Withdrawal successful',
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
              width: double.infinity,
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
