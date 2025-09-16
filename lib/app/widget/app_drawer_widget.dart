import '../../core/constants/export.dart';

class AppDrawerWidget extends StatelessWidget {
  final Function(String) onMenuTap;

  const AppDrawerWidget({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Text(
              "Muhammad Adnan Hameed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home,
            text: "Home",
            onTap: () => onMenuTap("home"),
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: "About",
            onTap: () => onMenuTap("about"),
          ),
          _buildDrawerItem(
            icon: Icons.work,
            text: "Projects",
            onTap: () => onMenuTap("projects"),
          ),
          _buildDrawerItem(
            icon: Icons.contact_mail,
            text: "Contact",
            onTap: () => onMenuTap("contact"),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.blackColor),
      title: TextViewWidget(
        text,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.blackColor,
      ),
      onTap: onTap,
    );
  }
}
