import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';


class More extends StatelessWidget {
  const More({super.key});

  final List<Map<String, dynamic>> essentials = const [
    {
      'icon': Icons.touch_app,
      'label': 'Self Service',
      'onPressed': _onSelfServicePressed,
    },
    {
      'icon': Icons.wb_twilight,
      'label': 'Priority Banking',
      'onPressed': _onPriorityBankingPressed,
    },
    {
      'icon': Icons.bolt,
      'label': 'Power\nBanking',
      'onPressed': _onPowerBankingPressed,
    },
    {
      'icon': Icons.book_outlined,
      'label': 'Info Update',
      'onPressed': _onInfoUpdatePressed,
    },
    {
      'icon': Icons.add_chart,
      'label': 'Limits',
      'onPressed': _onLimitsPressed,
    },
    {
      'icon': Icons.payment,
      'label': 'e-Pay',
      'onPressed': _onEPayPressed,
    },
  ];

  final List<Map<String, dynamic>> accounts = const [
    {
      'icon': Icons.calendar_today,
      'label': 'Statement',
      'onPressed': _onStatementPressed,
    },
    {
      'icon': Icons.history,
      'label': 'History',
      'onPressed': _onHistoryPressed,
    },
    {
      'icon': Icons.verified_user,
      'label': 'Positive Pay',
      'onPressed': _onPositivePayPressed,
    },
    {
      'icon': Icons.book,
      'label': 'Certificate',
      'onPressed': _onPassbookPressed,
    },
    {
      'icon': Icons.summarize,
      'label': 'Cardless Withdrawal',
      'onPressed': _onSummaryPressed,
    },
    {
      'icon': Icons.cloud_queue_rounded,
      'label': 'Service Request',
      'onPressed': _onBalancePressed,
    },
  ];

  final List<Map<String, dynamic>> card = const [
    {
      'icon': Icons.credit_card,
      'label': 'Card Block',
      'onPressed': _oncardblockPressed,
    },
    {
      'icon': Icons.lock_reset_rounded,
      'label': 'Change Pin',
      'onPressed': _onchangePinPressed,
    },
    {
      'icon': Icons.bar_chart_sharp,
      'label': 'Limit (TP)',
      'onPressed': _onLimitPressed,
    },
    {
      'icon': Icons.public_sharp,
      'label': 'International Transfer',
      'onPressed': _onInternationalPressed,
    },
    {
      'icon': Icons.calculate_sharp,
      'label': 'EMI',
      'onPressed': _onEMIPressed,
    },
    {
      'icon': Icons.calendar_month,
      'label': 'Statement',
      'onPressed': _onstatementPressed,
    },
  ];

  final List<Map<String, dynamic>> other = const [
    {
      'icon': Icons.circle_outlined,
      'label': 'Find ATM',
      'onPressed': _onFindATMPressed,
    },
    {
      'icon': Icons.square_outlined,
      'label': 'What''s New',
      'onPressed': _onNewPressed,
    },
    {
      'icon': Icons.flag_circle_rounded,
      'label': 'Find Branch',
      'onPressed': _onBranchPressed,
    },
    {
      'icon': Icons.phone_in_talk_outlined,
      'label': 'Help & Support',
      'onPressed': _onHelpPressed,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.85,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag Handler
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _buildSectionTitle("ESSENTIALS"),
                const SizedBox(height: 10),
                _buildGrid(essentials),
                const SizedBox(height: 30),
                _buildSectionTitle("ACCOUNTS"),
                const SizedBox(height: 10),
                _buildGrid(accounts),
                const SizedBox(height: 30),
                _buildSectionTitle("CARD"),
                const SizedBox(height: 10),
                _buildGrid(card),
                const SizedBox(height: 30),
                _buildSectionTitle("OTHER"),
                const SizedBox(height: 10),
                _buildGrid(other),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(width: 10),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }

  Widget _buildGrid(List<Map<String, dynamic>> items) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 0.9,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: items.map((item) {
        return GestureDetector(
          onTap: () {
            final onPressed = item['onPressed'] as Function?;
            if (onPressed != null) {
              onPressed();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'], size: 30, color: AppColors.primary),
                const SizedBox(height: 8),
                Text(
                  item['label'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // Action methods (replace with real actions or navigation)

  // Essentials navigators
  static void _onSelfServicePressed() => print("Self Service tapped");
  static void _onPriorityBankingPressed() => print("Priority Banking tapped");
  static void _onPowerBankingPressed() => print("Power Banking tapped");
  static void _onInfoUpdatePressed() => print("Info Update tapped");
  static void _onLimitsPressed() => print("Limits tapped");
  static void _onEPayPressed() => print("e-Pay tapped");

  //Accounts navigators
  static void _onStatementPressed() => print("Statement tapped");
  static void _onHistoryPressed() => print("History tapped");
  static void _onPositivePayPressed() => print("Positive Pay tapped");
  static void _onPassbookPressed() => print("Passbook tapped");
  static void _onSummaryPressed() => print("Summary tapped");
  static void _onBalancePressed() => print("Balance tapped");

  //cards navigators
  static void _oncardblockPressed() => print("Card Blocked tapped");
  static void _onchangePinPressed() => print("Change Pin tapped");
  static void _onLimitPressed() => print("Limit tapped");
  static void _onInternationalPressed() => print("International tapped");
  static void _onEMIPressed() => print("EMI tapped");
  static void _onstatementPressed() => print("Statement tapped");

  //others navigators
  static void _onFindATMPressed() => print("EMI tapped");
  static void _onNewPressed() => print("EMI tapped");
  static void _onBranchPressed() => print("EMI tapped");
  static void _onHelpPressed() => print("EMI tapped");
}
