part of '../widgets.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.ontap, required this.label});
  final String label;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        onPressed: ontap,
        backgroundColor: AppColor.bgColor,
        label: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColor.scaffoldColorReverse),
        ),
      );
}
