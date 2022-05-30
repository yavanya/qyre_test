part of availability_page;

class _BannersBlock extends StatelessWidget {
  const _BannersBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 16),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: _BannerWidget(
            imagePath: 'assets/images/people.svg',
            beginColor: KColors.beginGradBlue,
            endColor: KColors.endGradBlue,
            title: 'My Network',
            text: 'Connect and grow your network',
          ),
        ),
        SizedBox(width: 16),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: _BannerWidget(
            imagePath: 'assets/images/qyre.svg',
            beginColor: KColors.beginGradRed,
            endColor: KColors.endGradRed,
            title: 'Quick Hire',
            text: 'Hire someone quickly today',
          ),
        ),
        SizedBox(width: 16),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: _BannerWidget(
            imagePath: 'assets/images/note.svg',
            beginColor: KColors.beginGradPurple,
            endColor: KColors.endGradPurple,
            title: 'My CV',
            text: 'Keep your CV updated to get the best offers',
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
