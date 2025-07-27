import 'package:banking_system/Pages/dashboard.dart';
import 'package:banking_system/Utils/buttons.dart';
import 'package:banking_system/Utils/color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      "asset/image/circle avatar.png",
                      width: width/4,
                      height: height/4,
                    ),
                  ),
                  // Username Field
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.grey),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 20, // Set a proper height
                        child: VerticalDivider(
                          thickness: 1,
                          width: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Jane_Doe',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
              
                  Divider(),
              
                  // Password Field
                  Row(
                    children: [
                      Icon(Icons.lock, color: Colors.grey),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 20, // Set a proper height
                        child: VerticalDivider(
                          thickness: 1,
                          width: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '**********',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
              
                  SizedBox(height: 20),
              
                  // Login Button
                  CustomButton(
                    text: "Login", 
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                    },
                  ),
              
                  SizedBox(height: 30),
              
                  // Forgot Password Link
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot ID or Password?',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
              
                  SizedBox(height: 10),
              
                  // Sign Up Text
                  Text("New to Seychelles Credit Union App?"),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
              
                  SizedBox(height: 30),
              
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
              
                  SizedBox(height: 30),
              
                  // Fingerprint Icon
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.fingerprint, size: 40, color: AppColors.primary),
                  ),
              
                  SizedBox(height: 30),
              
                  // Version Text
                  Text(
                    'v 2.1.5.9',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
