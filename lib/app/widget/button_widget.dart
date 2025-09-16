



import '../../core/constants/export.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final Color? textColor;
  final Color? fillColor;
  final double? height;
  final double? width;
  final double? radius;
  final bool isLoading;
  final Widget? child;

  const ButtonWidget({
    this.title,
    this.textColor,
    this.fillColor,
    required this.onTap,
    this.child,
    this.width,
    this.height,
    this.radius,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double borderRadius = radius ?? 100.r;

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height ?? 58.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: fillColor ?? Color(0xFF38C7BD),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: child ??
                Text(
                  isLoading ? 'Please wait...' : title.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: textColor ?? AppColors.whiteColor,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
