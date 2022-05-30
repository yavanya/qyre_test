part of availability_page;

class _EmptyBlockWidget extends StatelessWidget {
  const _EmptyBlockWidget({
    Key? key,
    required this.text,
    this.imagePath,
    this.buttonText,
    this.callback,
  }) : super(key: key);
  final String text;
  final String? imagePath;
  final String? buttonText;
  final VoidCallback? callback;

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
        onTap: callback,
        child: Row(
          children: [
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(imagePath!),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      text,
                      style: KTextStyles.subTitle14.copyWith(
                        color: KColors.fontLightGrey,
                      ),
                    ),
                  ),
                  if (callback != null && buttonText != null)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            buttonText!,
                            style: KTextStyles.subTitle14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 16,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/chevron_right.svg',
                            ),
                          ),
                        ],
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
