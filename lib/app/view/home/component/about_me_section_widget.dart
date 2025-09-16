import '../../../../core/constants/export.dart';

class AboutMeSectionWidget extends StatelessWidget {
  const AboutMeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                "👋 Hi, I’m Muhammad Adnan Hameed – a Senior Flutter Developer & Team Lead with over 4 years of professional experience in building high-quality, cross-platform mobile applications."
                "\n\nI specialize in turning ideas into impactful apps that combine seamless performance, modern UI/UX, and scalable architecture. From Figma designs to fully deployed apps on the Play Store and App Store, I handle the complete development lifecycle."
                "\n\n💼 My toolkit includes Dart and Flutter for cross-platform development; Riverpod, GetX, Provider, and BLoC for state management; Firebase, Firestore, REST APIs, and WebSockets for backend and API integration; as well as In-App Purchases, Ads, Payment Gateways, and Push Notifications for app monetization and engagement. I also apply Clean Architecture, MVVM, and Repository Pattern for scalable design, and rely on tools like GitHub, CI/CD pipelines, Figma, and Postman to ensure smooth collaboration and delivery.",
                fontSize: 20,
                align: TextAlign.justify,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryColor,
              ),
              if (isMobile) const SizedBox(height: 30),
              if (isMobile)
                techSkill(
                  isTablet: isTablet,
                  isDesktop: isDesktop,
                  isMobile: isMobile,
                ),
            ],
          ),
        ),

        if (isTablet || isDesktop) const SizedBox(width: 64),

        if (isTablet || isDesktop)
          Flexible(
            child: techSkill(
              isTablet: isTablet,
              isDesktop: isDesktop,
              isMobile: isMobile,
            ),
          ),
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
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return SkillCard(
              iconPath: skills[index]["icon"],
              title: skills[index]["title"],
            );
          },
        ),
      ],
    );
  }
}

List skills = [
  {"icon": Icons.flutter_dash, "title": "Flutter"},
  {"icon": Icons.code, "title": "Dart"},
  {"icon": Icons.fireplace, "title": "Firebase"},
  {"icon": Icons.api, "title": "REST APIs"},
  {"icon": Icons.shopping_cart, "title": "In-App Purchases"},
  {"icon": Icons.campaign, "title": "Ads"},
  {"icon": Icons.payment, "title": "Payment Gateways"},
  {"icon": Icons.architecture, "title": "MVC/MVVM"},
  {"icon": Icons.storage, "title": "Local Storage"},
  {"icon": Icons.cloud_upload, "title": "GitHub CI/CD"},
  {"icon": Icons.settings, "title": "State Management"},
  {"icon": Icons.map, "title": "Google Maps"},
  {"icon": Icons.send, "title": "Deployment"},
  {"icon": Icons.description, "title": "Postman"},
  {"icon": Icons.language, "title": "Multi-Language"},
];

class SkillCard extends StatelessWidget {
  final IconData iconPath;
  final String title;

  const SkillCard({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(iconPath, size: 20, color: AppColors.primaryColor),
          const SizedBox(height: 10),
          TextViewWidget(
            title,
            isEllipsis: true,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
