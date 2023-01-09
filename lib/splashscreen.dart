import 'dart:async';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds:2), ()=>Navigator.pushReplacementNamed(context,
      AppRoutes.signin,
    )
    );
    return Scaffold(
        body: SafeArea(
            child:Container(
              color: Colors.red[900],
              child: Column(
                children: [
                  Expanded(child:
                  Center(
                    child: Container(
                      height: 300,
                      width:300,
                      child: CachedNetworkImage(
                        imageUrl: "https://img.freepik.com/premium-vector/abstract-modern-ecommerce-logo-design-colorful-gradient-shopping-bag-logo-template_467913-995.jpg?w=2000",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            color:Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color:  Colors.white.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(5, 5),
                              ),],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // decoration: BoxDecoration(
                      //     color:Colors.transparent,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color:  Colors.white.withOpacity(0.5),
                      //         spreadRadius: 2,
                      //         blurRadius: 7,
                      //         offset: Offset(5, 5),
                      //       ),],
                      //     shape: BoxShape.circle,
                      //     image:DecorationImage(
                      //       image: NetworkImage("https://img.freepik.com/premium-vector/abstract-modern-ecommerce-logo-design-colorful-gradient-shopping-bag-logo-template_467913-995.jpg?w=2000"),
                      //       fit: BoxFit.fill,
                      //     )
                      //
                      // ),
                       // child:
                      // Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8oXmi1On8l_YuR42kd_d0eDYrqOuyDe6kAgjdxGoR1CX95Ust-sKIoaPE8l0VHO4L9Y0&usqp=CAU",
                      //     //"https://pngimg.com/uploads/cocacola_logo/cocacola_logo_PNG5.png",
                      //      //  width:300,height: 300,
                      //   ),
                    ),
                  ),
                    flex: 6,
                  ),
                  Expanded(child: Center(
                      child:Text(" Ecommerce Project ",style:GoogleFonts.merriweather(fontSize: 18,
                          fontWeight:FontWeight.w800,color:Colors.white))
                  ),
                      flex:2
                  )
                ],
              ),
            )
        )
    );
  }
}
