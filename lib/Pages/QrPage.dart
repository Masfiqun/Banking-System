import 'package:banking_system/Utils/buttons.dart';
import 'package:flutter/material.dart';

class QRPayPage extends StatelessWidget {
  final ScrollController? scrollController;
  const QRPayPage({this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            const Divider(
              indent: 100,
              endIndent: 100,
              thickness: 3,
            ),
            const SizedBox(height: 10,),
            CircleAvatar(
              backgroundColor: Colors.blueGrey.shade50,
              radius: 50,
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: 70,  
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "QR Payment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text(
                    'Why carry cash when you can just scan and pay? Seychelles Credit Union QR supports both Bangla QR and mVisa QR. Bangla QR facilitates payment through VISA Mastercard, UnionPay and Diners Club International payment schemes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('asset/image/mastercard.png', width: 70, height: 50,),
                        Image.asset('asset/image/visa.png', width: 70, height: 50,)
                      ],
                    ),
                  ),
                  CustomButton(
                    text: 'Continue', 
                    onPressed: (){}
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}