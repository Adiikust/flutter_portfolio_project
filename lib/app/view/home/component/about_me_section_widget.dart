import '../../../../core/constants/export.dart';

class AboutMeSectionWidget extends StatelessWidget {
  const AboutMeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    double sizeWidth = MediaQuery.of(context).size.width;
    double horizontalWidth = isDesktop ? 80 : 0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// LEFT SIDE - About Me
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextViewWidget(
                "About Me",
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
              const SizedBox(height: 20),
              const TextViewWidget(
                "Senior Flutter Developer with 5+ years of experience building high-performance mobile applications. "
                "Passionate about creating seamless user experiences and scalable solutions for both Android and iOS platforms.",
                fontSize: 20,
                align: TextAlign.justify,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(height: 15),
              const TextViewWidget(
                "I've successfully delivered 20+ apps to production, specializing in complex integrations, "
                "state management, and performance optimization.",
                fontSize: 20,
                align: TextAlign.justify,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryColor,
              ),
              if (isMobile) const SizedBox(height: 30),
              if (isMobile)techSkill( isTablet: isTablet, isDesktop: isDesktop, isMobile: isMobile),
            ],
          ),
        ),

        if (isTablet || isDesktop) const SizedBox(width: 64),

        if (isTablet || isDesktop) Flexible(child: techSkill( isTablet: isTablet, isDesktop: isDesktop, isMobile: isMobile)),
      ],
    );
  }

  Column techSkill({
    required bool isTablet,
    required bool isDesktop,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextViewWidget(
          "Technical Skills",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        const SizedBox(height: 20),

        /// Grid of skills
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 2 : 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: isDesktop
                ? 1.5
                : isTablet
                ? 1.9
                : 1.7,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return SkillCard(
              iconPath: ImagesResource.linkedinSvg,
              title: "Flutter",
            );
          },
        ),
      ],
    );
  }
}

/// Single Skill Card
class SkillCard extends StatelessWidget {
  final String iconPath;
  final String title;

  const SkillCard({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 184,
      // height: (MediaQuery.of(context).size.width * 0.084).clamp(30, 84),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
            color: AppColors.blackColor,
          ),
          const SizedBox(height: 10),
          TextViewWidget(
            title,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
