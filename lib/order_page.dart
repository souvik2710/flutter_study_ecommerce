import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommonWidgetOrderDesign  extends StatefulWidget {
  final String imageLink;
  final String textValue;
  String priceValue;


  CommonWidgetOrderDesign({required this.imageLink,required this.textValue,required this.priceValue});

  @override
  State<CommonWidgetOrderDesign> createState() => _CommonWidgetOrderDesignState();
}

class _CommonWidgetOrderDesignState extends State<CommonWidgetOrderDesign> {
  double ratingValue=0.0;
  @override
  Widget build(BuildContext context) {
    return Container(child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin:  const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0) ,
          height:100,
          width:100,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:NetworkImage("${widget.imageLink}"),
              fit:BoxFit.cover,
            ),
            //borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderRadius: BorderRadius.circular(20.0),
          ),),
        Column(
          children: [
            Text("${widget.textValue}",style:TextStyle(fontSize: 12.0)),
            RatingBar.builder(
              initialRating: ratingValue,
              minRating: ratingValue,
              maxRating: ratingValue,
              direction: Axis.horizontal,
              allowHalfRating: true,
              //ignoreGestures: true,
              itemCount: 5,
              itemSize: 20.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                //print(rating);
                ratingValue=rating;
              },
            ),
          ],
        ),
        Text("${widget.priceValue}"),

      ],
    )

    );
    
  }
}

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),

                      hintText: 'Search',
                  ),

                ),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ),
              CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ),
              CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "130000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ),
              CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "150000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ),
              CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ), CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ), CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ), CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ), CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ), CommonWidgetOrderDesign(imageLink: "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg",
                  textValue: "Delivered on 12 th Nov \n Mobile Phone ", priceValue: "120000"),
              Divider(
                color:Colors.grey[200],
                thickness: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

