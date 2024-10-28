// ignore: file_names
import "package:flutter/material.dart";
import "package:new_project/components/my_button.dart";

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  // ignore: non_constant_identifier_names
  get shopping_bag => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            //title
            const Text(
              "Minimal shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),
            //subtitle
            Text(
              "Premium Quailty Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
            //Button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward))
          ]),
        ));
  }

  // icon({required Icons, required int size, required Color color}) {}
}
