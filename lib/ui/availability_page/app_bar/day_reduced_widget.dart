part of availability_page;

class _DayReducedWidget extends StatelessWidget {
  const _DayReducedWidget({
    required this.weekDay,
    required this.month,
    required this.day,
    required this.isToday,
    this.hasApp,
    Key? key,
  }) : super(key: key);

  final String weekDay;
  final String month;
  final String day;
  final bool isToday;
  final bool? hasApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (isToday)
                  Text(
                    'TODAY',
                    style: KTextStyles.paragraph.copyWith(
                      color: KColors.lightGrey,
                    ),
                  ),
                const SizedBox(width: 2),
                Text(
                  weekDay,
                  style: KTextStyles.paragraph.copyWith(
                    color: KColors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (hasApp != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: hasApp! ? KColors.red : KColors.lightBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                Text(
                  day,
                  style: KTextStyles.paragraph.copyWith(
                    color: KColors.white,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  '$month.',
                  style: KTextStyles.paragraph.copyWith(
                    color: KColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
