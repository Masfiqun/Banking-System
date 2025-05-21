import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';

class CardPayment extends StatelessWidget {
  final ScrollController? scrollController;

  const CardPayment({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10), // round bottom corners
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.appBarIcon
        ),
        title: Text(
          'Card Payment',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Text(
                'Make cashless payments seamlessly.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // Card Grid
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildCardOption(
                    icon: Icons.credit_card,
                    title: 'My Card',
                    subtitle: 'Pay your credit card dues and top-up prepaid cards.',
                    color: Colors.blue[50]!,
                  ),
                  _buildCardOption(
                    icon: Icons.credit_score,
                    title: 'SCU Card',
                    subtitle: 'Pay SCU credit card dues and top-up prepaid transactions.',
                    color: Colors.lightBlue[50]!,
                  ),
                  _buildCardOption(
                    icon: Icons.account_balance,
                    title: 'Other Bank Card',
                    subtitle: 'Pay other Bank visa and credit card dues.',
                    color: Colors.green[50]!,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // List Buttons
              _buildListTile(icon: Icons.group, text: 'Beneficiary'),
              const SizedBox(height: 12),
              _buildListTile(icon: Icons.history, text: 'Payment History'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return SizedBox(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({required IconData icon, required String text}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}