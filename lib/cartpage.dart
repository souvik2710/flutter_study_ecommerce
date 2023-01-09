import 'package:ecommerce_app/productdetails.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final StateProvider<int> isTotalStateProvider = StateProvider<int>((ref) => 0);
class CommonWidgetDesign  extends HookConsumerWidget {
  final String imageLink;
  final String textValue;
  int priceValue;
  int qtyValue;
  //Function() buttonOnTap;
  CommonWidgetDesign({required this.imageLink,required this.textValue,required this.priceValue,
    required this.qtyValue});
   // int total_sub_price=0;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(isTotalStateProvider.state).state+=priceValue;
      });
      return () {
      };
    }, []);
    final ValueNotifier<int> totalSubPrice = useState(0);
    final ValueNotifier<int> quantityValueNotifier = useState(qtyValue);
    final ValueNotifier<bool> isHit = useState(true);
    if (isHit.value){
      totalSubPrice.value=priceValue*quantityValueNotifier.value;
      //ref.read(isTotalStateProvider.state).state+=priceValue;
      isHit.value=false;
    }
    final ValueNotifier<bool> isDisplay = useState(true);


    return Visibility(
      visible:isDisplay.value==true,
      child: Container(child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
          onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ProductDetailsPage(imageLink: imageLink,
                  textValue:textValue,priceValue: "${priceValue}");
                  },),);
                },
          child:Container(
            margin:  const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0) ,
            height:100,
            width:100,
            decoration: BoxDecoration(
              image:DecorationImage(
                image:NetworkImage("${imageLink}"),
                fit:BoxFit.cover,
              ),
              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderRadius: BorderRadius.circular(20.0),
            ),),),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${textValue}",style:TextStyle(fontSize: 12.0)),
              SizedBox(height: 15.0,),
              Row(
                children: [
                InkWell(
                onTap: (){

                  if(quantityValueNotifier.value!=1){
                    quantityValueNotifier.value--;
                    totalSubPrice.value=priceValue*quantityValueNotifier.value;
                    ref.read(isTotalStateProvider.state).state-=priceValue;
                  }
                  else
                    {
                      quantityValueNotifier.value=1;

                    }



                },child:Container(
                    height: 30,
                    width:30,
                    color:Colors.grey[200],
                    child:
                    Center(child: Text("-",style:TextStyle(color:Colors.black))),

                  ),),
                  Container(
                    height: 30,
                    width:30,
                    color:Colors.grey[200],
                    child:
                    Center(child: Text("${quantityValueNotifier.value}",style:TextStyle(color:Colors.black))),

                  ),
                      InkWell(
                      onTap: (){
                        quantityValueNotifier.value++;
                     // ref.read(isTotalStateProvider.state).state=priceValue*quantityValueNotifier.value;
                        ref.read(isTotalStateProvider.state).state+=priceValue;
                      totalSubPrice.value=priceValue*quantityValueNotifier.value;
                      },

                  child:Container(
                    height: 30,
                    width:30,
                    color:Colors.grey[200],
                    child:
                    Center(child: Text("+",style:TextStyle(color:Colors.black))),

                  ),),
                ],
              ),

            ],
          ),

          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${totalSubPrice.value}"),
              SizedBox(height: 15.0,),
              InkWell(
                onTap: (){
                  isDisplay.value=false;
                  ref.read(isTotalStateProvider.state).state-=totalSubPrice.value;
                },

              child:Container(
                height: 30,
                width:30,
                color:Colors.yellowAccent[700],
                child:
                Center(child: Text("x",style:TextStyle(color:Colors.black))),
              ),),
            ],
          ),
        ],
      )
      ),
    );
  }
}

class CartPage extends HookConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
        bottomNavigationBar:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            SizedBox(
              height: 50.0,
              width:MediaQuery.of(context).size.width,
              child: ElevatedButton(style:ElevatedButton.styleFrom(primary: Colors.red),onPressed: (){},
                child: Text('Buy Now',style: TextStyle(color: Colors.orange[200],
                    fontSize: 20.0, fontWeight: FontWeight.bold),),),
            ),

          ],
        ),

        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ElevatedButton(onPressed: (){
                //   Navigator.of(context).pushNamed(AppRoutes.userDesign1);
                // }, style:ElevatedButton.styleFrom(primary: Colors.white),
                // child: Text(" < ",
                // style:TextStyle(color: Colors.grey,fontSize: 12.0))),
                InkWell(
                  onTap: ()
                  {
                    //Navigator.of(context).pushNamed(AppRoutes.userDesign1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: Icon(Icons.arrow_back_ios,size: 20,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:12.0,top:5.0,bottom: 5.0),
                  child: Text(" Cart ",
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18.0,

                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:13.0,top:15.0),
                  child: Text(" Thu,6th of June ",
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),),
                ),
              CommonWidgetDesign(imageLink:"https://cdn1.smartprix.com/rx-iEfM9LzwK-w1200-h1200/EfM9LzwK.jpg",
                 textValue:" Mobile Phone ", priceValue: 12000, qtyValue: 1),
                CommonWidgetDesign(imageLink:"https://rugsforyou.in/wp-content/uploads/2021/03/Beautiful_Kashmiri_Floor_Carpet_Red_Floral_Pattern_Design_2-1.jpg",
                    textValue:" Carpet Mat ", priceValue: 2200, qtyValue: 1),

                CommonWidgetDesign(imageLink:"https://images.meesho.com/images/products/76600533/xrm3m_512.jpg",
                    textValue:" Pink foral earings ", priceValue: 250, qtyValue: 1),
                CommonWidgetDesign(imageLink:"https://m.media-amazon.com/images/I/71OET3b2DIL._UL1500_.jpg",
                    textValue:" Shine Star Sling Bag ", priceValue: 220, qtyValue: 1),
                CommonWidgetDesign(imageLink:"https://rugsforyou.in/wp-content/uploads/2021/03/Beautiful_Kashmiri_Floor_Carpet_Red_Floral_Pattern_Design_2-1.jpg",
                    textValue:" Carpet Mat ", priceValue: 2200, qtyValue: 1),
                CommonWidgetDesign(imageLink:"https://images.meesho.com/images/products/76600533/xrm3m_512.jpg",
                    textValue:" Pink foral earings ", priceValue: 250, qtyValue: 1),

                Divider(
                  color:Colors.grey[200],
                  thickness: 3,
                  //height: 5,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Cost"),
                    Text("${ref.watch(isTotalStateProvider.state).state}"),
                  ],
                ),
                Divider(
                  color:Colors.grey[200],
                  thickness: 3,
                  //height: 5,
                ),
                // Row(mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       width:250,
                //       child: ElevatedButton(
                //         onPressed: () {},
                //         style: ElevatedButton.styleFrom(
                //           primary: Colors.red,
                //         //   shape: StadiumBorder(),
                //         //
                //         ),
                //              child: Text(" Place Order  ",
                //           style: TextStyle(color:Colors.white,)),
                //
                //       ),
                //     )
                //   ],
                // ),

                // Center(
                //   child: SizedBox(
                //     width:150,
                //     child: Divider(
                //       color:Colors.black,
                //       thickness: 5,
                //
                //     ),
                //   ),
                // ),
              ],

            ),

          ),
        )
    );
  }
}
