import 'package:flutter/material.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isResponsive;
   ResponsiveButton({super.key,this.width=120,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
            children: [
              isResponsive==true?const AppText(text: "Book trip now",color:Colors.white):Container(),
              Image.asset("img/button-one.png",color: Colors.white,width: 50,)
            ],
          ),
        ),
      ),
    );
  }
}