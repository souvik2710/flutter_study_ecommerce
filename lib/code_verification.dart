import 'package:ecommerce_app/otp_segment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CodeVerifyPage extends  HookConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    TextEditingController  OTPvar= useTextEditingController();

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
                      child:
                      Align(
                        alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:50.0,left:20.0),
                            child: Icon(Icons.arrow_back,color:Colors.white,size: 40.0,),
                          )),
                      //Text(" <- ", style:TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),)
                  ),
                  Positioned(
                    bottom: 0.0,
                    left:0.0,
                    child: Container(
                      height: 600,
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
        padding: EdgeInsets.only(top:250.0,left:20.0,right:20.0),
        child: Column(
            children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:0.0),
                     child: Text("Code Verification" , style:TextStyle(fontSize: 30.0)
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Enter verification Code here"),
                  ),
                  OTPSendView(textEditingController:OTPvar),
              ])
      ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
