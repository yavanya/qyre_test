library home_screen;

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:qyre_test/constants/kcolors.dart';
import 'package:qyre_test/constants/ktext_styles.dart';
import 'package:qyre_test/helpers/date_time.dart';

part 'simple_widgets/day_widget.dart';
part 'simple_widgets/day_reduced_widget.dart';
part 'simple_widgets/nav_bar.dart';
part 'simple_widgets/days_widget.dart';
part 'simple_widgets/task_widget.dart';
part 'simple_widgets/production_widget.dart';
part 'simple_widgets/banner_widget.dart';

part 'slivers/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;
  bool showDelayed = false;
  bool get rand => Random().nextBool();

  void showBottom() {
    setState(() {
      show = true;
      showDelayed = true;
    });
  }

  Future<void> hideBottom() async {
    setState(() {
      show = false;
    });

    await Future.delayed(
      const Duration(
        milliseconds: 100,
      ),
    );

    setState(() {
      showDelayed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: KColors.white,
          bottomNavigationBar: const _HomeNavBar(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: appbarHeight + 12,
                ),
              ),
              SliverToBoxAdapter(
                child: _DaysWidget(
                  showBottom: showBottom,
                  hideBottom: hideBottom,
                  rand: rand,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 136,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: _TaskWidget(
                            title:
                                'Complete yout profile to optimize your exposure in job searches',
                            buttonText: 'Complete profile',
                            chart: 0.75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: _TaskWidget(
                            title:
                                'Connect with people you might know and extend your network',
                            buttonText: 'Connect',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Today\'s productions',
                    style: KTextStyles.subTitle18,
                  ),
                ),
              ),
              const SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: _ProductionWidget(
                        imagePath: 'assets/images/image1.png',
                        title: 'Production Name That Is Long',
                        date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: _ProductionWidget(
                        imagePath: 'assets/images/image2.png',
                        title:
                            'Production Name That Is Long Long Long Long Long Long Long',
                        date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: _ProductionWidget(
                        imagePath: 'assets/images/image2.png',
                        title:
                            'Production Name That Is Long Long Long Long Long Long Long',
                        date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: _ProductionWidget(
                        imagePath: 'assets/images/image2.png',
                        title:
                            'Production Name That Is Long Long Long Long Long Long Long',
                        date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: _ProductionWidget(
                        imagePath: 'assets/images/image2.png',
                        title:
                            'Production Name That Is Long Long Long Long Long Long Long',
                        date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _BannerWidget(
                          imagePath: 'assets/images/people.svg',
                          beginColor: KColors.beginGradBlue,
                          endColor: KColors.endGradBlue,
                          title: 'My Network',
                          text: 'Connect and grow your network',
                        ),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _BannerWidget(
                          imagePath: 'assets/images/qyre.svg',
                          beginColor: KColors.beginGradRed,
                          endColor: KColors.endGradRed,
                          title: 'Quick Hire',
                          text: 'Hire someone quickly today',
                        ),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _BannerWidget(
                          imagePath: 'assets/images/note.svg',
                          beginColor: KColors.beginGradPurple,
                          endColor: KColors.endGradPurple,
                          title: 'My CV',
                          text: 'Keep your CV updated to get the best offers',
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: showDelayed ? appbarHeight + 100 : appbarHeight,
          child: CustomScrollView(
            slivers: [
              _HomeAppBar(showBottom: show),
            ],
          ),
        ),
      ],
    );
  }
}
