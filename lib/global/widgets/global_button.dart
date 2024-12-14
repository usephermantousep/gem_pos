part of "package:gempos/global/widgets.dart";

class GlobalButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  final double width;
  final bool? isDisabled;
  final GButtonStyle buttonStyle;
  final Color? backgroundColor;
  final Color? color;
  final double? height;
  final double? fontSize;
  final Icon? icon;

  const GlobalButton(
      {super.key,
      required this.onPressed,
      this.title,
      required this.width,
      this.isDisabled,
      this.buttonStyle = GButtonStyle.primary,
      this.backgroundColor,
      this.color,
      this.height,
      this.fontSize,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: !(isDisabled ?? false) ? onPressed : null,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tightFor(width: width, height: height ?? 38),
        decoration: BoxDecoration(
            color: switch (buttonStyle) {
              GButtonStyle.primary => isDisabled ?? false
                  ? const Color(0xFF303030)
                  : backgroundColor ?? Theme.of(context).primaryColor,
              GButtonStyle.secondary => isDisabled ?? false
                  ? const Color(0xFF303030)
                  : backgroundColor ?? Colors.transparent,
              GButtonStyle.textOnly => Colors.transparent
            },
            borderRadius: BorderRadius.circular(6),
            border: (isDisabled ?? false) ||
                    buttonStyle == GButtonStyle.textOnly ||
                    buttonStyle == GButtonStyle.primary
                ? const Border()
                : Border.all(color: color ?? Theme.of(context).primaryColor)),
        child: icon ??
            Text(
              title ?? '-',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDisabled ?? false
                      ? const Color(0xFF747474)
                      : buttonStyle == GButtonStyle.primary
                          ? color ?? Colors.white
                          : color ?? Theme.of(context).primaryColor,
                  fontSize: fontSize),
            ),
      ),
    );
  }
}

enum GButtonStyle { primary, secondary, textOnly }
