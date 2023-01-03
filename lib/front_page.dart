import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommonWidgetClass  extends StatefulWidget {

  final String imageLink;
  final String textValue;
  int priceValue;
  int qtyValue;
  double ratingValue;
  CommonWidgetClass({required this.imageLink,required this.textValue,required this.priceValue,
    required this.qtyValue, required this.ratingValue});

  @override
  State<CommonWidgetClass> createState() => _CommonWidgetClassState();
}

class _CommonWidgetClassState extends State<CommonWidgetClass> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 150,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:  const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0) ,
            height:150,
            width:150,
            decoration: BoxDecoration(
              image:DecorationImage(
                image:NetworkImage("${widget.imageLink}"),
                fit:BoxFit.fill,
              ),
              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderRadius: BorderRadius.circular(20.0),
            ),),
          Text("${widget.textValue}",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
          RatingBar.builder(
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
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,

            children: [
              Text("${widget.priceValue}",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
              Text("qty :${widget.qtyValue}",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),

              InkWell(
                onTap: (){
                  setState(() {
                    widget.qtyValue++;
                  });

                },
                child: Container(
                  height: 30,
                  width:30,
                  color:Colors.yellowAccent[700],
                  child:
                  Center(child: Text("+",style:TextStyle(color:Colors.black))),
                ),
              )


            ],
          ),
        ],
      ),
    );
  }
}

class frontpageDesign  extends StatefulWidget {
  const frontpageDesign({Key? key}) : super(key: key);

  @override
  State<frontpageDesign> createState() => _frontpageDesignState();
}

class _frontpageDesignState extends State<frontpageDesign> {
  List <String> buttondata=["All","Veg","Non-veg","South Indian","Moghlai","Chinese"];
  int selectedIndex=-1;
  int ourSelectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:
          Column(
            children: [
              Container(
                height: 50,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:buttondata.length,
                    itemBuilder: (context,index)
                    {
                      return Row(
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          }, child: Text('${buttondata[index]}',style:
                          TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                            style:ElevatedButton.styleFrom(primary: selectedIndex==index?Colors.yellow[700]:Colors.grey[100],

                            ),

                          ),
                          SizedBox(width: 10,)
                        ],
                      );
                    }
                ),),

              Expanded(child:
              Container(
                // height: MediaQuery.of(context).size.height*0.8,

                //  color:Colors.pinkAccent[100],

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonWidgetClass(imageLink: "https://cdn.pixabay.com/photo/2017/05/08/13/15/bird-2295431__340.jpg",
                              textValue: "Food & more", priceValue: 123, qtyValue:1,ratingValue: 3.0),

                          CommonWidgetClass(imageLink: "https://image.shutterstock.com/image-photo/beach-oceanfront-260nw-422059351.jpg",
                              textValue: "Food & more", priceValue: 250, qtyValue:1,ratingValue: 4.5),

                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonWidgetClass(imageLink: "https://cdn.pixabay.com/photo/2017/05/08/13/15/bird-2295431__340.jpg",
                              textValue: "Food & more", priceValue: 153, qtyValue:1,ratingValue: 3.0),

                          CommonWidgetClass(imageLink: "https://image.shutterstock.com/image-photo/beach-oceanfront-260nw-422059351.jpg",
                              textValue: "Food & more", priceValue: 350, ratingValue: 4.5,qtyValue:1),

                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonWidgetClass(imageLink: "https://cdn.pixabay.com/photo/2017/05/08/13/15/bird-2295431__340.jpg",
                              textValue: "Food & more", priceValue: 153, qtyValue:1,ratingValue: 3.0),

                          CommonWidgetClass(imageLink: "https://image.shutterstock.com/image-photo/beach-oceanfront-260nw-422059351.jpg",
                              textValue: "Food & more", priceValue: 350, ratingValue: 4.5,qtyValue:1),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
              ),

            ],),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: 2,
          onTap:(int i) {
            if (i == 2) {
              setState(() {
                ourSelectedIndex = i;
                showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    backgroundColor: const Color(0xffFCF5EC),
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.only(left:10.0,top:15.0,right:10.0,bottom: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius
                              .circular(25.0)),
                          color: Colors.white,
                        ),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.5,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width:100,height: 5,
                                  child: Container(
                                    color: Colors.grey,
                                  ),)

                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Your Order",
                                  style: TextStyle(color: Colors.black,fontSize: 18.0,
                                      fontWeight: FontWeight.bold),),
                                Icon(Icons.delete,
                                    color:Colors.grey)
                              ],
                            ),
                            Row(
                              children: [
                                // SizedBox(
                                //   width:MediaQuery.of(context).size.width*0.9,
                                //   height: 2,
                                //   child: Container(
                                //     color: Colors.grey[200],
                                //   ),)
                                Expanded(
                                  child: Container(
                                    //width:MediaQuery.of(context).size.width*0.9,
                                    height: 2,
                                    color: Colors.grey[200],
                                  ),
                                )
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Chiken Burger\n 250gm",
                                  style: TextStyle(color: Colors.black,fontSize: 16.0,
                                      fontWeight: FontWeight.bold),),
                                Text("Rs. 149/-",
                                  style: TextStyle(color: Colors.black,fontSize: 16.0),),

                              ],
                            ),
                            Divider(
                              color:Colors.grey[200],
                              thickness: 3,
                              //height: 5,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("chicken Salad \n350gm",
                                  style: TextStyle(color: Colors.black,fontSize: 16.0,
                                      fontWeight: FontWeight.bold),),
                                Text("Rs. 260/-",
                                  style: TextStyle(color: Colors.black,fontSize: 16.0),),
                              ],
                            ),
                            SizedBox(
                              //width:MediaQuery.of(context).size.width*0.9,
                              height: 3,
                              child: Container(
                                color: Colors.grey[200],
                              ),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Total Order",
                                  style: TextStyle(color: Colors.grey,fontSize: 16.0),),
                                Text("Rs. 409/-",
                                  style: TextStyle(color: Colors.black,fontSize: 18.0,
                                      fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:200,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(AppRoutes.cartDesign);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffFFCC00),
                                      shape: StadiumBorder(),

                                    ), child: Text("Add to Cart ",
                                      style: TextStyle(color:Colors.black,)),

                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }

              );
            }
          } ,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed, //only if the type is fixed,then background color is fixed
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.black,
          showUnselectedLabels: true, // to show label with icon
          items:<BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home),
              //backgroundColor: Colors.red[200],
              label:"home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),
                //backgroundColor: Colors.black12,
                label:"user"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.notification_important),
                //backgroundColor: Colors.black12,
                label:"notification"
            ),

            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
                //backgroundColor: Colors.black12,
                label:"cart"
            ),

          ],
        )
    );
  }
}
// SizedBox(
//   width:20,
//   child: ElevatedButton(onPressed: (){},
//       child:
//       Text("+",
//           style:TextStyle(color:Colors.black,
//               backgroundColor: Colors.yellow[700],
//           ))),
// )
