part of availability_page;

class _JobsBlock extends StatelessWidget {
  const _JobsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Job Offers',
              style: KTextStyles.subTitle18,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: _JobWidget(
              company: 'Boom operator',
              jobDate: 'Jun 12, 2021',
              job: 'Masterchef',
              startDate: 'Jun 12, 2021',
              endDate: 'Jun 12, 2021',
              duration: '3 days',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: _JobWidget(
              company: 'Boom operator',
              jobDate: 'Jun 12, 2021',
              job: 'Masterchef',
              startDate: 'Jun 12, 2021',
              endDate: 'Jun 12, 2021',
              duration: '3 days',
            ),
          ),
        ],
      ),
    );
  }
}
