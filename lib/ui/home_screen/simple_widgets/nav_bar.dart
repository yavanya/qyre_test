part of home_screen;

class _HomeNavBar extends StatelessWidget {
  const _HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: KColors.black,
      destinations: [
        IconButton(
          icon: SvgPicture.asset('assets/images/home.svg'),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/images/menu.svg'),
          onPressed: () {},
        ),
        IconButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset('assets/images/alarm.svg'),
              Align(
                alignment: const Alignment(0.2, -1),
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: KColors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: KTextStyles.paragraph
                            .copyWith(color: KColors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
