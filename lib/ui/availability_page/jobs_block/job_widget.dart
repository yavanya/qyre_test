part of availability_page;

class _JobWidget extends StatelessWidget {
  const _JobWidget({
    Key? key,
    required this.company,
    required this.job,
    required this.jobDate,
    required this.startDate,
    required this.endDate,
    required this.duration,
  }) : super(key: key);
  final String company;
  final String job;
  final String jobDate;
  final String startDate;
  final String endDate;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: KColors.lightGrey,
      ),
      child: InkWell(
        splashFactory: Platform.isAndroid ? null : NoSplash.splashFactory,
        borderRadius: BorderRadius.circular(4),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    company,
                    style: KTextStyles.title14,
                  ),
                  const Spacer(),
                  Text(
                    jobDate,
                    style: KTextStyles.title14.copyWith(
                      color: KColors.fontLightGrey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 2,
                color: KColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                job,
                style: KTextStyles.title14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                children: [
                  Text(
                    startDate,
                    style: KTextStyles.title14.copyWith(
                      color: KColors.fontLightGrey,
                    ),
                  ),
                  Text(
                    ' - ',
                    style: KTextStyles.title14.copyWith(
                      color: KColors.fontLightGrey,
                    ),
                  ),
                  Text(
                    endDate,
                    style: KTextStyles.title14.copyWith(
                      color: KColors.fontLightGrey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    duration,
                    style: KTextStyles.title14.copyWith(
                      color: KColors.fontLightGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
