import 'package:portfolio_website/app/widget/gradient_button_widget.dart';

import '../../../../core/constants/export.dart';

class IntroSectionWidget extends StatelessWidget {
  const IntroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    double sizeWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT SIDE CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: isDesktop ?CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: (sizeWidth * 0.035).clamp(30, 48),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  children: const [
                    TextSpan(
                      text: "Hello, I'm Muhammad Adnan Hameed",
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                    TextSpan(
                      text: " – Senior Flutter Developer",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                  textAlign: isDesktop? TextAlign.start : TextAlign.center,
              ),
              const SizedBox(height: 16),
               TextViewWidget(
                align: isDesktop? TextAlign.start : TextAlign.center,
                "Building fast, beautiful, and scalable mobile apps for Android and iOS.",
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryColor,
              ),

              if (isTablet || isMobile) const SizedBox(height: 30),
              if (isTablet || isMobile)
                Container(
                  width: 385,
                  height: 385,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage("https://avatars.githubusercontent.com/u/99065355?v=4"))
                  ),
                  // TODO: Replace with Image.asset("assets/profile.png") if needed
                ),
               SizedBox(height:  (isTablet || isMobile)? 30  :16),
              GradientButtonWidget(
                text: "Download Resume",
                onPressed: () {
                  // TODO: Resume download logic
                },
              ),
            ],
          ),
        ),

        /// RIGHT SIDE IMAGE / CONTAINER
        if (isDesktop)
          Flexible(
            child: Container(
              width: 385,
              height: 385,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage("https://avatars.githubusercontent.com/u/99065355?v=4"))

              ),
              // TODO: Replace with Image.asset("assets/profile.png") if needed
            ),
          ),
      ],
    );
  }
}
