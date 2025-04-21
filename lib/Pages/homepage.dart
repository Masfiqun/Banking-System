import 'package:banking_system/Pages/cardPayment.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
  Widget _buildDrawerItem(BuildContext context, {
    required IconData icon, 
    required String text, 
    required VoidCallback onTap, 
    IconData?  icon2,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color,),
                    const SizedBox(width: 15),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color
                      ),
                    ),
                  ],
                ),
                Icon(icon2),
              ],
            ),
            Divider()
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

                      ),
                      _buildDrawerItem(
                        context, 
                        icon: Icons.menu_book_outlined, 
                        text: 'Info Update', 
                        onTap: (){},
                        icon2: Icons.arrow_forward_ios_rounded
                      ),
                      _buildDrawerItem(
                        context, 
                        icon: Icons.qr_code_scanner_rounded, 
                        text: 'My QR', 
                        onTap: (){},
                        icon2: Icons.arrow_forward_ios_rounded
                      ),
                      _buildDrawerItem(
                        context, 
                        icon: Icons.logout, 
                        text: 'Log Out', 
                        onTap: (){},
                        color: Colors.red,
                      )
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
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Account())),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Account", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("175******4050", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
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




class Account extends StatelessWidget {
  const Account({super.key});

  Widget _buildListTile({required IconData icon, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: const Offset(-4, 4), blurRadius: 6)
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          centerTitle: true,
          elevation: 0,
          leading: const BackButton(color: Colors.white),
          title: const Text('Account', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Info Card
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(blurRadius: 4, color: Colors.black12)
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 24, backgroundColor: Colors.grey.shade200),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Jane Doe",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("Savings Account\n173000000000012",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text("Active",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
              ),

              // Balance Box
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Stack(
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Text(
                              'USD',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("1503259.34",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ],
                ),
              ),

              // Summary Header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Summary",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Dec 13, 2004", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              // Tab Bar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(text: 'This Week'),
                    Tab(text: 'This Month'),
                    Tab(text: 'This Year'),
                  ],
                ),
              ),

              // Chart View with fixed height
              SizedBox(
                height: 300,
                child: TabBarView(
                  children: [
                    _buildChartTab(),
                    Center(child: Text('This Month Chart')),
                    Center(child: Text('This Year Chart')),
                  ],
                ),
              ),

              // History and Statement Tiles
              const SizedBox(height: 12),
              _buildListTile(icon: Icons.history, text: 'History'),
              _buildListTile(icon: Icons.difference_rounded, text: 'Statement'),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildChartTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BarChart(
        BarChartData(
          barGroups: [
            makeGroup(0, 3, 1),
            makeGroup(1, 2, 1.5),
            makeGroup(2, 2.5, 1.2),
            makeGroup(3, 3.5, 2),
            makeGroup(4, 3, 2.5),
            makeGroup(5, 2, 3),
            makeGroup(6, 3, 2.8),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      days[value.toInt()],
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles:
                  SideTitles(showTitles: true, interval: 1, reservedSize: 28),
            ),
          ),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  static BarChartGroupData makeGroup(int x, double left, double right) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: left, color: Colors.teal, width: 8),
        BarChartRodData(toY: right, color: Colors.orange, width: 8),
      ],
      barsSpace: 4,
    );
  }
}
