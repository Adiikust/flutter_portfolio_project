

import '../../core/constants/export.dart';

class TextViewWidget extends StatelessWidget {
  const TextViewWidget(
    String text, {
    super.key,
    TextStyle? style,
    bool isEllipsis = false,
    this.textScaleFactor = false,
    this.maxLines,
    TextAlign? align,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  }) : _text = text,
       _style = style,
       _align = align,
       _isEllipsis = isEllipsis;

  final String _text;
  final TextStyle? _style;
  final TextAlign? _align;
  final bool _isEllipsis;
  final bool textScaleFactor;
  final int? maxLines;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textScaler: textScaleFactor ? const TextScaler.linear(1.0) : null,
      overflow: _isEllipsis ? TextOverflow.ellipsis : null,
      softWrap: true,
      style:
          _style ??
          TextStyle(
            color: color ?? AppColors.blackColor,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
          ),
      maxLines: maxLines,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
      ),
      textAlign: _align,
    );
  }
}
