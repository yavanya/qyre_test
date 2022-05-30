library availability_page;

import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:qyre_test/constants/kcolors.dart';
import 'package:qyre_test/constants/ktext_styles.dart';
import 'package:qyre_test/helpers/date_time.dart';

part 'app_bar/app_bar.dart';
part 'nav_bar/nav_bar.dart';
part 'app_bar/day_reduced_widget.dart';
part 'availability_block/day_widget.dart';
part 'availability_block/days_widget.dart';
part 'tasks_block/task_widget.dart';
part 'tasks_block/tasks_block_widget.dart';
part 'productions_block/production_widget.dart';
part 'productions_block/productions_block_widget.dart';
part 'banners_block/banner_widget.dart';
part 'banners_block/banners_block_widget.dart';
part 'jobs_block/job_widget.dart';
part 'jobs_block/jobs_block_widget.dart';
part 'common_widgets/empty_block_widget.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({Key? key}) : super(key: key);

  @override
  State<AvailabilityPage> createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appbarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: KColors.white,
          bottomNavigationBar: const _HomeNavBar(),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
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
              const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: _TasksBlock()),
              ),
              const _ProductionsBlock(),
              const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: _BannersBlock()),
              ),
              const _JobsBlock(),

              ///
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _EmptyBlockWidget(
                    text:
                        'All of your\'s today production will be displayed here',
                    imagePath: 'assets/images/productions.svg',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _EmptyBlockWidget(
                    text:
                        'Job offers are shown here!\nKeep Your profile updated to stay relevant for new opportunities',
                    imagePath: 'assets/images/job_offer.svg',
                    buttonText: 'Go to my profile',
                    callback: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (c) => Scaffold(
                          appBar: AppBar(
                            title: const Text('New Page'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _EmptyBlockWidget(
                    text:
                        'Posts that are extra relevant to you can be marked with a star and will be shown here for easy access',
                    imagePath: 'assets/images/starred.svg',
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
