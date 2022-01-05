import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessState extends StatelessWidget {
  const SuccessState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
          child:
              Lottie.asset('assets/json/success.json', fit: BoxFit.scaleDown)),
    );
  }
}
