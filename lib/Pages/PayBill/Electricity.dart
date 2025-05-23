import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// CategoryIcon widget
class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Icon(icon, size: 30, color: AppColors.appBarIcon),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }
}

// BillerTile widget
class BillerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  const BillerTile({super.key, required this.title, required this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
      onTap: onPressed,
    );
  }
}

// Main electricity widget
class electricity extends StatelessWidget {
  const electricity({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.75,
      minChildSize: 0.4,
      expand: false,
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
                // Drag handler
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

                // Category icons carousel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              CategoryIcon(icon: Icons.flash_on, label: 'Electricity'),
                              SizedBox(width: 16),
                              CategoryIcon(icon: Icons.opacity, label: 'Water'),
                              SizedBox(width: 16),
                              CategoryIcon(icon: Icons.phone, label: 'Telephone'),
                              SizedBox(width: 16,),
                              CategoryIcon(icon: Icons.public, label: 'Internet')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Biller list
                 BillerTile(title: "DPDC - Postpaid", subtitle: "Electricity", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ElectricityBillPage()));
                 },),
                const Divider(),
                 BillerTile(title: "DPDC - Prepaid", subtitle: "Electricity", onPressed: () {  },),
                const Divider(),
                 BillerTile(title: "DESCO - Prepaid", subtitle: "Electricity", onPressed: () {  },),
                const Divider(),
                 BillerTile(title: "DESCO - Postpaid", subtitle: "Electricity", onPressed: () {  },),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}



class ElectricityBillPage extends StatefulWidget {
  const ElectricityBillPage({Key? key}) : super(key: key);

  @override
  State<ElectricityBillPage> createState() => _ElectricityBillPageState();
}

class _ElectricityBillPageState extends State<ElectricityBillPage> {
  final TextEditingController accountController =
      TextEditingController(text: "Acc. 17250000000");
  final TextEditingController customerNoController =
      TextEditingController(text: "135215004");
  final TextEditingController billPeriodController =
      TextEditingController(text: "Jan 2004");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Electricity",
            style: GoogleFonts.poppins(color: AppColors.appBarIcon)),
        iconTheme: IconThemeData(color: AppColors.appBarIcon),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text("DPDC - Postpaid",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("Electricity",
                      style: GoogleFonts.poppins(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text("Pay From",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildInputField(
              controller: accountController,
              icon: Icons.account_balance,
              hintText: "Acc. 17250000000",
            ),
            const SizedBox(height: 20),
            Text("DPDC Customer No.",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildInputField(
              controller: customerNoController,
              hintText: "Enter Customer No.",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text("Bill Period",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildInputField(
              controller: billPeriodController,
              icon: Icons.calendar_today,
              hintText: "Select Bill Period",
              onTap: () async {
                // Example date picker
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  final formatted =
                      "${_monthName(selectedDate.month)} ${selectedDate.year}";
                  setState(() {
                    billPeriodController.text = formatted;
                  });
                }
              },
              readOnly: true,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(Icons.play_circle_fill, color: Colors.teal),
                  const SizedBox(width: 6),
                  Text("View Tutorial",
                      style: GoogleFonts.poppins(
                          color: Colors.teal, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF014481),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // Submit action
                },
                child: Text("Next",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    IconData? icon,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon:
            icon != null ? Icon(icon, size: 20, color: Colors.blue) : null,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 14),
    );
  }

  String _monthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month];
  }
}


