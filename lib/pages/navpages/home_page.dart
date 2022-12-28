import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_app/cubit/app_cubit.dart';
import 'package:mountain_app/cubit/app_cubit_state.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/widgets/app_large_text.dart';
import '../../widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "mountain.jpg":"kayaking",
    "mountain2.jpg":"snorkeling",
    "mountain.3.jpg":"balloning",
    "button-one.png":"Hikins",

  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context,state) {
         if(state is LoadedState){
          var info = state.places;
           return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: Row(
                  children: [
                    const Icon(Icons.menu),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child:const AppLargeText(text: "Discover")),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      indicator:
                          CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        )
                      ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 250,
                child: TabBarView(controller: tabController, children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (() {
                            BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                          }),
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 150,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image:  DecorationImage(
                                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                  const Text("there"),
                  const Text("bye")
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    AppText(
                      text: "See all",
                      color: AppColors.textColor1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.only(left: 30),
                height: 120,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage("img/${images.keys.elementAt(index)}"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              child: AppText(text: images.values.elementAt(index),
                              color: AppColors.textColor2,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
       
         }else {
          return Container();
         }
          }
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
