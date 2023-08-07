part of '../widgets.dart';

class DefaultGapWidth extends StatelessWidget {
  const DefaultGapWidth({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
      );
}
