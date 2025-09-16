import '../../core/constants/export.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onMenuTap;

  const AppBarWidget({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final double sizeWidth = MediaQuery.of(context).size.width;
    double horizontalWidth = isDesktop ? 80 : 0;

    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 1,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalWidth),
        child: Row(
          children: [
            /// Logo / Name
            TextViewWidget(
              "Muhammad Adnan Hameed",
              fontSize: (sizeWidth * 0.024).clamp(15, 28),
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),

            /// Spacer for desktop menu
            if (isDesktop) const Spacer(),

            /// ✅ Desktop Navigation Menu
            if (isDesktop)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildNavButton("Home", () => onMenuTap("home")),
                  _buildNavButton("About", () => onMenuTap("about")),
                  _buildNavButton("Projects", () => onMenuTap("projects")),
                  _buildNavButton("Contact", () => onMenuTap("contact")),
                ],
              ),

            const Spacer(),

            /// ✅ Social Icons
            Row(
              children: [
                _buildSocialIcon(
                  svgPath: ImagesResource.githubSvg,
                  tooltip: "GitHub",
                  onTap: () {},
                ),
                _buildSocialIcon(
                  svgPath: ImagesResource.linkedinSvg,
                  tooltip: "LinkedIn",
                  onTap: () {},
                ),
                _buildSocialIcon(
                  svgPath: ImagesResource.twitterSvg,
                  tooltip: "Twitter",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Navigation Button
  Widget _buildNavButton(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: TextViewWidget(
        label,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.lightBlackColor,
      ),
    );
  }

  /// Social Icons
  Widget _buildSocialIcon({
    required String svgPath,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        svgPath,
        width: 20,
        height: 20,
        color: AppColors.blackColor,
      ),
      tooltip: tooltip,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
