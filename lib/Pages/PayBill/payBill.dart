import 'package:banking_system/Pages/PayBill/Electricity.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';

class PayBill extends StatelessWidget {
  const PayBill({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
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
                const Text(
                  'Bill Payment',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pay your bills',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 24),
          
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search biller',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
          
                // Recent & Saved Billers
                Row(
                  children: const [
                    OptionCard(icon: Icons.access_time, label: "Recent\nPayment"),
                    SizedBox(width: 12),
                    OptionCard(icon: Icons.save_alt, label: "Saved\nBillers"),
                  ],
                ),
                const SizedBox(height: 24),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 20,
                    spacing: 0,
                    children: [
                      ActionButton(
                        icon: Icons.flash_on, 
                        label: "Electricity", 
                        onPressed: () {
                          showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent, 
                                builder: (context) => const electricity()
                              );
                        }
                      ),
                      ActionButton(icon: Icons.opacity, label: "Water", onPressed: () {
                        
                      }),
                      ActionButton(icon: Icons.phone, label: "Telephone", onPressed: () {

                      }),
                      ActionButton(icon: Icons.public, label: "Internet", onPressed: () {}),
                      ActionButton(icon: Icons.tv, label: "TV", onPressed: () {}),
                      ActionButton(icon: Icons.school, label: "Tuition Fee", onPressed: () {}),
                      ActionButton(icon: Icons.description, label: "Visa Fee", onPressed: () {})
                    ],
                  ),
                ),
          
                SizedBox(height: 30,),
          
                // Payment History Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long, color: Colors.black),
                    title: const Text(
                      "Payment History",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to payment history
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


class OptionCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const OptionCard({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
