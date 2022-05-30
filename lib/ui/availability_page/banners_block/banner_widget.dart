part of availability_page;

class _BannerWidget extends StatelessWidget {
  const _BannerWidget({
    required this.imagePath,
    required this.beginColor,
    required this.endColor,
    required this.title,
    required this.text,
    Key? key,
  }) : super(key: key);
  final String imagePath;
  final Color beginColor;
  final Color endColor;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            colors: [beginColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          splashFactory: Platform.isAndroid ? null : NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(4),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 9,
              right: 9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(imagePath),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    title,
                    style: KTextStyles.title14.copyWith(
                      color: KColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    text,
                    style: KTextStyles.paragraph.copyWith(
                      color: KColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
