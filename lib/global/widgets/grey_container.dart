part of '../widgets.dart';

class GreyContainer extends StatelessWidget {
  final Widget child;
  const GreyContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            vertical: 24, horizontal: AppConstant.defaultPadding),
        decoration: BoxDecoration(
            color: AppColor.scaffoldColorReverse,
            borderRadius: BorderRadius.circular(8)),
        child: child,
      );
}
