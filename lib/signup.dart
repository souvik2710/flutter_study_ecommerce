import 'package:ecommerce_app/bottomnavbar.dart';
import 'package:ecommerce_app/signin.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'front_page.dart';
class SignUpPage extends  HookConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ValueNotifier<bool> isHidden = useState(true);
    return Scaffold(
      body: SafeArea(
        child: Container(
         // color:Colors.greenAccent,
          //height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              children:[
                Container(
                  //color: Colors.red,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://img.freepik.com/premium-photo/small-toy-shopping-cart-red-background-top-view_132254-1840.jpg"),
                        fit:BoxFit.cover,
                      ),),
                  height:MediaQuery.of(context).size.height,
                  width:MediaQuery.of(context).size.width,
                  child:Padding(
                    padding: const EdgeInsets.only(top:100.0,left:20.0),
                    child: Text("Let's Start!",
                    style:TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),
                    ),
                  )
                ),
                Positioned(
               bottom: 0.0,
                left:0.0,
                child: Container(
                  height: 500,
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)
                    ),
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:320.0,left:20.0),
                  child: Text("Sign Up" , style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28.0)
                  ),
                ),
    Padding(
    padding: EdgeInsets.only(top:370,left:0.0),
    child: Column(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.all(15),
    child: TextField(
    decoration: InputDecoration(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFF424242)),
    ),
    hintText: 'Enter Your Name',
    ),
    ),
    ),
      Padding(
        padding: EdgeInsets.all(15),
        child: TextField(

            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFF424242)),
              ),
              hintText: 'Enter phone No.',
            ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: TextField(

            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFF424242)),
              ),
              hintText: 'Enter Email',
            ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: TextField(
          obscureText: isHidden.value,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFF424242)),
              ),
              hintText: 'Enter Password',
              suffixIcon: IconButton(onPressed:(){
                // if(isHidden.value==true) {
                //   isHidden.value = false;
                // }
                // else {
                //   isHidden.value = true;
                // }
                isHidden.value= !isHidden.value;
              },
                  icon:isHidden.value?Icon( Icons.visibility,color:Colors.grey):Icon( Icons.visibility_off,color:Colors.grey))
            ),

        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Text("Already have an account ?" , style:TextStyle(color:Colors.red,fontSize: 18.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)
              {
                return SignInPage();
              }));
            },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)))
                ),
                child: Text("Sing In",style:TextStyle(fontWeight: FontWeight.bold))
            ),
          ),
        ],
      ),


    ]  ),
    ),


    Positioned(
                  bottom: 470.0,
                  right:40.0,

                  child:   FloatingActionButton(
                        child: Icon(Icons.arrow_forward),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)
                      {
                      return BottomNav();
                      }))
                      },
                    ),
                  // CircleAvatar (
                  //   radius: 30.0,
                  //   backgroundColor: Colors.orange[600],
                  // ),
                ),
               // Text("->",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white))
              ]
            ),
          ),
        ),
      ),
    );
  }
}
