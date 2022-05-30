part of availability_page;

class _DaysWidget extends StatelessWidget {
  const _DaysWidget({
    required this.showBottom,
    required this.hideBottom,
    required this.rand,
    Key? key,
  }) : super(key: key);

  final VoidCallback showBottom;
  final VoidCallback hideBottom;
  final bool rand;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('aaa'),
      onVisibilityChanged: (info) async {
        if (info.visibleFraction < 1) {
          showBottom();
        } else {
          hideBottom();
        }
      },
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 4,
                left: index == 0 ? 16 : 8,
                right: index == 6 ? 16 : 0,
              ),
              child: _DayWidget(
                day: '${index + 1}',
                isToday: index == 0,
                month: 'May',
                hasApp: index % 2 != 0 || index == 0 ? rand : null,
                weekDay: DateTimeHelpers.getWeekDayStr(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
