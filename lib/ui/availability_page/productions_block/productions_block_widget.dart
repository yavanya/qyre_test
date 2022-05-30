part of availability_page;

class _ProductionsBlock extends StatelessWidget {
  const _ProductionsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Today\'s productions',
              style: KTextStyles.subTitle18,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: _ProductionWidget(
              imagePath: 'assets/images/image1.png',
              title: 'Production Name That Is Long',
              date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: _ProductionWidget(
              imagePath: 'assets/images/image2.png',
              title:
                  'Production Name That Is Long Long Long Long Long Long Long',
              date: 'Sweden Jan 14, 2022 - Feb 23, 2023',
            ),
          ),
        ],
      ),
    );
  }
}
