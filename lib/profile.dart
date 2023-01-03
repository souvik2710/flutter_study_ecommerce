import 'package:ecommerce_app/bottomnavbar.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class ProfilePage extends HookConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ValueNotifier<bool> isHidden = useState(true);

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // color:Colors.greenAccent,
          //height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
                children:[
                  Container(
                    //color: Colors.red,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://img.freepik.com/premium-photo/top-view-toy-shopping-cart-with-boxes-gift-red-background-copy-space-text-design_339191-203.jpg"),
                          fit:BoxFit.fill,
                        ),),
                      height:MediaQuery.of(context).size.height,
                      width:MediaQuery.of(context).size.width,
                      child:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("Account",
                            style:TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                  ),

                  Positioned(
                    bottom: 0.0,
                    left:0.0,
                    child: Container(
                      height: 600,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color:Colors.white,
                      ),
                    ),
                  ),

                  Positioned(
                    top:100.0,
                    left:20.0,
                    right:20.0,
                    child: Container(
                      height: 170,
                      width:300,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          boxShadow: [BoxShadow(
                            color:Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(5,5),
                          ),
                            BoxShadow(
                              color:Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(-5,-5),
                            )
                          ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:110.0,left:330.0),
                    child: Icon(Icons.edit,color: Colors.grey,)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:170.0,left:100.0),
                    child: Text("FirstName LastName" , style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:220.0,left:100.0),
                    child: Text("abcxyz@gmail.com" , style:TextStyle(color:Colors.grey,
                        fontWeight: FontWeight.bold,fontSize: 15.0)
                    ),
                  ),

                  Positioned(
                    top: 50.0,
                    left:150.0,
                    child: Container(
                        height: 100,
                        width:100,
                        decoration: BoxDecoration(
                      image: DecorationImage(
                      image:NetworkImage("https://previews.123rf.com/images/get4net/get4net1802/get4net180200635/94675570-female-user-profile-isolated-on-blue-circular-background-.jpg"),
                        ),
                      shape: BoxShape.circle,
                  ),
                    )
                    ),
                  Positioned(
                    top:300.0,
                    left:20.0,
                    right:20.0,
                    child: Container(
                      height: 400,
                      width:300,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          boxShadow: [BoxShadow(
                            color:Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(5,5),
                          ),
                            BoxShadow(
                              color:Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(-5,-5),
                            )
                          ]
                      ),
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.only(top:300.0,left:20.0,right:20.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("My Order ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:15.0 )),
                              Icon(Icons.shopping_cart),
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("My Favorite ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:15.0)),
                              Icon(Icons.favorite),
                      ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping Address ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:15.0)),
                              Icon(Icons.location_on),
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Log Out ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:15.0)),
                              Icon(Icons.logout),
                            ],),
                        ),
                    ]),
                  ),
                ]
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   type: BottomNavigationBarType.fixed, //only if the type is fixed,then background color is fixed
      //   unselectedItemColor: Colors.grey[700],
      //   selectedItemColor: Colors.black,
      //   unselectedLabelStyle: TextStyle(color:Colors.black),
      //   showUnselectedLabels: true, // to show label with icon
      //   items:<BottomNavigationBarItem> [
      //     BottomNavigationBarItem(icon: Icon(Icons.home,color:Colors.grey),
      //       label:"home",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.search,color:Colors.grey),
      //         label:"search"
      //     ),
      //
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color:Colors.grey),
      //         label:"cart"
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.account_circle,color:Colors.red),
      //         label:"user"
      //     ),
      //
      //   ],
      // ),
    );
  }
}
