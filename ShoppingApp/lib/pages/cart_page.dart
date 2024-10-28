import 'package:flutter/material.dart';
import 'package:new_project/components/my_button.dart';
import 'package:new_project/models/product.dart';
import 'package:new_project/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box to ask user to confirm to remove from cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Remove this item from your cart"),
              actions: [
                //cancel button
                MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                //yesbutton
                MaterialButton(
                    onPressed: () => {
                          Navigator.pop(context),
                          context.read<Shop>().addToCart(product)
                        },
                    child: const Text("Yes"))
              ],
            ));
  }

  //user pressed the pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  "User wants to pay: Conect this app to your Payment Backend "),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual item in cart
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        );
                        //return as a cart title Ui
                      })),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text('PAY NOW')),
          )
        ],
      ),
    );
  }
}
