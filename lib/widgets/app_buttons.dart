import 'package:flutter/material.dart';
import 'package:mountain_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;
  AppButtons(
      {super.key,
       required this.backgroundColor,
       required this.borderColor,
       required this.size,
       required this.color,
       this.icon,
       this.isIcon=false,
       this.text

       });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
            child: Center(child: isIcon!?Icon(icon,color: color,):AppText(text: text.toString(),color: color,)),);
            
  }
}
