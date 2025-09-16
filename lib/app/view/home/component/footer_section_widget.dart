import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/images_resource.dart';

class FooterSectionWidget extends StatelessWidget {
  const FooterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Muhammad Adnan Hameed",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Senior Flutter Developer • Building the future of mobile apps.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: 16),

          /// Social Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSocialIcon(
                svgPath: ImagesResource.githubSvg,
                tooltip: "GitHub",
                onTap: () {},
              ),
              const SizedBox(width: 8),
              _buildSocialIcon(
                svgPath: ImagesResource.linkedinSvg,
                tooltip: "LinkedIn",
                onTap: () {},
              ),
              const SizedBox(width: 8),
              _buildSocialIcon(
                svgPath: ImagesResource.twitterSvg,
                tooltip: "Twitter",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Color(0xFF9CA3AF)),
          const SizedBox(height: 16),

          const Text(
            "© 2025 Muhammad Adnan Hameed. All rights reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
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
        color: Color(0xFF9CA3AF),
      ),
      tooltip: tooltip,
    );
  }
}


