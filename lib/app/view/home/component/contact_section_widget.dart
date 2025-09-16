import 'package:portfolio_website/core/constants/export.dart';

import '../../../widget/gradient_button_widget.dart';

class ContactSectionWidget extends StatelessWidget {
  const ContactSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                hintText: "Your Name",
                keyboardType: TextInputType.name,
                validatorMessage: "Please enter your name",
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hintText: "Your Email",
                keyboardType: TextInputType.emailAddress,
                validatorMessage: "Please enter your email",
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hintText: "Tell me about your project...",
                validatorMessage: "Required",
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              GradientButtonWidget(
                width: double.infinity,
                text: "Send Message",
                onPressed: () {
                  // TODO: Resume download logic
                },
              ),
              if (isMobile) const SizedBox(height: 30),
              if (isMobile)
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ContactTile(
                        icon: Icon(
                          Icons.email,
                          size: 20,
                          color: Color(0xFF02569B),
                        ),
                        title: "Email",
                      ),
                      ContactTile(
                        svgPath: ImagesResource.githubSvg,
                        title: "GitHub",
                      ),

                      ContactTile(
                        svgPath: ImagesResource.linkedinSvg,
                        title: "LinkedIn",
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (isDesktop || isTablet) const SizedBox(width: 64),
        if (isDesktop || isTablet)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                ColumnContactTile(
                  icon: Icon(Icons.email, size: 20, color: Color(0xFF02569B)),
                  title: "Email",
                  subtitle: "abc@gmail.com",
                ),
                SizedBox(height: 15),
                ColumnContactTile(
                  svgPath: ImagesResource.githubSvg,
                  title: "GitHub",
                  subtitle: "github.com/",
                ),
                SizedBox(height: 15),
                ColumnContactTile(
                  svgPath: ImagesResource.linkedinSvg,
                  title: "LinkedIn",
                  subtitle: "linkedin.com/in/johndoe",
                ),
              ],
            ),
          ),
      ],
    );
  }

  static Widget _buildTextField({
    required String hintText,
    required String validatorMessage,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: (value) =>
          value == null || value.isEmpty ? validatorMessage : null,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFADAEBC)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFADAEBC)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF02569B)),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class ColumnContactTile extends StatefulWidget {
  final Icon? icon;
  final String? svgPath;
  final String title;
  final String subtitle;

  const ColumnContactTile({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ColumnContactTile> createState() => _ColumnContactTileState();
}

class _ColumnContactTileState extends State<ColumnContactTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Leading Avatar
            SizedBox(
              width: 32,
              height: 32,
              child: CircleAvatar(
                backgroundColor: const Color(0xFFDDE7F0),
                radius: 16,
                child: widget.icon ??
                    SvgPicture.asset(
                      widget.svgPath!,
                      width: 18,
                      height: 18,
                      color: const Color(0xFF02569B),
                    ),
              ),
            ),

            const SizedBox(width: 12),

            /// Title + Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                      _isHovered ? const Color(0xFF02569B) : Colors.black,
                    ),
                    child: Text(widget.title),
                  ),
                  const SizedBox(height: 2),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: _isHovered
                          ? const Color(0xFF02569B)
                          : const Color(0xFF4B5563),
                    ),
                    child: Text(widget.subtitle),
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






class ContactTile extends StatefulWidget {
  final Icon? icon;
  final String? svgPath;
  final String title;

  const ContactTile({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
  });

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Leading Avatar
            SizedBox(
              width: 32,
              height: 32,
              child: CircleAvatar(
                backgroundColor: const Color(0xFFDDE7F0),
                radius: 16,
                child: widget.icon ??
                    SvgPicture.asset(
                      widget.svgPath!,
                      width: 18,
                      height: 18,
                      color: const Color(0xFF02569B),
                    ),
              ),
            ),
            const SizedBox(width: 12),

            /// Title (hover changes only text color)
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _isHovered ? const Color(0xFF02569B) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

