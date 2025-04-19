import 'package:banking_system/Pages/banking_page.dart';
import 'package:banking_system/Pages/homepage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    MyBankingPage(),
    QRPayPage(),
    FindATMPage(),
  ];

   void _onTabTapped(int index) {
    if (index == 1) {
      // Show MyBankingPage as a bottom sheet
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => DraggableScrollableSheet(
          initialChildSize: 0.9,
          maxChildSize: 0.95,
          minChildSize: 0.6,
          builder: (_, controller) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: MyBankingPage(scrollController: controller),
          ),
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Material(
        elevation: 15,
        shadowColor: Colors.white,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.blue.shade800,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'My Banking'),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR PAY'),
            BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Find ATM'),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}


class QRPayPage extends StatelessWidget {
  const QRPayPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("QR PAY Page"));
  }
}

class FindATMPage extends StatelessWidget {
  const FindATMPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Find ATM Page"));
  }
}
