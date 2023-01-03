import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class SignInPage extends HookConsumerWidget {

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
                        padding: const EdgeInsets.only(top:100.0,left:20.0),
                        child: Text("Welcome \n Back!",
                          style:TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),
                        ),
                      )
                  ),
                  Positioned(
                    bottom: 0.0,
                    left:0.0,
                    child: Container(
                      height: 350,
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
                    padding: const EdgeInsets.only(top:480.0,left:20.0),
                    child: Text("Sign In" , style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28.0)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:530,left:0.0),
                    child: Column(
                        children: <Widget>[

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
                              obscureText: true,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: const Color(0xFF424242)),
                                ),
                                hintText: 'Enter Password',
                                  suffixIcon: IconButton(onPressed:(){

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
                                child: Text("Forget Password ?" , style:TextStyle(color:Colors.red,fontSize: 18.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: ElevatedButton(onPressed: (){},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)))
                                    ),
                                child: Text("Sing Up",style:TextStyle(fontWeight: FontWeight.bold))
                                ),
                              ),
                            ],
                          ),

                        ]  ),
                  ),


                  Positioned(
                    bottom: 320.0,
                    right:40.0,
                    child:   FloatingActionButton(
                      child: Icon(Icons.arrow_forward),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      onPressed: () => {},
                      ),


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
