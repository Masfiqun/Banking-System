import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            'Accounts',
            style: TextStyle(
              color: AppColors.text
            ),  
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.appBarIcon
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10), // round bottom corners
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Current/Savings'),
              Tab(text: 'FDR/DPS/TDR'),
              Tab(text: 'Loans'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1 - Current/Savings
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.sync, color: Colors.blue),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text('Tap to see recently added accounts.'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sync', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AccountTile(
                  title: 'JANE DOE SAL',
                  accountNumber: '173000000000000325',
                  balance: '581356.0325',
                  category: 'Single',
                  isPrimary: true, onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Current()));
                  },
                ),
                const SizedBox(height: 12),
                AccountTile(
                  title: 'JANE DOE  Bond',
                  accountNumber: '184000000000000964',
                  balance: '1365478.25',
                  category: 'Joint', onpressed: () {  },
                ),
                const SizedBox(height: 12),
                AccountTile(
                  title: 'JANE DOE  Fin',
                  accountNumber: '236000000000004789',
                  balance: '56985.97',
                  category: 'Joint', onpressed: () {  },
                ),
              ],
            ),
            // Tab 2 - FDR/DPS/TDR
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                AccountTile(
                  title: 'JANE DOE  Bond',
                  accountNumber: '184000000000000964',
                  balance: '1365478.25',
                  category: 'Joint', 
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DPSFDPage()));
                  },
                ),
                SizedBox(height: 12,),
                AccountTile(
                  title: 'JANE DOE  Bond',
                  accountNumber: '184000000000000964',
                  balance: '1365478.25',
                  category: 'Joint',
                  isPrimary: true, onpressed: () {  },
                )
              ],
            ),

            // Tab 3 - Loans
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                AccountTile(
                  title: 'JANE DOE  Bond',
                  accountNumber: '184000000000000964',
                  balance: '1365478.25',
                  category: 'Joint', onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoanDetailPage()));
                  },
                ),
                SizedBox(height: 12,),
                AccountTile(
                  title: 'JANE DOE  Bond',
                  accountNumber: '184000000000000964',
                  balance: '1365478.25',
                  category: 'Joint', onpressed: () {  },
                ),
                SizedBox(height: 12,),
                AccountTile(
                  title: 'JANE DOE  Bond',
                  accountNumber: '184000000000000964',
                  balance: '1365478.25',
                  category: 'Joint',
                  isPrimary: true, onpressed: () {  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final String title;
  final String accountNumber;
  final String balance;
  final String category;
  final bool isPrimary;
  final VoidCallback onpressed;

  const AccountTile({
    super.key,
    required this.title,
    required this.accountNumber,
    required this.balance,
    required this.category,
    required this.onpressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_balance, size: 20, color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '$title\nAcc $accountNumber',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                if (isPrimary)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Primary',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Balance\n',
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                    children: [
                      TextSpan(
                        text: '$balance USD',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'CATEGORY\n',
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                    children: [
                      TextSpan(
                        text: category,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class LoanDetailPage extends StatelessWidget {
  const LoanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Detail',
          style: TextStyle(
            color: AppColors.text
          ),  
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.background,
              child: SvgPicture.asset(
                'asset/icon/home-insurance-icon.svg',
                width: 50,
                height: 50,
                color: AppColors.primary,
              )
            ),
            const SizedBox(height: 16),
            const Icon(Icons.keyboard_arrow_down, size: 50),
            const SizedBox(height: 10),
            const Text(
              'ACC 173000000000000084',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text(
              'Loan  \$6000',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(
              height: 30, 
              thickness: 1,
              indent: 30,
              endIndent: 30,  
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.info_outline, color: Colors.white, size: 40,),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Loan Detail',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'SCU Startup',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  DetailRow(title: 'Principal Amount', value: '\$ 5000'),
                  DetailRow(title: 'Interest Rate', value: '5%'),
                  DetailRow(title: 'Interest Amount', value: '\$ 1000'),
                  DetailRow(title: 'Total Loan', value: '\$ 6000'),
                  DetailRow(title: 'Maturity Date', value: '25-Mar-2004'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}


class DPSFDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DPS/FD/TDR',
          style: TextStyle(
            color: AppColors.text
          ),  
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.background,
                  radius: 35,
                  child: SvgPicture.asset(
                    'asset/icon/money-icon.svg',
                    height: 40,
                    width: 40,
                    color: AppColors.primary,
                  )
                ),
                SizedBox(height: 8),
                Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 40,),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people, color: AppColors.background),
                    SizedBox(width: 8),
                    Text("Acc ", style: TextStyle(color: Colors.grey, fontSize: 18)),
                    Text(
                      "1730000000000045",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Balance  \$ 621.25",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 16),
                Divider(
                  height: 30, 
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                ),
                Icon(Icons.info, color: AppColors.primary, size: 50),
                SizedBox(height: 24),
              ],
            ),
            _buildCard(
              title: 'Product Details',
              subtitle: 'SCU CONFIDENCE',
              label: 'Maturity Date',
              value: '25-Mar-2004',
            ),
            SizedBox(height: 16),
            _buildCard(
              title: 'Summary',
              subtitle: 'Total deposited amount',
              label: '',
              value: '\$ 650',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 14)),
          if (label.isNotEmpty) ...[
            SizedBox(height: 12),
            Text(label, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 14)),
          ] else ...[
            SizedBox(height: 12),
            Text(value, style: TextStyle(fontSize: 14)),
          ],
        ],
      ),
    );
  }
}


class Current extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Current Account',
          style: TextStyle(
            color: AppColors.text
          ),  
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.background,
                  radius: 40,
                  child: SvgPicture.asset(
                    'asset/icon/home-insurance-icon.svg',
                    height: 60,
                    width: 60,
                    color: AppColors.primary,
                  )
                ),
                SizedBox(height: 8),
                Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 40,),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people, color: AppColors.background),
                    SizedBox(width: 8),
                    Text("Acc ", style: TextStyle(color: Colors.grey, fontSize: 18)),
                    Text(
                      "1730000000000045",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Balance  \$ 621.25",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 16),
                Divider(
                  height: 30, 
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                ),
              ],
            ),
            _buildCard(
              title: 'Product Details',
              subtitle: 'SCU CONFIDENCE',
              label: 'Maturity Date',
              value: '25-Mar-2004',
            ),
            SizedBox(height: 16),
            _buildCard(
              title: 'Summary',
              subtitle: 'Total deposited amount',
              label: '',
              value: '\$ 650',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 14)),
          if (label.isNotEmpty) ...[
            SizedBox(height: 12),
            Text(label, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 14)),
          ] else ...[
            SizedBox(height: 12),
            Text(value, style: TextStyle(fontSize: 14)),
          ],
        ],
      ),
    );
  }
}