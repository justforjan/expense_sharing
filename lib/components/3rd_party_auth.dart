import 'package:expense_sharing/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'square_tile.dart';

class ThirdPartyAuth extends StatelessWidget {
  ThirdPartyAuth({super.key});

  final _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareTile(
          imagePath: "lib/images/google.png",
          onTap: () => _authServices.signInWithGoogle(),
        ),
      ],
    );
  }
}
