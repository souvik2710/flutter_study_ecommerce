import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class CommonWidgetproductDesign extends StatefulWidget {
  final String imageLink;
  final String textValue;
  String sellPriceValue;
  String discountPriceValue;
  String discountValue;
  double ratingValue;

  CommonWidgetproductDesign({required this.imageLink,required this.textValue,required this.sellPriceValue,
    required this.discountPriceValue, required this.discountValue, required this.ratingValue});


  @override
  State<CommonWidgetproductDesign> createState() => _CommonWidgetproductDesignState();
}

class _CommonWidgetproductDesignState extends State<CommonWidgetproductDesign> {

  @override
  Widget build(BuildContext context) {
    return Container(child:
    Column(
        children: [
          Container(
            margin:  const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0) ,
           height: MediaQuery.of(context).size.height*0.5,
          width:MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:NetworkImage("${widget.imageLink}"),
              fit:BoxFit.fitHeight,
            ),
            //borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderRadius: BorderRadius.circular(20.0),
            ),),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${widget.textValue}",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
            ),
          ),
          Container(
            height: 40,
            //color:Colors.grey,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBar.builder(
                initialRating: widget.ratingValue,
                minRating: widget.ratingValue,
                maxRating: widget.ratingValue,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 20.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                  // ratingValue=rating;
                },
              ),
            ),
          ),

          Container(
            margin:  const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0) ,
            height: 50,
              width: MediaQuery.of(context).size.width,
              //color: Colors.green[300],
              child: Row(
                children:[
                  Text("${widget.sellPriceValue}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
                      color:Colors.grey),),
                  Text("${widget.discountPriceValue}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
                      color:Colors.black),),
                  Text("${widget.discountValue}",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,
                      color:Colors.green),),
                ]
              )),
                  Divider(
                    color:Colors.grey,
                    thickness: 3,
                  ),
                Container(
                  margin:  const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 5.0) ,
                  height: 100,

                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_shipping),
                          Text(" Free Delivery ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,
                               color:Colors.green)),
                        ],),
                      Row(
                        children: [
                          Icon(Icons.find_replace),
                          Text(" 10 Days replacement ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,
                              color:Colors.black)),
                        ],),
                      Row(
                        children: [
                          Icon(Icons.currency_rupee),
                          Text(" Cash on Delivery Available ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,
                              color:Colors.black)),
                        ],),
                    ],
                  ),
                )

             ]),


    );
  }
}

class ProductDetailsPage extends StatefulWidget {

  final String imageLink;
  final String textValue;
  String priceValue;
  ProductDetailsPage({required this.imageLink,required this.textValue,required this.priceValue});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50.0,
              width:MediaQuery.of(context).size.width*0.5,
              child: ElevatedButton(style:ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: (){},
                  child: Text('Add to Cart ',style: TextStyle(color: Colors.green[500],
                      fontSize: 20.0, fontWeight: FontWeight.bold),),),
            ),
            SizedBox(
              height: 50.0,
              width:MediaQuery.of(context).size.width*0.5,
              child: ElevatedButton(style:ElevatedButton.styleFrom(primary: Colors.red),onPressed: (){},
                child: Text('Buy Now',style: TextStyle(color: Colors.orange[200],
                    fontSize: 20.0, fontWeight: FontWeight.bold),),),
            ),

          ],
        ),

      body:SingleChildScrollView(
      child: SafeArea(
        child: CommonWidgetproductDesign(imageLink:"${widget.imageLink}",
            textValue:" ${widget.textValue} ", sellPriceValue:"MRP 15000/- ",
            discountPriceValue:"${widget.priceValue}",discountValue:" 20% off ", ratingValue: 3.5),
      ),
    ),
    );
  }
}
