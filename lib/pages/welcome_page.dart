import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/widgets/app_large_text.dart';
import 'package:mountain_app/widgets/app_text.dart';
import 'package:mountain_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List image = ["mountain.jpeg", "mountain2.jpg", "mountain.3.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/" + image[index]),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppLargeText(text: "Trips"),
                          AppText(text: "Mountain"),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: 250,
                              child: AppText(
                                  size: 16,
                                  text:
                                      "The hike of Mountains is beautiful and peaceful its gives us happiness")),
                        const SizedBox(
                            height: 40,
                          ),
                        ResponsiveButton()
                        ],
                      ),
                      Column(
                        children: List.generate(3, (slideIndex) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: slideIndex == index ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: slideIndex == index
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.6)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
