import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
          child:
              Lottie.asset('assets/json/error.json', fit: BoxFit.scaleDown)),
    );
  }
}
