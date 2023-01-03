import 'dart:async';

import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'banners_model.dart';



class HomePageDesign  extends HookConsumerWidget {
  late Future<List<BannersModel>> listPhotoModel;
  //late Timer myTimer;
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final pageViewController = usePageController();
    final ValueNotifier<int> cIndexPass =useState(0);


    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(viewModelHomeProvider).vmFetchAllbannerPhotos();
      });
      Timer myTimer;
      myTimer=
      Timer.periodic(Duration(seconds: 5),  (Timer timer) {
        if(cIndexPass.value<5)
        {
          cIndexPass.value++;
        }
        else
        {
          cIndexPass.value=0;
        }
        pageViewController.animateToPage(cIndexPass.value, duration: Duration(seconds: 1), curve: Curves.easeIn);
      });
      return () {
        myTimer.cancel();
      };
    }, []);
    final List<BannersModel> homeBanner = ref.watch(viewModelHomeProvider).isloading?[]:ref.watch(viewModelHomeProvider).listBannerModel;
    return Scaffold(
        body:ref.watch(viewModelHomeProvider).isloading ? Center(
            child:CircularProgressIndicator()
        ): SingleChildScrollView(
          child: SafeArea(
              child:  Column(
                children: [
                  Container(
                    color:Colors.pinkAccent[100],
                      height: 150,
                      width:400,
                      child: PageView.builder(
                        controller: pageViewController,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeBanner.length,
                          itemBuilder: (context, index) {
                                      return Center(
                                        child: Container(
                                          height: 150,
                                          width:400,
                                          decoration: BoxDecoration(
                                          image:DecorationImage(
                                            image: NetworkImage(homeBanner[index].url),
                                            fit: BoxFit.cover,
                                          )),
                                         child: Align(
                                           alignment: Alignment.bottomCenter,
                                           child: Padding(
                                             padding: const EdgeInsets.only(bottom:10.0),
                                             child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ...List.generate(homeBanner.length, (index) {
                                                      return DotWidget(index: index, cIndexPass: cIndexPass);
                                                    })
                                                  ]),
                                           ),
                                         ),
                                        ),

                                      );
                                    }
                            ),
                    ),

                  // Row(
                  //     children: [
                  //       ...List.generate(homeBanner.length, (index) {
                  //         return DotWidget(index: index, cIndexPass: cIndexPass);
                  //       })
                  //     ]),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       height: 630.0,
                       width:400.0,
                       color: Colors.pink[200],
                       child: Column(
                       children: [
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Spotlight's",style:TextStyle(fontSize: 20.0)),
                             ),
                         MaterialButton(
                           onPressed: () {},
                           color: Colors.green,
                           textColor: Colors.white,
                           child: Icon(
                             Icons.arrow_forward_ios,
                             size: 20,
                           ),
                         shape: CircleBorder(),),

                           ],
                         ),
                         Row(
                          children: [
                            CommonWidgetDesign(imageLink:"https://m.media-amazon.com/images/I/81zl1k5wDNL._UL1500_.jpg",textValue1: 'Chain',textValue2: 'Start From 199',),
                            CommonWidgetDesign(imageLink:"https://m.media-amazon.com/images/I/61i5XSPkngL._SL1080_.jpg",textValue1: 'Carpets and Others',textValue2: 'From 499',),

                          ],
                        ),
                         Row(
                           children: [
                             CommonWidgetDesign(imageLink:"https://m.media-amazon.com/images/I/91RM+3UARlL._UY500_.jpg",textValue1: 'Earings',textValue2: 'Upto 90% of',),
                             CommonWidgetDesign(imageLink:"https://m.media-amazon.com/images/I/81ib4G0We-L._UL1500_.jpg", textValue1: 'Women Kurtis',textValue2: 'From 700',),

                           ],
                         ),
                       ],
                     ),

                   ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 200.0,
                      width:400.0,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          boxShadow: [BoxShadow(
                            color:Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(5,5),
                          ),
                            BoxShadow(
                              color:Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(-5,-5),
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(" Sponsored ",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 15.0)),
                            ],
                          ),
                          Divider(
                            color:Colors.grey[200],
                            thickness: 3,
                            //height: 5,
                          ),
                          Row(
                              children: [
                                SponsoredCommonWidgetDesign(imageLink:"https://static9.depositphotos.com/1013513/1169/i/950/depositphotos_11699738-stock-photo-variety-of-casual-shirts-on.jpg",textValue1: "Cool BackPack",textValue2: "Min 65% off",),
                                SponsoredCommonWidgetDesign(imageLink:"https://thumbs.dreamstime.com/z/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-153892434.jpg",textValue1: "Footware",textValue2: "Min 55% off",),
                                SponsoredCommonWidgetDesign(imageLink:"https://static9.depositphotos.com/1013513/1169/i/950/depositphotos_11699738-stock-photo-variety-of-casual-shirts-on.jpg",textValue1: "Study BackPack",textValue2: "Min 75% off",),
                              ]),

                        ],
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 200.0,
                      width:400.0,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          boxShadow: [BoxShadow(
                            color:Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(5,5),
                          ),
                            BoxShadow(
                              color:Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(-5,-5),
                            )
                          ]
                      ),
                      child: Column(
                        children: [


                          Row(
                              children: [
                                SponsoredCommonWidgetDesign(imageLink:"https://static9.depositphotos.com/1013513/1169/i/950/depositphotos_11699738-stock-photo-variety-of-casual-shirts-on.jpg",textValue1: "Cool BackPack",textValue2: "Min 65% off",),
                                SponsoredCommonWidgetDesign(imageLink:"https://thumbs.dreamstime.com/z/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-153892434.jpg",textValue1: "Footware",textValue2: "Min 55% off",),
                                SponsoredCommonWidgetDesign(imageLink:"https://static9.depositphotos.com/1013513/1169/i/950/depositphotos_11699738-stock-photo-variety-of-casual-shirts-on.jpg",textValue1: "Study BackPack",textValue2: "Min 75% off",),
                              ]),

                        ],
                      ),

                    ),
                  ),
                    ],),

                ),
              ),
        );

  }
}
class DotWidget  extends HookConsumerWidget {
  int index;
  final ValueNotifier<int> cIndexPass ;

  DotWidget({required this.index,required this.cIndexPass});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      height: 7.95,
      width: 7.95,
      // width: cIndexPass.value == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cIndexPass.value == index? const Color(0xff27B28E):Color(0xffE2DBCF),
      ),
    );
  }

}


class CommonWidgetDesign  extends StatefulHookConsumerWidget {
  final String imageLink;
  final String textValue1,textValue2;


  CommonWidgetDesign({required this.imageLink,required this.textValue1,required this.textValue2});

  @override
  CommonWidgetDesignState createState() => CommonWidgetDesignState();
}

class CommonWidgetDesignState extends ConsumerState<CommonWidgetDesign> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin:  const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 5.0) ,
          height:250,
          width:170,
          color: Colors.white,
          child: Column(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network("${widget.imageLink}",height: 180.0,width: 250.0,),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${widget.textValue1}",style:TextStyle(fontSize:15.0,)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text("${widget.textValue2}",style:TextStyle(fontSize:15.0,fontWeight: FontWeight.bold,color:Colors.green)),
                  ),
                ],
              )

            ],
          ),
        ),
      ],
    )
    );
  }
}
class SponsoredCommonWidgetDesign  extends StatefulHookConsumerWidget {
final String imageLink;
final String textValue1;
final String textValue2;

SponsoredCommonWidgetDesign({required this.imageLink,required this.textValue1,required this.textValue2});

@override
SponsoredCommonWidgetDesignState createState() => SponsoredCommonWidgetDesignState();
}

class SponsoredCommonWidgetDesignState extends ConsumerState<SponsoredCommonWidgetDesign> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(child:
    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin:  const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0) ,
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
        Text("${widget.textValue1}",style:TextStyle(fontSize:10.0,color:Colors.black)),
        Text("${widget.textValue2}",style:TextStyle(fontSize:15.0,fontWeight: FontWeight.bold,color:Colors.black)),

      ],
    )
    );
  }
}