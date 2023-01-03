import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class CommonWidgetproductDesign extends StatefulWidget {
  final String imageLink;
  final String textValue;
  String priceValue;
  double ratingValue;

  CommonWidgetproductDesign({required this.imageLink,required this.textValue,required this.priceValue,
    required this.ratingValue});


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
            margin:  const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0) ,
           height: MediaQuery.of(context).size.height*0.5,
          width:MediaQuery.of(context).size.height*0.3,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:NetworkImage("${widget.imageLink}"),
              fit:BoxFit.fill,
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
            height: 100,
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
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                  // ratingValue=rating;
                },
              ),
            ),
          ),

          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.green[300],
              child: Padding(
                padding: const EdgeInsets.only(left:10.0,top:10.0),
                child: Text("${widget.priceValue}",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,
                    color:Colors.white),),
              )),


        ])

    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  bottomNavigationBar:ElevatedButton(),

    body:SingleChildScrollView(
      child: SafeArea(
        child: CommonWidgetproductDesign(imageLink:"https://cdn1.smartprix.com/rx-iEfM9LzwK-w1200-h1200/EfM9LzwK.jpg",
            textValue:" Realme C30 (Blue, 32 GB ) (2 GB RAM ) ( 5 MP Front Camera )", priceValue:"20% off ,15000/- ,Rs. 12000 /- ", ratingValue: 3.5),
      ),
    ),
    );
  }
}
