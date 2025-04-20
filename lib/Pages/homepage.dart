import 'package:banking_system/Pages/cardPayment.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  // Drawer Item Widget
  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String text, required VoidCallback onTap, required IconData  icon2}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(icon2),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, 
        drawer: Drawer(
          // drawer content here
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    'SCU Mobile\nBanking',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey.shade300,
                        child: CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'JANE DOE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        'User ID: 338 5558',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey.shade400
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _buildDrawerItem(
                              context, 
                              icon: Icons.person, 
                              text: 'My Profile', 
                              onTap: (){}, 
                              icon2: Icons.arrow_forward_ios_rounded
                            ),
                            _buildDrawerItem(
                              context, 
                              icon: Icons.settings_outlined, 
                              text: 'App Settings', 
                              onTap: (){}, 
                              icon2: Icons.arrow_forward_ios_rounded
                            ),
                            _buildDrawerItem(
                              context, 
                              icon: Icons.auto_fix_high_outlined, 
                              text: 'Themes', 
                              onTap: (){}, 
                              icon2: Icons.arrow_forward_ios_rounded
                            ),
                            _buildDrawerItem(
                              context, 
                              icon: Icons.dark_mode_outlined, 
                              text: 'Dark Mode', 
                              onTap: (){}, 
                              icon2: Icons.arrow_forward_ios_rounded
                            ),
                          ],
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue.shade800,
            expandedHeight: 120,
            pinned: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue.shade700,
                        radius: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Good Afternoon', style: TextStyle(color: Colors.white)),
                        GestureDetector(
                          onTap: (){
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Text(
                            'JANE DOE', 
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      ActionButton(icon: Icons.send, label: "Fund Transfer", onPressed: () {}),
                      ActionButton(icon: Icons.receipt_long_rounded, label: "Pay Bill", onPressed: () {}),
                      ActionButton(icon: Icons.credit_card, label: "Card Payment", onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CardPayment()));
                      }),
                      ActionButton(icon: Icons.add, label: "Add Money", onPressed: () {}),
                      ActionButton(icon: Icons.phone_android, label: "Recharge", onPressed: () {}),
                      ActionButton(icon: Icons.more_horiz, label: "More", onPressed: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
      
                BankingCard(
                  image: 'asset/image/land.jpeg',
                  onPressed: () {},
                  description: 'Say Goodbye to OTP Hassales & Enjoy Instant Tr...', 
                  title: 'My Banking',
                ),
      
                BankingCard(
                  image: 'asset/image/lake.jpeg', 
                  onPressed: (){}, 
                  title: 'Benefits', 
                  description: 'Explore our specially curated offers exclusively taillored for SCU customers'
                ),
      
                BankingCard(
                  image: 'asset/image/flower.jpeg', 
                  onPressed: (){}, 
                  title: 'Products', 
                  description: 'Now apply for SCU Amazon Co-brand prepaid card with ease'
                ),
      
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
      ),
    );
  }
}
