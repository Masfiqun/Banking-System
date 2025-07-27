import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';

class MyBankingPage extends StatelessWidget {
  final ScrollController? scrollController;

  const MyBankingPage({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          children: [
            const Divider(
              indent: 100,
              endIndent: 100,
              thickness: 3,
            ),
            const SizedBox(height: 10,),
            const Text(
              'My Banking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Enjoy seamless and instant transactions',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // Card Grid
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildCardOption(
                  icon: Icons.connect_without_contact_rounded,
                  title: 'My Acc. Transfer',
                  subtitle: 'Transfer to your SCU account',
                  color: Colors.lightBlue.shade50,
                  icolor: AppColors.primary,
                ),
                _buildCardOption(
                  icon: Icons.signpost_rounded,
                  title: 'My MFS Transfer',
                  subtitle: 'Transfer to your MFS account',
                  color: Colors.lightBlue.shade50,
                  icolor: AppColors.primary,
                ),
                _buildCardOption(
                  icon: Icons.credit_card,
                  title: 'My Card',
                  subtitle: 'Pay your credit card dues and top-up prepaid card',
                  color: Colors.green.shade50,
                  icolor: Colors.green,
                ),
                _buildCardOption(
                  icon: Icons.price_check_outlined,
                  title: 'My Recharge',
                  subtitle: 'Recharge your mobile no. 211123456',
                  color: Colors.orange.shade50,
                  icolor: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 30),

            _buildListTile(icon: Icons.description_outlined, text: 'My Banking History'),
            const SizedBox(height: 12),
            _buildListTile(icon: Icons.calendar_month, text: 'My Schedule Transfer'),
          ],
        ),
      ),
    );
  }

  Widget _buildCardOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Color icolor,
  }) {
    return SizedBox(
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(-4, 4), 
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: icolor),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(-4, 4),
            blurRadius: 6
          )
        ]
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
