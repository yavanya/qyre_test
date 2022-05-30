part of availability_page;

class _TasksBlock extends StatelessWidget {
  const _TasksBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _TaskWidget(
              title:
                  'Complete yout profile to optimize your exposure in job searches',
              buttonText: 'Complete profile',
              chart: 0.75,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: _TaskWidget(
              title:
                  'Connect with people you might know and extend your network',
              buttonText: 'Connect',
            ),
          ),
        ],
      ),
    );
  }
}
