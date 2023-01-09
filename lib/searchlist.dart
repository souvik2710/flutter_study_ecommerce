import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;
class SearchCommonwidget extends HookConsumerWidget {
  final String imageLink;
  final String textValue;
  SearchCommonwidget({required this.imageLink,required this.textValue});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Row(
              children:[
          Container(
          margin:  const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0) ,
          height:40,
          width:40,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:NetworkImage("${imageLink}"),
              fit:BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${textValue}",style:TextStyle(fontSize: 18.0,color:Colors.grey)),
              Text("in Bag Details",style:TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color:Colors.blue)),
            ],
          ),
                Padding(
                  padding: const EdgeInsets.only(left:200.0),
                  child: Transform.rotate(
                    angle: -math.pi / 4,
                    child: Icon(Icons.arrow_upward_sharp,color:Colors.grey),
                  ),
                )
          ]),

          Divider(
            color:Colors.grey[200],
            thickness: 3,
          ),        ],
      ),

    );
  }
}

class SearchListDesign  extends HookConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child:
            Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                    ),),
                  Divider(
                    color:Colors.grey[200],
                    thickness: 3,
                  ),
                  SearchCommonwidget(imageLink: "https://m.media-amazon.com/images/I/61iR9NMcKpL._UL1280_.jpg",
                      textValue:"Kids Bags"),
                  SearchCommonwidget(imageLink: "https://m.media-amazon.com/images/I/81yQY+q7mNL._SL1500_.jpg",
                      textValue:"Bags for men"),
                  SearchCommonwidget(imageLink: "https://m.media-amazon.com/images/I/61bLA0GA7jL._UL1500_.jpg",
                      textValue:"Bags for girls"),
                  SearchCommonwidget(imageLink: "https://m.media-amazon.com/images/I/61bLA0GA7jL._UL1500_.jpg",
                      textValue:"Bags for girls"),
                ])));
  }
}