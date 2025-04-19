import 'package:banking_system/Utils/buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _cardAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _cardAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blue.shade800,
          expandedHeight: 140,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 60),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade700,
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Good Afternoon', style: TextStyle(color: Colors.white)),
                      Text('JANE DOE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("175******4050", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.attach_money, color: Colors.white)
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.account_balance, color: Colors.blue)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    ActionButton(icon: Icons.send, label: "Fund Transfer", onPressed: () {}),
                    ActionButton(icon: Icons.receipt_long_rounded, label: "Pay Bill", onPressed: () {}),
                    ActionButton(icon: Icons.credit_card, label: "Card Payment", onPressed: () {}),
                    ActionButton(icon: Icons.add, label: "Add Money", onPressed: () {}),
                    ActionButton(icon: Icons.phone_android, label: "Recharge", onPressed: () {}),
                    ActionButton(icon: Icons.more_horiz, label: "More", onPressed: () {}),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SlideTransition(
                  position: _cardAnimation,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Colors.indigo, Colors.blueAccent]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Prepaid Card", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 10),
                        Text("4000 40** **** 4050", style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 2)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("JANE DOE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text("12/26", style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }
}
