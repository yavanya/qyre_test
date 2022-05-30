part of availability_page;

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({required this.showBottom, Key? key}) : super(key: key);
  final bool showBottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'My Availability',
        style: KTextStyles.appBar,
      ),
      collapsedHeight: 64,
      centerTitle: false,
      backgroundColor: KColors.white.withOpacity(0.8),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7,
            sigmaY: 7,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 42),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 150),
            reverseDuration: const Duration(milliseconds: 100),
            firstCurve: Curves.easeInCubic,
            secondCurve: Curves.easeOutCubic,
            firstChild: SizedBox(
              height: 42,
              child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 4,
                      left: index == 0 ? 16 : 8,
                      right: index == 6 ? 16 : 0,
                    ),
                    child: _DayReducedWidget(
                      day: '${index + 1}',
                      isToday: index == 0,
                      month: 'May',
                      hasApp: index % 2 != 0 ? Random().nextBool() : null,
                      weekDay: DateTimeHelpers.getWeekDayStr(index),
                    ),
                  );
                },
              ),
            ),
            secondChild: Container(
              height: 42,
              width: double.infinity,
              color: Colors.transparent,
            ),
            crossFadeState: showBottom
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
      pinned: true,
      shadowColor: Colors.transparent,
    );
  }
}
