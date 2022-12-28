import 'package:flutter/material.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/widgets/app_buttons.dart';
import 'package:mountain_app/widgets/app_large_text.dart';
import 'package:mountain_app/widgets/app_text.dart';
import 'package:mountain_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottonStars = 4;
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: 350,
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/mountain.jpg"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 50,
              left: 20,
              child: Container(
                child: Row(
                  children: [
                    IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: Icon(Icons.menu))
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              top: 300,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                            text: "Yosemite",
                            color: Colors.black.withOpacity(0.8)),
                        AppLargeText(
                            text: "\$ 250", color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                            text: "USA Califonia", color: AppColors.textColor1)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < gottonStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2);
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: "(4.0)",
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              backgroundColor: selectIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: selectIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 50,
                              color: selectIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Desctiption",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText(
                        text:
                            "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.",
                        color: AppColors.mainTextColor)
                  ],
                ),
              )),
          Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                      isIcon: true,
                      icon: Icons.favorite_border,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      size: 60,
                      color: AppColors.textColor1),

                    const SizedBox(width: 20,)  ,

                  ResponsiveButton(isResponsive: true,)    
                ],
              ))
        ]),
      ),
    );
  }
}
