import 'package:flutter/material.dart';
class SignUpDemo extends StatelessWidget {
  const SignUpDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          //width: 300,
          //height: 300,
          child: Stack(

            children: [
              Container(
               // width: 300,
                height: 300,
                color: Colors.red,
              ), //Container
              Positioned(
                top: 80,
                left: 80,
                child: Container(
                  //width: 250,
                  height: 250,
                  color: Colors.black,
                ),
              ), //Container
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  height: 200,
                 // width: 200,
                  color: Colors.purple,
                ),
              ), //Container
            ], //<Widget>[]
          ), //Center
        ) //Center
    ) ;
  }
}

