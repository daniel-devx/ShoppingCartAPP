import 'package:flutter/material.dart';
import 'package:new_project/components/my_ListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  get shopping_bag => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    //var home;
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            //drawer header: logo
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerHeader(
                    child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )),
                const SizedBox(height: 25),
                //shop title=
                MyLisTile(
                    text: "Shop",
                    icon: Icons.home,
                    onTap: () => Navigator.pop(context)),
                MyLisTile(
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/cart_page');
                    }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: MyLisTile(
                      text: "Exit",
                      icon: Icons.logout,
                      onTap: () => Navigator.pushAndRemoveUntil(context,
                          '/intro_page' as Route<Object?>, (route) => false)),
                )
                //cart tile

                //exit
              ],
            )
          ],
        ));
  }
}

mixin home {}
