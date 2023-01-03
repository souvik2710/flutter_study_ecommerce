import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNav extends HookConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ValueNotifier<int> ourSelectedIndex=useState(0);
    List<Widget> listBottomNavBar=[HomePageDesign(),Container(),Container(),ProfilePage()];
    return Scaffold(
      body:listBottomNavBar[ourSelectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ourSelectedIndex.value,
        onTap:(int i) {
            ourSelectedIndex.value=i;
        } ,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, //only if the type is fixed,then background color is fixed
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.black,
        showUnselectedLabels: true, // to show label with icon
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home,color:Colors.grey),

            label:"home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search,color:Colors.grey),
              //backgroundColor: Colors.black12,
              label:"search"
          ),

          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color:Colors.grey),
              //backgroundColor: Colors.black12,
              label:"cart"
          ),

          BottomNavigationBarItem(icon: Icon(Icons.account_circle,color:Colors.red),
              //backgroundColor: Colors.black12,
              label:"user"
          ),

        ],
      ),
    );
  }
}
