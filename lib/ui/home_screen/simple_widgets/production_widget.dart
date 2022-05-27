part of home_screen;

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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: KColors.lightGrey,
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                child: Image.asset(imagePath)),
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/chevron_right.svg')),
            ),
          ],
        ),
      ),
    );
  }
}