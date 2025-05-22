import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_system/Utils/color.dart';

class FundTransfer extends StatelessWidget {
  const FundTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    height: 5,
                    width: 80,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text(
                  'Fund Transfer',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Select transfer options',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 24),

                // Card Options Grid
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _buildCardOption(
                      context,
                      icon: 'asset/icon/bank-transfer-icon.svg',
                      title: 'SCU',
                      subtitle: 'To SCU Account',
                      color: Colors.lightBlue.shade50,
                      icolor: AppColors.primary, 
                      onPressed: () {  },
                    ),
                    _buildCardOption(
                      context,
                      icon: 'asset/icon/global-bank-transfer-icon.svg',
                      title: 'Other Bank',
                      subtitle: 'To Other Bank Account',
                      color: Colors.lightBlue.shade50,
                      icolor: AppColors.primary, 
                      onPressed: () {  },
                    ),
                    _buildCardOption(
                      context,
                      icon: 'asset/icon/earn-icon.svg',
                      title: 'Foreign Transfer',
                      subtitle: 'Transfer to Foreign Banks',
                      color: Colors.green.shade50,
                      icolor: Colors.green, 
                      onPressed: () {  },
                    ),
                    _buildCardOption(
                      context,
                      icon: 'asset/icon/mobile-bank-transfer-icon.svg',
                      title: 'MFS',
                      subtitle: 'To MFS Accounts',
                      color: Colors.orange.shade50,
                      icolor: Colors.orange, 
                      onPressed: () {  },
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                _buildListTile(
                    icon: 'asset/icon/silhouette-male-user-icon.svg',
                    text: 'My Account Transfer', 
                    onPressed: () {  }),
                const SizedBox(height: 14),
                _buildListTile(
                    icon: 'asset/icon/personal-loan-icon.svg',
                    text: 'Beneficiary', 
                    onPressed: () {  }),
              ],
            ),
          ),
        );
      },
    );
  }

Widget _buildCardOption(
  BuildContext context, {
  required String icon,
  required String title,
  required String subtitle,
  required Color color,
  required Color icolor,
  required VoidCallback onPressed,
}) {
  final double cardWidth = (MediaQuery.of(context).size.width - 16 * 3) / 2;
  // screen width minus 3 spacings (left + middle + right), then divided by 2

  return GestureDetector(
    onTap: onPressed,
    child: SizedBox(
      width: cardWidth,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
        shadowColor: Colors.black12,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: const Offset(-4,4),
                blurRadius: 6
              )
            ]
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: color,
                child: SvgPicture.asset(
                  '$icon',
                  height: 25,
                  width: 25,
                  color: icolor,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  Widget _buildListTile({required String icon, required String text, required VoidCallback onPressed}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        tileColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: SvgPicture.asset(
            '$icon',
            height: 20,
            width: 20,
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onPressed,
      ),
    );
  }
}
