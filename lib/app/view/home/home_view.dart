import 'package:portfolio_website/app/view/home/component/about_me_section_widget.dart';
import 'package:portfolio_website/app/view/home/component/featured_projects_widget.dart';
import 'package:portfolio_website/app/widget/app_drawer_widget.dart';
import '../../../core/constants/export.dart';
import 'component/contact_section_widget.dart';
import 'component/footer_section_widget.dart';
import 'component/intro_section_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double sizeHeight = MediaQuery.of(context).size.height;

    double horizontalWidth = isDesktop
        ? 104
        : isTablet
        ? 40
        : 16;

    return Scaffold(
      backgroundColor: Color(0xFFE5E7EB),
      appBar: AppBarWidget(
        onMenuTap: (value) {
          if (value == "home") scrollTo(homeKey);
          if (value == "about") scrollTo(aboutKey);
          if (value == "projects") scrollTo(projectsKey);
          if (value == "contact") scrollTo(contactKey);
        },
      ),
      drawer: (Responsive.isTablet(context) || Responsive.isMobile(context))
          ? AppDrawerWidget(
              onMenuTap: (value) {
                Navigator.pop(context);
                if (value == "home") scrollTo(homeKey);
                if (value == "about") scrollTo(aboutKey);
                if (value == "projects") scrollTo(projectsKey);
                if (value == "contact") scrollTo(contactKey);
              },
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: sizeHeight * 0.1, key: homeKey),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalWidth),
              child: IntroSectionWidget(),
            ),
            SizedBox(height: 120),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalWidth),
              key: aboutKey,
              child: AboutMeSectionWidget(),
            ),
            SizedBox(height: 100),
            Container(key: projectsKey, child: FeaturedProjectsWidget()),
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalWidth),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Let's Build Something Great Together",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (sizeWidth * 0.035).clamp(30, 48),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalWidth),
              child: Align(
                alignment: Alignment.center,
                child: const Text(
                  textAlign: TextAlign.center,
                  "Ready to bring your mobile app idea to life?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalWidth),
              child: const ContactSectionWidget(key: Key("contact")),
            ),
            const SizedBox(height: 80),
            Container(key: contactKey,child: const FooterSectionWidget()),
          ],
        ),
      ),
    );
  }
}
