
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
    );
  }
}

