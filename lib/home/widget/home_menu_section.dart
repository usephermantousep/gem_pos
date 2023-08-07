part of 'package:gem_pos/global/widgets.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(AppConstant.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColor.bgColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstant.defaultPadding))),
      child: GetBuilder<HomeController>(
        builder: (controller) => GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          padding: const EdgeInsets.all(AppConstant.defaultPadding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppConstant.defaultPadding / 2,
            mainAxisSpacing: AppConstant.defaultPadding / 2,
          ),
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstant.defaultPadding),
            decoration: const BoxDecoration(
                color: AppColor.scaffoldColorReverse,
                borderRadius: BorderRadius.all(
                    Radius.circular(AppConstant.defaultPadding))),
            child: GestureDetector(
              onTap: controller.homeState.value.menus[index].ontap,
              child: Column(
                children: [
                  Expanded(
                    child: controller.homeState.value.menus[index].icon,
                  ),
                  Text(
                    '${controller.homeState.value.menus[index].title} ',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          itemCount: controller.homeState.value.menus.length,
        ),
      ),
    ));
  }
}
