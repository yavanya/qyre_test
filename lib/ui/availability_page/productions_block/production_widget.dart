part of availability_page;

class _ProductionWidget extends StatelessWidget {
  const _ProductionWidget({
    required this.imagePath,
    required this.title,
    required this.date,
    Key? key,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 358,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: KColors.lightGrey,
        ),
        child: InkWell(
          splashFactory: Platform.isAndroid ? null : NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(4),
          onTap: () {},
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                child: Image.asset(
                  imagePath,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: KTextStyles.subTitle14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        date,
                        style: KTextStyles.paragraph,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset('assets/images/chevron_right.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
