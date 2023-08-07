part of '../widgets.dart';

class DefaultGapHigh extends StatelessWidget {
  const DefaultGapHigh({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
      );
}
