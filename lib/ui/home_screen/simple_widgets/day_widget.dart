part of home_screen;

class _DayWidget extends StatelessWidget {
  const _DayWidget({
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 60),
          decoration: BoxDecoration(
            color: KColors.black,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isToday)
                  Text(
                    'TODAY',
                    style: KTextStyles.paragraph.copyWith(
                      color: KColors.lightGrey,
                    ),
                  ),
                Text(
                  weekDay,
                  style: KTextStyles.subTitle12.copyWith(
                    color: KColors.white,
                  ),
                ),
                Text(
                  month,
                  style: KTextStyles.paragraph.copyWith(
                    color: KColors.white,
                  ),
                ),
                Text(
                  day,
                  style: KTextStyles.title16.copyWith(
                    color: KColors.white,
                  ),
                ),
                if (hasApp != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: hasApp! ? KColors.red : KColors.lightBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
