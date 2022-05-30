part of availability_page;

class _TaskWidget extends StatelessWidget {
  _TaskWidget({
    required this.title,
    required this.buttonText,
    this.chart,
    Key? key,
  }) : super(key: key) {
    if (chart != null) {
      assert(chart! >= 0 && chart! <= 1);
    }
  }

  final double? chart;
  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 136,
      child: Ink(
        decoration: BoxDecoration(
          color: KColors.lightGrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          splashFactory: Platform.isAndroid ? null : NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(4),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: chart != null ? 5 : 6,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    title,
                    style: KTextStyles.title16,
                  ),
                ),
              ),
              if (chart != null)
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 268,
                          height: 9,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: KColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 268 * chart!,
                          height: 9,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: KColors.lightBlue,
                            ),
                          ),
                        ),
                      ],
                    )),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: KTextStyles.subTitle14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 16,
                          ),
                          child: SvgPicture.asset(
                              'assets/images/chevron_right.svg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
