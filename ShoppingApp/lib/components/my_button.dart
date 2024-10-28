import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  void Function()? onTap;
  final Widget child;

  MyButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(12)),
        child: child,
      ),
    );
  }
}
