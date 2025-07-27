import 'package:banking_system/Pages/More/cardBlock.dart';
import 'package:banking_system/Pages/More/cardless.dart';
import 'package:banking_system/Pages/More/cardlessQR.dart';
import 'package:banking_system/Pages/More/changePIN.dart';
import 'package:banking_system/Pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter_svg/svg.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  late final List<Map<String, dynamic>> essentials;
  late final List<Map<String, dynamic>> accounts;
  late final List<Map<String, dynamic>> card;
  late final List<Map<String, dynamic>> other;

  @override
  void initState() {
    super.initState();
    essentials = [
      {'icon': Icons.touch_app, 'label': 'Self Service', 'onPressed': _onSelfServicePressed},
      {'icon': Icons.wb_twilight, 'label': 'Priority Banking', 'onPressed': _onPriorityBankingPressed},
      {'icon': Icons.bolt, 'label': 'Power\nBanking', 'onPressed': _onPowerBankingPressed},
      {'icon': Icons.book_outlined, 'label': 'Info Update', 'onPressed': _onInfoUpdatePressed},
      {'icon': Icons.add_chart, 'label': 'Limits', 'onPressed': _onLimitsPressed},
      {'icon': Icons.payment, 'label': 'e-Pay', 'onPressed': _onEPayPressed},
    ];

    accounts = [
      {'icon': Icons.calendar_today, 'label': 'Statement', 'onPressed': _onStatementPressed},
      {'icon': Icons.history, 'label': 'History', 'onPressed': _onHistoryPressed},
      {'icon': Icons.verified_user, 'label': 'Positive Pay', 'onPressed': _onPositivePayPressed},
      {'icon': Icons.book, 'label': 'Certificate', 'onPressed': _onCertificate},
      {'icon': Icons.summarize, 'label': 'Cardless Withdrawal', 'onPressed': _onCardlessWitdrawal},
      {'icon': Icons.cloud_queue_rounded, 'label': 'Service Request', 'onPressed': _onServiceRequestPressed},
    ];

    card = [
      {'icon': Icons.credit_card, 'label': 'Card Block', 'onPressed': _onCardBlockPressed},
      {'icon': Icons.lock_reset_rounded, 'label': 'Change Pin', 'onPressed': _onChangePinPressed},
      {'icon': Icons.bar_chart_sharp, 'label': 'Limit (TP)', 'onPressed': _onLimitPressed},
      {'icon': Icons.public_sharp, 'label': 'International Transfer', 'onPressed': _onInternationalPressed},
      {'icon': Icons.calculate_sharp, 'label': 'EMI', 'onPressed': _onEMIPressed},
      {'icon': Icons.calendar_month, 'label': 'Statement', 'onPressed': _onCardStatementPressed},
    ];

    other = [
      {'icon': Icons.circle_outlined, 'label': 'Find ATM', 'onPressed': _onFindATMPressed},
      {'icon': Icons.square_outlined, 'label': 'What\'s New', 'onPressed': _onNewPressed},
      {'icon': Icons.flag_circle_rounded, 'label': 'Find Branch', 'onPressed': _onBranchPressed},
      {'icon': Icons.phone_in_talk_outlined, 'label': 'Help & Support', 'onPressed': _onHelpPressed},
    ];
  }

  // Alert dialoge
  void showTransferModeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // don't close on outside tap
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TabPage(
                      svg: 'asset/icon/numbers-blocks-icon.svg',
                      label: 'Cash By Code',
                      Containercolor: Colors.green,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CardlessCashScreen()));
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TabPage(
                      svg: 'asset/icon/qr-code-icon.svg',
                      label: 'Cash By QR',
                      Containercolor: Colors.blue,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CardLessQRScanScreen()));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Cardless Withdrawal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
            final onPressed = item['onPressed'] as Function;
            onPressed();
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
                Text(item['label'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // Essentials Navigation handlers
  void _onSelfServicePressed() => print("Self Service tapped");
  void _onPriorityBankingPressed() => print("Priority Banking tapped");
  void _onPowerBankingPressed() => print("Power Banking tapped");
  void _onInfoUpdatePressed() => print("Info Update tapped");
  void _onLimitsPressed() => print("Limits tapped");
  void _onEPayPressed() => print("e-Pay tapped");

  // Accounts Navigation handlers
  void _onStatementPressed() => print("Statement tapped");
  void _onHistoryPressed() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const HistoryScreen()));
  }
  void _onPositivePayPressed() => print("Positive Pay tapped");
  void _onCertificate() => print("Passbook tapped");
  void _onCardlessWitdrawal() => showTransferModeDialog(context);
  void _onServiceRequestPressed() => print("Balance tapped");

  // Cards Navigation handlers
  void _onCardBlockPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CardBlockScreen()));
  }
  void _onChangePinPressed() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePINscreen()));
  }
  void _onLimitPressed() => print("Limit tapped");
  void _onInternationalPressed() => print("International tapped");
  void _onEMIPressed() => print("EMI tapped");
  void _onCardStatementPressed() => print("Statement tapped");

  // Other Navigation handlers
  void _onFindATMPressed() => print("Find ATM tapped");
  void _onNewPressed() => print("What's New tapped");
  void _onBranchPressed() => print("Find Branch tapped");
  void _onHelpPressed() => print("Help tapped");

  //alert dialoge model
  Widget TabPage({
    required String svg,
    required String label,
    required VoidCallback onTap,
    required Color Containercolor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Containercolor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svg,
              width: 40,
              height: 40,
              color: AppColors.appBarIcon,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





