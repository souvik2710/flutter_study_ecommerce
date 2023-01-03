import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

class OTPSendView extends StatefulHookConsumerWidget {
  final TextEditingController textEditingController ;
  // final String exactOtp;
  OTPSendView({required this.textEditingController});

  @override
  OTPSendViewState createState() => OTPSendViewState();
}

class OTPSendViewState extends ConsumerState<OTPSendView> {

  // final pinPutController = pinPutController;
  // final _pinPutController2 = TextEditingController();
  Color OTPBoxColor=Colors.grey;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
          children: [
            darkRoundedPinPut()
          ]),
    );
  }

  Widget darkRoundedPinPut() {
    final defaultPinTheme = PinTheme(
      width: 62,
      height: 62,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      textStyle: defaultPinTheme.textStyle!.copyWith(

      ),
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
        border: Border.all(color: OTPBoxColor),
      ),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      color: Colors.red,
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme =  defaultPinTheme.copyWith(
      textStyle: defaultPinTheme.textStyle!.copyWith(
          color: Colors.white
      ),
      decoration: defaultPinTheme.decoration!.copyWith(
        color: OTPBoxColor,
        border: Border.all(color: OTPBoxColor),
      ),
    );
    final followingPinTheme = defaultPinTheme.copyWith(
      textStyle: defaultPinTheme.textStyle!.copyWith(

      ),
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Pinput(
      length: 4,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onSubmitted: (String pin) {
        // _showSnackBar(pin);
      },
      validator: (s) {

        if(s!.length==4 && s=="1234"){
          Navigator.of(context).pushNamed(AppRoutes.homePage);
          return null;
        }else{
          return'Pin is incorrect';
        }

      },

      controller: widget.textEditingController,

      submittedPinTheme: submittedPinTheme,
      focusedPinTheme: focusedPinTheme,
      followingPinTheme: followingPinTheme,
      errorPinTheme: errorPinTheme,
      pinAnimationType: PinAnimationType.rotation,

    );
  }




}