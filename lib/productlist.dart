import 'package:ecommerce_app/productdetails.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/searchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonWidgetClass  extends HookConsumerWidget {

  final String imageLink;
  final String textValue;
  int priceValue;
  int discountPriceValue;
  int discountValue;
  double ratingValue;
  CommonWidgetClass({required this.imageLink,required this.textValue,required this.priceValue,
    required this.discountPriceValue,required this.discountValue, required this.ratingValue});

  @override

  Widget build(BuildContext context,WidgetRef ref) {
    return   Container(
      width: 150,
      height: 250,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
          onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ProductDetailsPage(imageLink: imageLink,
                textValue:textValue,priceValue: "${priceValue}");
                },),);
                },
      child: Container(
            margin:  const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0) ,
            height:150,
            width:150,
            decoration: BoxDecoration(
              image:DecorationImage(
                image:NetworkImage("${imageLink}"),
                fit:BoxFit.fill,
              ),
              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderRadius: BorderRadius.circular(20.0),
            ),)),
          Text("${textValue}",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
          RatingBar.builder(
            initialRating: ratingValue,
            minRating: ratingValue,
            maxRating: ratingValue,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: 20.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              //print(rating);
              // ratingValue=rating;
            },
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,

            children: [
              Text("${priceValue}",style:TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color:Colors.grey)),
              Text("${discountPriceValue}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
                  color:Colors.black),),
              Text("${discountValue} %off",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
                  color:Colors.green),),

            ],
          ),
        ],
      ),
    );
  }
}

class productListDesign  extends StatefulWidget {
  final String imageLink;
  final String textValue;
  productListDesign({required this.imageLink,required this.textValue});

  @override
  State<productListDesign> createState() => _productListDesignState();
}

class _productListDesignState extends State<productListDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:
          Column(
            children: [
              Row(
                children: [
             Expanded(child:TextField(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context){
                           return SearchListDesign();
                         },),);
                       },
                  onChanged: (String str){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){
                   return SearchListDesign();
                 },),);
               },
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.search),
                       hintText: 'Search',
                     ),),
                    flex:6,
                  ),
                  Expanded(child: Icon(Icons.shopping_cart),
                  flex:2,
                  ),

                ],
              ),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ),
              Expanded(child:
              Container(
              // height: MediaQuery.of(context).size.height*0.8,

              //  color:Colors.pinkAccent[100],

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 1", priceValue: 1230, discountPriceValue:1200,
                            discountValue:20,ratingValue: 3.0),

                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 2", priceValue: 2500,  discountPriceValue:2200,
                            discountValue:30,ratingValue: 4.5),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 3", priceValue: 153,  discountPriceValue:120,
                            discountValue:2,ratingValue: 3.0),

                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 4", priceValue: 3999, discountPriceValue:1399,
                            discountValue:64, ratingValue: 4.5),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 5", priceValue: 1530,  discountPriceValue:1200,
                            discountValue:15,ratingValue: 3.0),

                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 6", priceValue: 3599, ratingValue: 4.5, discountPriceValue:3200,
                          discountValue:45,),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                            textValue: "${widget.textValue} 7", priceValue: 1830,  discountPriceValue:1200,
                            discountValue:25,ratingValue: 4.0),

                        CommonWidgetClass(imageLink:"${widget.imageLink}",
                          textValue: "${widget.textValue} 8", priceValue: 3599, ratingValue: 4.5, discountPriceValue:1200,
                          discountValue:65),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              ),

            ],),
        ),

    );
  }
}