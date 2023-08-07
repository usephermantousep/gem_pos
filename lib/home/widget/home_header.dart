part of 'package:gem_pos/global/widgets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 56,
          width: 56,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(AppConstant.defaultPadding),
          decoration: const BoxDecoration(
            boxShadow: AppConstant.defaultBoxShadow,
            color: AppColor.bgColor,
            shape: BoxShape.circle,
          ),
          child: GetBuilder<HomeController>(
            builder: (con) => Text(
              con.homeState.value.user?.name
                      .split(' ')
                      .map((e) => e[0])
                      .join()
                      .toUpperCase() ??
                  '-',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColor.scaffoldColorReverse),
            ),
          ),
        ),
        Expanded(
          child: GetBuilder<HomeController>(
            builder: (con) {
              final state = con.homeState.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user?.name.toUpperCase() ?? '-',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${state.user?.branch.name} - ${state.user?.role.name}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
