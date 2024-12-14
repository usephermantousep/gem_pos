part of "package:gempos/global/widgets.dart";

class GlobalDialog<T> extends Equatable {
  final String title;
  final String? message;
  final bool isError;
  final Widget centerWidget;
  final Widget? actions;
  final bool isDismissable;
  final bool isCustomMessage;
  final Widget? customMessage;

  const GlobalDialog(
      {required this.title,
      this.message,
      this.isError = false,
      required this.centerWidget,
      this.actions,
      this.isDismissable = false,
      this.isCustomMessage = false,
      this.customMessage});

  static Future<T?> showDefaultError<T>(String message, BuildContext context,
      {int popTimes = 1}) async {
    return await GlobalDialog<T>(
            title: 'Error',
            isError: true,
            centerWidget: Icon(
              Icons.warning_rounded,
              size: 100,
              color: WidgetHelper.defaultRed,
            ),
            actions: GlobalButton(
              onPressed: () {
                for (var i = 0; i < popTimes; i++) {
                  Navigator.of(context).pop();
                }
              },
              title: 'Tutup',
              fontSize: 15,
              height: 45,
              width: double.infinity,
            ),
            message: message)
        .show(context);
  }

  static Future<T?> showDefaultLoading<T>(BuildContext context) async {
    return await GlobalDialog<T>(
            title: 'Loading ...',
            centerWidget: const CircularProgressIndicator.adaptive(),
            message: 'Sedang diproses oleh sistem',
            isDismissable: false)
        .show(context);
  }

  static Future<T?> showConfirmation<T>(BuildContext context) async {
    return await GlobalDialog<T>(
        centerWidget: Icon(
          Icons.question_mark_rounded,
          color: Theme.of(context).primaryColor,
          size: 80,
        ),
        title: 'Konfirmasi',
        message: 'Batal',
        actions: Column(
          children: [
            GlobalButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                title: 'Konfirmasi',
                fontSize: 15,
                height: 50,
                width: double.infinity),
            WidgetHelper.defaultGapHeight,
            GlobalButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                title: 'Batal',
                fontSize: 15,
                height: 50,
                buttonStyle: GButtonStyle.textOnly,
                width: double.infinity)
          ],
        )).show(context);
  }

  static Future<T?> showDefaultSuccess<T>(BuildContext context,
      {String message = 'Success', int popTimes = 1}) async {
    return await GlobalDialog<T>(
        centerWidget: Icon(
          Icons.check_rounded,
          color: WidgetHelper.defaultGreen,
          size: 80,
        ),
        message: message,
        title: 'Berhasil',
        actions: GlobalButton(
          onPressed: () {
            for (var i = 0; i < popTimes; i++) {
              Navigator.of(context).pop(i == popTimes - 1 ? true : null);
            }
          },
          title: 'Tutup',
          width: double.infinity,
          height: 50,
          fontSize: 15,
        )).show(context);
    // await dialog.show(context);
  }

  Future<T> show(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: isDismissable,
      // useRootNavigator: true,
      useSafeArea: true,
      builder: (context) => PopScope(
        canPop: isDismissable,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   alignment: Alignment.center,
              //   padding: const EdgeInsets.symmetric(vertical: 4),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       color: isError ? Theme.of(context).colorScheme.error : WidgetHelper.defaultGreen,
              //       borderRadius: const BorderRadius.vertical(top: Radius.circular(8))),
              //   child: Text(
              //     title,
              //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              //   ),
              // ),
              Padding(
                // height: 80,
                // width: 80,
                padding: EdgeInsets.symmetric(vertical: WidgetHelper.defaultPaddingSize * 4),
                child: centerWidget,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 4),
                width: double.infinity,
                // decoration: BoxDecoration(
                //     color: isError ? Theme.of(context).colorScheme.error : WidgetHelper.defaultGreen,
                //     borderRadius: const BorderRadius.vertical(top: Radius.circular(8))),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (message != null || customMessage != null)
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: WidgetHelper.defaultPaddingSize * 2, vertical: 8),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: isCustomMessage
                      ? customMessage ?? const SizedBox()
                      : Text(
                          message!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: WidgetHelper.defaultDarkGrey),
                          textAlign: TextAlign.center,
                        ),
                ),
              actions != null
                  ? Padding(
                      padding: EdgeInsets.all(WidgetHelper.defaultPaddingSize * 2),
                      child: actions!,
                    )
                  : WidgetHelper.defaultGapHeight,
              // WidgetHelper.defaultGapHeight
            ],
          ),
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
        title,
        message,
        centerWidget,
        isError,
        actions,
      ];
}
