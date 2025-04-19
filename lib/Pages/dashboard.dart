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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'My Banking'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR PAY'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Find ATM'),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

// Dummy pages for nav
class MyBankingPage extends StatelessWidget {
  const MyBankingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("My Banking Page"));
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
