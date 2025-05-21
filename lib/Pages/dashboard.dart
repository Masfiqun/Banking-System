import 'package:banking_system/Pages/QrPage.dart';
import 'package:banking_system/Pages/banking_page.dart';
import 'package:banking_system/Pages/findATM.dart';
import 'package:banking_system/Pages/homepage.dart';
import 'package:banking_system/Utils/color.dart';
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
    if (index == 1 || index == 2 || index == 3) {
      showPopupPage(_pages[index], index);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }


  void showPopupPage(Widget page, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.85,
        minChildSize: 0.5,
        builder: (_, controller) => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: _wrapWithScrollControllerIfNeeded(page, controller, index),
        ),
      ),
    );
  }


  Widget _wrapWithScrollControllerIfNeeded(
      Widget page, ScrollController controller, int index) {
    if (index == 1 && page is MyBankingPage) {
      return MyBankingPage(scrollController: controller);
    }

    // For other pages, wrap them with a ScrollView if needed
    return page;
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
          backgroundColor: AppColors.primary,
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
