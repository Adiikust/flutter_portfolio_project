import 'package:portfolio_website/core/constants/export.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widget/gradient_button_widget.dart';

class ContactSectionWidget extends StatelessWidget {
  const ContactSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _messageController = TextEditingController();

    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  controller: _nameController,
                  hintText: "Your Name",
                  keyboardType: TextInputType.name,
                  validatorMessage: "Please enter your name",
                  maxLines: 1,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _emailController,
                  hintText: "Your Email",
                  keyboardType: TextInputType.emailAddress,
                  validatorMessage: "Please enter your email",
                  maxLines: 1,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _messageController,
                  hintText: "Tell me about your project...",
                  validatorMessage: "Required",
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                GradientButtonWidget(
                  width: double.infinity,
                  text: "Send Message",
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    _sendEmail(
                      name: _nameController.text,
                      email: _emailController.text,
                      message: _messageController.text,
                    ).then((value) {
                      _nameController.clear();
                      _emailController.clear();
                      _messageController.clear();
                    });
                  },
                ),
                if (isMobile) const SizedBox(height: 30),
                if (isMobile)
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContactTile(
                          icon: Icon(
                            Icons.email,
                            size: 20,
                            color: Color(0xFF02569B),
                          ),
                          title: "Email",
                          onTap: () {
                            _launchEmail("adnan.hameed277@gmail.com");
                          },
                        ),
                        ContactTile(
                          svgPath: ImagesResource.githubSvg,
                          title: "GitHub",
                          onTap: () {
                            _launchUrl("https://github.com/Adiikust");
                          },
                        ),

                        ContactTile(
                          svgPath: ImagesResource.linkedinSvg,
                          title: "LinkedIn",
                          onTap: () {
                            _launchUrl(
                              "https://linkedin.com/in/muhammad-adnan-hameed",
                            );
                          },
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
                children: [
                  ColumnContactTile(
                    icon: Icon(Icons.email, size: 20, color: Color(0xFF02569B)),
                    title: "Email",
                    subtitle: "adnan.hameed277@gmail.com",
                    onTap: () {
                      _launchEmail("adnan.hameed277@gmail.com");
                    },
                  ),
                  SizedBox(height: 15),
                  ColumnContactTile(
                    svgPath: ImagesResource.githubSvg,
                    title: "GitHub",
                    subtitle: "github.com/Adiikust",
                    onTap: () {
                      _launchUrl("https://github.com/Adiikust");
                    },
                  ),
                  SizedBox(height: 15),
                  ColumnContactTile(
                    svgPath: ImagesResource.linkedinSvg,
                    title: "LinkedIn",
                    subtitle: "linkedin.com/in/adnan-hameed",
                    onTap: () {
                      _launchUrl(
                        "https://linkedin.com/in/muhammad-adnan-hameed",
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Hello&body=Hi, I would like to connect!'),
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $email');
    }
  }

  Future<void> _sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'adnan.hameed277@gmail.com',
      query: Uri.encodeFull(
        'subject=Portfolio Contact from $name&body=Name: $name\nEmail: $email\n\nMessage:\n$message',
      ),
    );
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch email client');
    }
  }

  static Widget _buildTextField({
    required String hintText,
    required String validatorMessage,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
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
  final VoidCallback? onTap;

  const ColumnContactTile({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
    required this.subtitle,
    this.onTap,
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
      child: GestureDetector(
        onTap: widget.onTap,
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
                  child:
                      widget.icon ??
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
                        color: _isHovered
                            ? const Color(0xFF02569B)
                            : Colors.black,
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
      ),
    );
  }
}

class ContactTile extends StatefulWidget {
  final Icon? icon;
  final String? svgPath;
  final String title;
  final VoidCallback? onTap;

  const ContactTile({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
    this.onTap,
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
      child: GestureDetector(
        onTap: widget.onTap,
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
                  child:
                      widget.icon ??
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
      ),
    );
  }
}
